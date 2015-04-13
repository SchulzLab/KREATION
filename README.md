##About
De novo assembly of short read sequences is one of the most used methods to study the RNA-seq. Common applications include sequencing of non-model organisms, cancer or meta transcriptomes. Most of these assemblers use the de Bruijn graph (DBG) as the underlying data structure. A fundamental parameter with large influence on  assembly quality with DBGs is the exact word length k. As such no single kmer value leads to optimal results. Instead, DBGs over different k-mer values are build and the assemblies merged to improve sensitivity. In most of the cases a suboptimal selection of kmer values is used by practitioners which results in suboptimal assembly.

We introduce KREATION (Kmer Range EstimATION) algorithm. Given a minimum k value to start, KREATION calculates the contribution of each assembly. KREATION stops at a kmer value at which no further assemblies are required.

#####Version
Version 0.1

#####Contact
For questions or suggestions regarding KREATION please contact

* Dilip A Durai (ddurai_at_contact.mmci.uni-saarland.de)
* Marcel H Schulz (mschulz_at_mmci.uni-saarland.de)

##Requirements
* cd-hit : clustering software which uses greedy algorithm to iteratively grow clusters. The software can be downloaded from http://weizhongli-lab.org/cd-hit/

##Download
The software can be downloaded by using the following command
```
	git clone https://github.com/SchulzLab/KREATION
```

The downloaded folder should contain the following files/folder:
*	KREATION.py
*	config.txt
*	oases(folder)
*	src(folder)

##KREATION parameters

`python KREATION.py --help`

short | long params | explanation | note
-----------|------------|--------|---------
-h | --help | show the help on screen |
-c | --config | path to the config file (only text file) | required parameter
-r | --read | read length | required parameter
-s | --step |  kmer step size for the assembly process | default=2
-o | --out  | path to the output directory, directory will be created if non-existent | default=KREATION folder 

##Config file structure
* Line 1: Name of the program to be run
* Line 2: Output file name from the assembly
* Line 3: paramater name and the value of the min kmer
* Line 4: Rest of the command 
* Line 5: parameter name for the max kmer (leave as blank if there is none)

####Example Run

We use the dataset MAQC UHR (SRX016367) downloaded from SRA run database (http://www.ncbi.nlm.nih.gov/sra/SRX016367[accn]) for this test run. The dataset has been errro corrected using SEECER error correction algorithm

* Config file for oases assembler
```
#Program Name
**oases_pipeline.py
#Output file name
**transcripts.fa
#Minimum K
-m 21
#Rest of the command
-d "/path-to-the-fasta-file/MAQC_Combined.fasta_corrected.fa" -p ""
#Max k
-M
```   
Note: To use oases assembler please use the oases pipeline script provided with this package. For this type the following command in your command prompt:
```
export PATH=/path-to-KREATION/oases/:$PATH
```

* Config file for SOAPTrans assembler

```
#Program Name
**SOAPdenovo-Trans-127mer all
#Output file name
**transcripts.contig
#Minimum K
-K 21
#Rest of the command
-s /MMCI/MS/DeNovoAssembly/work/SOS/Software/SOAPdenovo2-bin-LINUX-generic-r240/example.config -p 4 -o transcripts
```

* Running KREATION
```
 	export PATH=/path-to-KREATION/:$PATH
```

```
	export PATH=/path to cd-hit/:$PATH
```

`python KREATION.py -c config_file.txt -o complete/path/outputDirectory -s 2 -r 35`

* Output folder
The output folder should contain three sub folders with the following names:
** Assembly (contains the assembly generated from each kmer)
** Cluster (contains the clustering results)
** Final (contains the final assembly and a report file) 

