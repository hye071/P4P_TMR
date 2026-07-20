$begin 'Profile'
	$begin 'ProfileGroup'
		MajorVer=2023
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '07/20/2026 20:08:10')
			I(1, 'Host', 'EN461007')
			I(1, 'Processor', '16')
			I(1, 'OS', 'NT 10.0')
			I(1, 'Product', 'Maxwell 3D 2023.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:00:06')
			I(1, 'ComEngine Memory', '56.5 M')
		$end 'TotalInfo'
		GroupOptions=8
		TaskDataOptions(Memory=8)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Executing From\', \'C:\\\\Program Files\\\\AnsysEM\\\\v232\\\\Win64\\\\MAXWELLCOMENGINE.exe\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2023
			MinorVer=2
			Name='HPC'
			$begin 'StartInfo'
				I(1, 'Type', 'Manual')
				I(1, 'Distribution Types', 'Variations, Frequencies')
				I(1, 'MPI Vendor', 'Intel')
				I(1, 'MPI Version', '2018')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(0, ' ')
			$end 'TotalInfo'
			GroupOptions=0
			TaskDataOptions(Memory=8)
			ProfileItem('Machine', 0, 0, 0, 0, 0, 'I(4, 1, \'Name\', \'EN461007.UoA.auckland.ac.nz\', 3, \'RAM Limit\', 90, \'%f%%\', 2, \'Tasks\', 1, false, 2, \'Cores\', 4, false)', false, true)
		$end 'ProfileGroup'
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(3, 1, \'Level\', \'Perform full validations\', 1, \'Elapsed Time\', \'00:00:00\', 2, \'Memory\', 56908, true)', false, true)
		$begin 'ProfileGroup'
			MajorVer=2023
			MinorVer=2
			Name='Initial Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '07/20/2026 20:08:10')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:00')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			ProfileItem('Mesh', 0, 0, 0, 0, 26760, 'I(2, 1, \'Type\', \'Phi\', 2, \'Tetrahedra\', 79, false)', true, true)
			ProfileItem('Post', 0, 0, 0, 0, 28100, 'I(2, 2, \'Tetrahedra\', 79, false, 2, \'Cores\', 1, false)', true, true)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2023
			MinorVer=2
			Name='Adaptive Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '07/20/2026 20:08:10')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:05')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions(Memory=8)
			$begin 'ProfileGroup'
				MajorVer=2023
				MinorVer=2
				Name='Pass 1'
				$begin 'StartInfo'
					I(0, '')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 110, 'I(4, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 169, false, 1, \'Disk\', \'0KB\')', true, true)
				ProfileItem('adapt', 0, 0, 0, 0, 30752, 'I(1, 2, \'Tetrahedra\', 79, false)', true, true)
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2023
				MinorVer=2
				Name='Pass 2'
				$begin 'StartInfo'
					I(0, '')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 23620, 'I(2, 2, \'Tetrahedra\', 107, false, 2, \'Cores\', 1, false)', true, true)
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 156, 'I(4, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 218, false, 1, \'Disk\', \'0KB\')', true, true)
				ProfileItem('adapt', 0, 0, 0, 0, 31552, 'I(1, 2, \'Tetrahedra\', 107, false)', true, true)
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2023
				MinorVer=2
				Name='Pass 3'
				$begin 'StartInfo'
					I(0, '')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 23548, 'I(2, 2, \'Tetrahedra\', 144, false, 2, \'Cores\', 1, false)', true, true)
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 190, 'I(4, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 281, false, 1, \'Disk\', \'0KB\')', true, true)
				ProfileItem('adapt', 0, 0, 0, 0, 31536, 'I(1, 2, \'Tetrahedra\', 144, false)', true, true)
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2023
				MinorVer=2
				Name='Pass 4'
				$begin 'StartInfo'
					I(0, '')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 23716, 'I(2, 2, \'Tetrahedra\', 190, false, 2, \'Cores\', 1, false)', true, true)
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 291, 'I(4, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 355, false, 1, \'Disk\', \'0KB\')', true, true)
				ProfileItem('adapt', 0, 0, 0, 0, 32048, 'I(1, 2, \'Tetrahedra\', 190, false)', true, true)
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2023
				MinorVer=2
				Name='Pass 5'
				$begin 'StartInfo'
					I(0, '')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 23796, 'I(2, 2, \'Tetrahedra\', 249, false, 2, \'Cores\', 1, false)', true, true)
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 393, 'I(4, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 452, false, 1, \'Disk\', \'0KB\')', true, true)
				ProfileItem('adapt', 0, 0, 0, 0, 32904, 'I(1, 2, \'Tetrahedra\', 249, false)', true, true)
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2023
				MinorVer=2
				Name='Pass 6'
				$begin 'StartInfo'
					I(0, '')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 23852, 'I(2, 2, \'Tetrahedra\', 331, false, 2, \'Cores\', 1, false)', true, true)
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 586, 'I(4, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 572, false, 1, \'Disk\', \'0KB\')', true, true)
				ProfileItem('adapt', 0, 0, 0, 0, 33516, 'I(1, 2, \'Tetrahedra\', 331, false)', true, true)
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2023
				MinorVer=2
				Name='Pass 7'
				$begin 'StartInfo'
					I(0, '')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 23908, 'I(2, 2, \'Tetrahedra\', 440, false, 2, \'Cores\', 1, false)', true, true)
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 723, 'I(4, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 731, false, 1, \'Disk\', \'0KB\')', true, true)
				ProfileItem('adapt', 0, 0, 0, 0, 34360, 'I(1, 2, \'Tetrahedra\', 440, false)', true, true)
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2023
				MinorVer=2
				Name='Pass 8'
				$begin 'StartInfo'
					I(0, '')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 24200, 'I(2, 2, \'Tetrahedra\', 579, false, 2, \'Cores\', 1, false)', true, true)
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 1039, 'I(4, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 933, false, 1, \'Disk\', \'0KB\')', true, true)
				ProfileItem('adapt', 0, 0, 0, 0, 34932, 'I(1, 2, \'Tetrahedra\', 579, false)', true, true)
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2023
				MinorVer=2
				Name='Pass 9'
				$begin 'StartInfo'
					I(0, '')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 24492, 'I(2, 2, \'Tetrahedra\', 758, false, 2, \'Cores\', 1, false)', true, true)
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 1665, 'I(4, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 1203, false, 1, \'Disk\', \'0KB\')', true, true)
				ProfileItem('adapt', 0, 0, 0, 0, 36376, 'I(1, 2, \'Tetrahedra\', 758, false)', true, true)
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2023
				MinorVer=2
				Name='Pass 10'
				$begin 'StartInfo'
					I(0, '')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions(Memory=8)
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 24688, 'I(2, 2, \'Tetrahedra\', 993, false, 2, \'Cores\', 1, false)', true, true)
				ProfileItem('Matrix Solve', 0, 0, 0, 0, 2212, 'I(4, 1, \'Type\', \'DRS\', 2, \'Cores\', 4, false, 2, \'Matrix\', 1557, false, 1, \'Disk\', \'0KB\')', true, true)
				ProfileItem('adapt', 1, 0, 0, 0, 38200, 'I(1, 2, \'Tetrahedra\', 993, false)', true, true)
			$end 'ProfileGroup'
			ProfileFootnote('I(1, 0, \'Adaptive Passes did not converge\')', 1)
		$end 'ProfileGroup'
		ProfileFootnote('I(2, 1, \'Stop Time\', \'07/20/2026 20:08:16\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
	$begin 'ProfileGroup'
		MajorVer=2023
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '07/20/2026 20:10:01')
			I(1, 'Host', 'EN461007')
			I(1, 'Processor', '16')
			I(1, 'OS', 'NT 10.0')
			I(1, 'Product', 'Maxwell 3D 2023.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:00:00')
			I(1, 'ComEngine Memory', '52.7 M')
		$end 'TotalInfo'
		GroupOptions=8
		TaskDataOptions(Memory=8)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Executing From\', \'C:\\\\Program Files\\\\AnsysEM\\\\v232\\\\Win64\\\\MAXWELLCOMENGINE.exe\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2023
			MinorVer=2
			Name='HPC'
			$begin 'StartInfo'
				I(1, 'Type', 'Manual')
				I(1, 'Distribution Types', 'Variations, Frequencies')
				I(1, 'MPI Vendor', 'Intel')
				I(1, 'MPI Version', '2018')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(0, ' ')
			$end 'TotalInfo'
			GroupOptions=0
			TaskDataOptions(Memory=8)
			ProfileItem('Machine', 0, 0, 0, 0, 0, 'I(4, 1, \'Name\', \'EN461007.UoA.auckland.ac.nz\', 3, \'RAM Limit\', 90, \'%f%%\', 2, \'Tasks\', 1, false, 2, \'Cores\', 4, false)', false, true)
		$end 'ProfileGroup'
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(3, 1, \'Level\', \'Perform full validations\', 1, \'Elapsed Time\', \'00:00:00\', 2, \'Memory\', 53040, true)', false, true)
		ProfileFootnote('I(2, 1, \'Stop Time\', \'07/20/2026 20:10:01\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
	$begin 'ProfileGroup'
		MajorVer=2023
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '07/20/2026 20:10:21')
			I(1, 'Host', 'EN461007')
			I(1, 'Processor', '16')
			I(1, 'OS', 'NT 10.0')
			I(1, 'Product', 'Maxwell 3D 2023.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:00:00')
			I(1, 'ComEngine Memory', '52.8 M')
		$end 'TotalInfo'
		GroupOptions=8
		TaskDataOptions(Memory=8)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Executing From\', \'C:\\\\Program Files\\\\AnsysEM\\\\v232\\\\Win64\\\\MAXWELLCOMENGINE.exe\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2023
			MinorVer=2
			Name='HPC'
			$begin 'StartInfo'
				I(1, 'Type', 'Manual')
				I(1, 'Distribution Types', 'Variations, Frequencies')
				I(1, 'MPI Vendor', 'Intel')
				I(1, 'MPI Version', '2018')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(0, ' ')
			$end 'TotalInfo'
			GroupOptions=0
			TaskDataOptions(Memory=8)
			ProfileItem('Machine', 0, 0, 0, 0, 0, 'I(4, 1, \'Name\', \'EN461007.UoA.auckland.ac.nz\', 3, \'RAM Limit\', 90, \'%f%%\', 2, \'Tasks\', 1, false, 2, \'Cores\', 4, false)', false, true)
		$end 'ProfileGroup'
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(3, 1, \'Level\', \'Perform full validations\', 1, \'Elapsed Time\', \'00:00:00\', 2, \'Memory\', 53048, true)', false, true)
		ProfileFootnote('I(2, 1, \'Stop Time\', \'07/20/2026 20:10:21\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
$end 'Profile'
