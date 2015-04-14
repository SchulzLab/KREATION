##About
De novo assembly of short read sequences is one of the most used methods to study the RNA-seq. Common applications include sequencing of non-model organisms, cancer or meta transcriptomes. Most of these assemblers use the de Bruijn graph (DBG) as the underlying data structure. A fundamental parameter with large influence on  assembly quality with DBGs is the exact word length k. As such no single kmer value leads to optimal results. Instead, DBGs over different k-mer values are build and the assemblies merged to improve sensitivity. In most of the cases a suboptimal selection of kmer values is used by practitioners which results in suboptimal assembly.

We introduce KREATION (Kmer Range EstimATION) algorithm. Given a minimum k value to start, KREATION calculates the contribution of each assembly. KREATION stops at a kmer value at which no further assemblies are required.

#####Algorithm
```
1.	Input : read_length l, step_size s, minimum_k km
2. 	k=km
3.	i=1
4.	last=1
5.	Tp=null
5.	repeat
6. 		Tk = Assembly(k)
7. 		C = Cluster(Tp,Tk)
8. 		ci = log(extended(C,Tk))
9. 		M0 = linear_model((k1,c1),(k2,c2),...,(ki,ci),B0)
10.		M1 = linear_model((k1,c1),(k2,c2),...,(ki,ci),B0,B1)
11.		p = F_statistics(Mo,M1)
12.		if(p<last)
13.			break
14.		else
15.			k = k+s
16.			i++
17.			Tp = Tp U Tk
18.			last = p
19.		end if
20.	until k<=l 
```

#####Version
Version 0.1

#####Tested assemblers
KREATION has been tested on the following assemblers

1. [Oases 0.2] (http://www.ebi.ac.uk/~zerbino/oases/)
2. [SOAPdenovo-Trans] (http://soap.genomics.org.cn/SOAPdenovo-Trans.html)
3. [Trans-ABySS 1.5.2] (http://www.bcgsc.ca/platform/bioinfo/software/trans-abyss)

#####Contact
For questions or suggestions regarding KREATION please checkout the [FAQ](https://github.com/SchulzLab/KREATION/blob/master/FAQ.md) or contact

* Dilip A Durai (ddurai_at_contact.mmci.uni-saarland.de)
* Marcel H Schulz (mschulz_at_mmci.uni-saarland.de)

##Requirements
* [cd-hit](http://weizhongli-lab.org/cd-hit/)
* R (version >=2.14.1)
* knitR
* Python
* Perl

##Download
The software can be downloaded by using the following command
```
	git clone https://github.com/SchulzLab/KREATION
```

The downloaded folder should contain the following files/folder:
*	KREATION.py
*	config.txt
*	Oases(folder)
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
oases_pipeline_2.py
#Output file name
transcripts.fa
#Minimum K
-m 21
#Rest of the command
-d "/path-to-the-fasta-file/MAQC_Combined.fasta_corrected.fa" -p ""
```   
Note: The current version has an inbuilt merge function. Also the default value for max kmer is 31. To avoid this KREATION requires that the users use the modified version of oases pipeline (supplied with this package). To do this type the following command in your terminal.
```
export PATH=/path-to-KREATION/Oases/:$PATH
```
The modified version does not require a max kmer value and also does not implement the oases merge function. 

* Config file for SOAPTrans assembler

```
#Program Name
SOAPdenovo-Trans-127mer all
#Output file name
transcripts.contig
#Minimum K
-K 21
#Rest of the command
-s /path-to-config-file/example.config -p 4 -o transcripts
```

* Config file for Trans-ABySS
```
#Program Name
transabyss
#Output file name
transabyss-final.fa
#minimum K
-k 21
#rest of the command
--se "/path-to-the-fasta-file/MAQC_Combined.fasta_corrected.fa" --length 100 --threads 10
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
	* Assembly (contains the assembly generated from each kmer)
	* Cluster (contains the clustering results)
	* Final (contains the final assembly and a report file) 

