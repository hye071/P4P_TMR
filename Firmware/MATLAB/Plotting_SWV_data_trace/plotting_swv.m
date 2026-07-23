%% Parse and plot an SWV Data Trace export (History section)
% Reads a semicolon-delimited SWV trace export (the kind STM32CubeIDE's
% "SWV Data Trace" view produces) and plots the watched value vs. time.
%
% Only the rows under the "SWV Data Trace - History" header carry real
% data; everything above that (the "Watch" section) is just the live
% variable name/snapshot and is skipped.
%
% Each data row looks like:
%   "WRITE";"0.0064453124";"";"89119";"524.229412 µs"
%      1          2          3    4          5
% Field 1 = access type ("WRITE") -> not needed for the plot, just used
%           as a sanity filter in case any other access type ever appears.
% Field 2 = the watched value -> Y axis.
% Field 3 = always empty -> ignored.
% Field 4 = core-clock cycle count -> not plotted, only used to help spot
%           corrupted rows (see below).
% Field 5 = elapsed time, printed with a unit that changes through the
%           file (µs, then ms, then s) -> converted to seconds -> X axis.

clear; clc; close all;

%% ---- User setting ----
filename = 'swv_trace.txt';   % <-- change this if the file lives elsewhere

%% ---- Read the file as raw bytes ----
% The export is ISO-8859-1 (Latin-1) encoded -- that's the encoding behind
% the "µs" micro sign. Rather than depend on fopen's encoding name/version
% support, read raw bytes and blank out anything non-ASCII (byte > 127)
% before converting to char. This can only affect the micro sign itself:
% C/C++ variable names (the "Watch" section) are ASCII-only by language
% rules, and every other field in this file is plain digits/letters/
% punctuation, so nothing meaningful is lost. It also keeps the text pure
% ASCII, which sidesteps regexp errors some MATLAB/Octave versions raise
% on non-UTF-8 byte sequences when a µs row is scanned along with
% everything else in one pass.
fid = fopen(filename, 'rb');
if fid == -1
    error('parse_swv_trace:fileNotFound', 'Could not open file: %s', filename);
end
rawBytes = fread(fid, Inf, '*uint8')';
fclose(fid);
rawBytes(rawBytes > 127) = uint8('u');   % µ (and any stray non-ASCII byte) -> 'u'
txt = char(rawBytes);

% Split into individual lines (robust to CRLF, LF, or lone CR line endings)
fileLines = regexp(txt, '\r\n|\r|\n', 'split');

%% ---- Grab the watched variable's name, for a nicer plot label ----
% "SWV Data Trace - Watch" section looks like:  "0";"voltage_difference";"0.011279297"
varName = 'Value';
watchIdx = find(~cellfun(@isempty, regexp(fileLines, 'SWV Data Trace - Watch', 'once')), 1, 'first');
if ~isempty(watchIdx) && watchIdx + 1 <= numel(fileLines)
    wtoks = regexp(fileLines{watchIdx + 1}, '"([^"]*)"', 'tokens');
    wflds = [wtoks{:}];
    if numel(wflds) >= 2 && ~isempty(wflds{2})
        varName = wflds{2};
    end
end

%% ---- Isolate everything below "SWV Data Trace - History" ----
histIdx = find(~cellfun(@isempty, regexp(fileLines, 'SWV Data Trace - History', 'once')), 1, 'first');
if isempty(histIdx)
    error('parse_swv_trace:noHistory', ...
        'Could not find the "SWV Data Trace - History" marker in %s', filename);
end
dataLines = fileLines(histIdx + 1:end);
dataLines = dataLines(~cellfun(@(s) isempty(strtrim(s)), dataLines));   % drop blank lines
dataBlock = strjoin(dataLines, newline);

%% ---- Parse all rows in one pass ----
rowPattern = '"([^"]*)";"([^"]*)";"([^"]*)";"([^"]*)";"([^"]*)"';
toks = regexp(dataBlock, rowPattern, 'tokens');
nRows = numel(toks);
if nRows == 0
    error('parse_swv_trace:noRows', 'No data rows matched under the History header.');
end
if nRows ~= numel(dataLines)
    warning('parse_swv_trace:rowMismatch', ...
        '%d line(s) under the History header did not match the expected 5-field format and were skipped.', ...
        numel(dataLines) - nRows);
end

allFields = reshape([toks{:}], 5, nRows)';   % nRows x 5 cell array of strings

accessCol = allFields(:, 1);
value     = str2double(allFields(:, 2));     % element 2: the plotted value
cycles    = str2double(allFields(:, 4));     % element 3 (cycles), kept for reference
timeRaw   = allFields(:, 5);                 % element 4: time string with unit

% Keep only WRITE rows (the access type to "ignore" -- i.e. don't treat
% any other access type, e.g. READ, as a value update)
isWrite = strcmpi(strtrim(accessCol), 'WRITE');
if any(~isWrite)
    fprintf('Ignoring %d non-WRITE row(s).\n', sum(~isWrite));
end
value   = value(isWrite);
cycles  = cycles(isWrite);
timeRaw = timeRaw(isWrite);

%% ---- Convert the time column to seconds, regardless of its unit ----
timeToks = regexp(strtrim(timeRaw), '^([\d.\-]+)\s*(\S+)$', 'tokens', 'once');
timeNum  = cellfun(@(c) str2double(c{1}), timeToks);
timeUnit = cellfun(@(c) c{2}, timeToks, 'UniformOutput', false);

scale = repmat(1e-6, numel(timeNum), 1);   % default: microseconds (µs/us/μs -- any byte encoding)
scale(strcmp(timeUnit, 'ms')) = 1e-3;
scale(strcmp(timeUnit, 's'))  = 1;
scale(strcmp(timeUnit, 'ns')) = 1e-9;      % not present in this file, handled just in case
timeS = timeNum(:) .* scale;

fprintf('Parsed %d WRITE rows spanning %.6f s to %.6f s.\n', numel(timeS), timeS(1), timeS(end));

%% ---- Drop dropped-packet glitch rows ----
% SWV captures can occasionally emit a single corrupted row where the
% cycle counter AND the timestamp both read back as exactly 0 in the
% middle of an otherwise steadily climbing trace (a dropped trace
% packet). Left in, they'd show up as a spike back to t=0 in the line
% plot, so they're detected and removed here.
isGlitch = (cycles == 0) & (timeS == 0);
if any(isGlitch)
    fprintf('Removed %d dropped-packet glitch row(s) at row index/indices: %s\n', ...
        sum(isGlitch), mat2str(find(isGlitch)'));
end
value  = value(~isGlitch);
cycles = cycles(~isGlitch);
timeS  = timeS(~isGlitch);

%% ---- Plot value vs time ----
figure;
plot(timeS, value, '-');
xlabel('Time (s)');
ylabel(varName, 'Interpreter', 'none');
title(sprintf('SWV Trace: %s vs Time', varName), 'Interpreter', 'none');
grid on;
