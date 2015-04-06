Config file structure
Line 1: Name of the program to be run
Line 2: Output file name from the assembly
Line 3: paramater name and the value of the min kmer
Line 4: parameter name for the max kmer (optional)
Line 5: Rest of the command 


To run the software:
*Update the config file
*run the following commands 
	export PATH=/path-to-KREATION/:$PATH
	export PATH=/path to cd-hit/:$PATH
*to run oases pipeline:
	export PATH=/path-to-KREATION/oases:$PATH
*run the command
	python KREATION.py -c config_file_path/config.txt -s step_size -r read_length -o Output_file