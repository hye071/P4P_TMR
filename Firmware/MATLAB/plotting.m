clear; clc; close all;

% 1. Read the raw matrix (readmatrix automatically ignores the text header line)
rawData = readmatrix('telemetry3.csv');

% 2. Strip out any accidental empty/NaN rows
rawData(any(isnan(rawData), 2), :) = [];

% 3. Extract the columns based on their position in your screenshot
timeMs  = rawData(:, 1); % Column 1: 0, 101, 202...
voltage = rawData(:, 2); % Column 2: 0.2836, 0.166...
current = rawData(:, 3); % Column 3: 6.553...

% 4. Convert the millisecond clock to true elapsed seconds
timeSeconds = timeMs / 1000;

% 5. Generate the Plots
figure('Color', [1 1 1], 'Position', [100, 100, 1000, 450]);

% Subplot 1: Floating Voltage
subplot(1, 2, 1);
plot(timeSeconds, voltage, '-b', 'LineWidth', 1.5);
title('Voltage vs. Time');
xlabel('Time (Seconds)');
ylabel('Voltage (V)');
grid on;

% Subplot 2: INA219 Current
subplot(1, 2, 2);
plot(timeSeconds, current, '-r', 'LineWidth', 1.5);
title('INA219 Current vs. Time');
xlabel('Time (Seconds)');
ylabel('Current (A)');
grid on;

sgtitle('PCB Test Bench Telemetry Log', 'FontWeight', 'bold');