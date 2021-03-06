## About
De novo transcriptome assembly of short read sequences is an important ingredient to many RNA-seq analyses. Common applications include sequencing of non-model organisms, cancer or meta transcriptomes. Most of these assemblers use the de Bruijn graph (DBG) as the underlying data structure. A fundamental parameter with large influence on assembly quality with DBGs is the exact word length k. As such no single kmer value leads to optimal results which has led to the wide acceptance of multi-kmer transcriptome assemblers. For these, DBGs over different k-mer values are build and the assemblies merged to improve sensitivity. In most of the cases a suboptimal selection of kmer values is used by practitioners which results in suboptimal assembly.

We introduce the KREATION (Kmer Range EstimATION) algorithm. Given a minimum k value to start, KREATION calculates the contribution of each assembly. KREATION stops at a kmer value at which no further assemblies are required thereby removing the kmer selection problem of the user and potentially saving hours of runtime for kmers not contributing to the final merged assembly.

##### Algorithm
```
1.	Input : read_length l, step_size s, minimum_k km, threshold t
2. 	Initializations : k=km
3.	                  i=1
4.	                  last=0
5.	                  Tp=null
6.	Steps:
              repeat
7. 		          Tk = Assembly(k)                            #Perform assembly for a single value k
8. 		          C =  Cluster(Tp,Tk)                         #Cluster the assembly with previous assemblies
9. 		          ci = log(extended(C,Tk))                    #Calculate number of extended clusters
10. 		          M0 = lm((k1,c1),...,(k(i-1),c(i-1)))        #Fit a linear model till k values of i-1th iteration 
11.		          p =  d_score(M0,last)                       #compute the d_score for the current iteration
12.		          if(p>d_score)                               #check for the cut-off
13.			             break
14.		          else                                        #Update the variables
15.			             k = k+s
16.			             i++
17.			             Tp = Tp U Tk
18.			             last = last + p
19.		          end if
20.	till k<=l 
```

##### Version
Version 0.1

##### Tested assemblers
KREATION has been tested on the following assemblers (see below for configuration)

1. [Oases 0.2](http://www.ebi.ac.uk/~zerbino/oases/)
2. [SOAPdenovo-Trans](http://soap.genomics.org.cn/SOAPdenovo-Trans.html)
3. [Trans-ABySS 1.5.2](http://www.bcgsc.ca/platform/bioinfo/software/trans-abyss)

##### Contact
For questions or suggestions regarding KREATION please checkout the [FAQ](https://github.com/SchulzLab/KREATION/blob/master/FAQ.md) or contact

* Dilip A Durai (ddurai_at_contact.mmci.uni-saarland.de)
* Marcel H Schulz (mschulz_at_mmci.uni-saarland.de)

## Requirements
* [cd-hit](http://weizhongli-lab.org/cd-hit/)
* R (version >=2.14.1)

## Download
The software can be downloaded by using the following command
```
	git clone https://github.com/SchulzLab/KREATION
```

The downloaded folder should contain the following files/folder:
*	KREATION.py
*	config.txt
*	Oases(folder)
*	src(folder)

## KREATION parameters

`python KREATION.py --help`

short | long params | explanation | note
-----------|------------|--------|---------
-h | --help | show the help on screen |
-c | --config | path to the config file (only text file) | required parameter
-r | --read | read length | required parameter
-s | --step |  kmer step size for the assembly process | default=2
-o | --out  | path to the output directory, directory will be created if non-existent | default=KREATION folder 
-t | --threshold | Threshold value for d_score | default=0.01

## Config file structure
* Line 1: Name of the program to be run
* Line 2: Output file name from the assembly
* Line 3: paramater name and the value of the min kmer
* Line 4: Rest of the command 
* Line 5: parameter name for the max kmer (leave as blank if there is none)

#### Example Run

We use the dataset MAQC UHR (SRX016367) downloaded from SRA run database (http://www.ncbi.nlm.nih.gov/sra/SRX016367[accn]) for this test run. The dataset has been error corrected using the [SEECER](http://sb.cs.cmu.edu/seecer/) error correction algorithm.

**NOTE**: Below we give some example config files for some of the assemblers we tested KREATION with. However, we ask you to consult the manual files of the assemblers for exact parametrization.

##### Config file for oases assembler
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
If the input file is a fastq file:
```
#Program Name
oases_pipeline_2.py
#Output file name
transcripts.fa
#Minimum K
-m 21
#Rest of the command
-d "-fastq /path-to-the-fasta-file/MAQC_Combined.fq" -p ""
```   

Note: The current version has an inbuilt merge function. Also the default value for max kmer is 31. To avoid this KREATION requires that the users use the modified version of oases pipeline (supplied with this package). To do this type the following command in your terminal.
```
export PATH=/path-to-KREATION/Oases/:$PATH
```
The modified version does not require a max kmer value and also does not implement the oases merge function. 

##### Config file for SOAPdenovo-Trans assembler

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

##### Config file for Trans-ABySS
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

##### Running KREATION
```
 	export PATH=/path-to-KREATION/:$PATH
```

```
	export PATH=/path to cd-hit/:$PATH
```

`python KREATION.py -c config_file.txt -o complete/path/outputDirectory -s 2 -r 35`

##### Output folder

The output folder should contain three sub folders with the following names:

* Assembly (contains the assembly generated from each kmer)
* Cluster (contains the clustering results)
* Final (contains the final assembly and a report file) 

## Citation
Please cite the paper as:

Durai DA, Schulz MH. (Apr 2016) Informed kmer selection for de novo transcriptome assembly. *Bioinformatics*  [doi:10.1093/bioinformatics/btw217](http://bioinformatics.oxfordjournals.org/content/early/2016/04/27/bioinformatics.btw217.short?rss=1)
