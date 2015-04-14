## Frequently Asked Questions

#### Why should I use KREATION?
- Most of these assemblers use the de Bruijn graph (DBG) as the underlying data structure. A fundamental parameter with large influence on  assembly quality with DBGs is the exact word length k. As such no single kmer value leads to optimal results. Instead, DBGs over different k-mer values are build and the assemblies merged to improve sensitivity. In most of the cases a suboptimal selection of kmer values is used by practitioners which results in suboptimal assembly.
KREATION or Kmer Range EstiMATION is an algorithm which predicts the best stopping point for the assembler (refer to the paper for more details). KREATION is meant to ease the use of multi-kmer assemblers (as the user does not need to guess which kmers are important for a dataset) and can lead to substantial runtime savings compared to running all possible kmer values.

#### Does it predict the starting kmer?
- The prediction of the starting kmer is currently not supported by KREATION. We are working on that and will include it in the future version of KREATION

#### In the paper reads are error corrected with SEECER before using KREATION. Is it necessary to run KREATION?
- No error correction before running KREATION is not necessary, but we recommend to error correct reads nevertheless, as it leads to improved assembly results.

#### Will KREATION work for genome assembly?
- No. Its not meant for genome assembly. KREATION was designed for de novo transcriptome assembly. It may work for metagenome assembly where non-uniform abundance and redundant contigs are present, but we have not tested it.
 
#### Why am I asked to use the modified version of the oases_pipeline script?
- KREATION should be considered a replacement for the oases_pipeline script, because the original oases_pipeline script has an inbuilt merge function and a default max kmer value of 31. The default max kmer value of 31 defeats the purpose of KREATION.  The modified version of the oases script (supplied with the package) does not affect the oases assembly itself. It just doesnt implement the oases merge function and also removes the max kmer parameter.

#### Which final merged assembly should I use?
-  Research of several groups has shown that the oases merge function still results in a large set of redundant transcripts, so we include a CD-HIT-EST for clustering of all assembled transcript in the final folder of KREATION.

#### KREATION is not working for my assembler. What should I do?
- KREATION is designed according to a general workflow which is followed by most assemblers. Note that by workflow we mean the way the assemblers interpret the parameters and store the output. There might be some assemblers which have a unique workflow. If your assembler falls in this category you can modify the code accordingly or send us an email and we will help you. 
*(This answer is based on a assumption that you used KREATION and updated the config files correctly)* 

#### How do I cite KREATION
cite as : Dilip A. Durai and Marcel H. Schulz. Informed kmer selection for de novo transcriptome assembly. submitted
