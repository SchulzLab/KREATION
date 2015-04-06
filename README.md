##About
**KREATION** is an algorithm for automatic estimation of kmer range for de novo transcriptome assembly.
It currently features:
* upper boundary estimation of kmer range for transcriptome assembly
* config file support to integrate it with many assembly softwares

#####Contact
For questions or suggestions regarding KREATION please contact

* Dilip A Durai (ddurai_at_contact.mmci.uni-saarland.de)
* Marcel H Schulz (mschulz_at_mmci.uni-saarland.de)

#####Version
Version 0.1

##Requirements
* cd-hit package (can be downloaded from http://weizhongli-lab.org/cd-hit/download.php)

##Config file structure
Line 1: Name of the program to be run
Line 2: Output file name from the assembly
Line 3: paramater name and the value of the min kmer
Line 4: parameter name for the max kmer (leave as blank if there is none)
Line 5: Rest of the command 

Example config file is given with this package.

##To run the software:
* Update the config file
* run the following commands
  ```
 	export PATH=/path-to-KREATION/:$PATH
  ```
  ```
	export PATH=/path to cd-hit/:$PATH
  ```
* to run oases pipeline for the assembly:
  ```
	export PATH=/path-to-KREATION/oases:$PATH
  ```
* run the command
  ```
	python KREATION.py -c config_file_path/config.txt -s step_size -r read_length -o Output_file
  ```
