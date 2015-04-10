##About
De novo assembly of short read sequences is one of the most used methods to study the RNA-seq. Common applications include sequencing of non-model organisms, cancer or meta transcriptomes. Most of these assemblers use the de Bruijn graph (DBG) as the underlying data structure. A fundamental parameter with large influence on  assembly quality with DBGs is the exact word length k. As such no single kmer value leads to optimal results. Instead, DBGs over different k-mer values are build and the assemblies merged to improve sensitivity. In most of the cases a suboptimal selection of kmer values is used by practitioners which results in suboptimal assembly.

We introduce KREATION (Kmer Range EstimATION) algorithm. Given a minimum k value to start, KREATION calculates the contribution of each assembly. KREATION stops at a kmer value at which no further assemblies are required.

#####Contact
For questions or suggestions regarding KREATION please contact

* Dilip A Durai (ddurai_at_contact.mmci.uni-saarland.de)
* Marcel H Schulz (mschulz_at_mmci.uni-saarland.de)

#####Version
Version 0.1

#####Download
The software can be downloaded by using the following command
```
	git clone https://github.com/SchulzLab/KREATION
```

The downloaded folder should contain the following files/folder:
*KREATION.py
*config.txt
*oases(folder)
*src(folder)

##Requirements
* cd-hit : clustering software which uses greedy algorithm to iteratively grow clusters. The software can be downloaded from http://weizhongli-lab.org/cd-hit/

##Config file structure
* Line 1: Name of the program to be run
* Line 2: Output file name from the assembly
* Line 3: paramater name and the value of the min kmer
* Line 4: parameter name for the max kmer (leave as blank if there is none)
* Line 5: Rest of the command 

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
