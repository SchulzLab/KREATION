## Frequently Asked Questions

#### Why should I use KREATION
- Most of these assemblers use the de Bruijn graph (DBG) as the underlying data structure. A fundamental parameter with large influence on  assembly quality with DBGs is the exact word length k. As such no single kmer value leads to optimal results. Instead, DBGs over different k-mer values are build and the assemblies merged to improve sensitivity. In most of the cases a suboptimal selection of kmer values is used by practitioners which results in suboptimal assembly.
KREATION or Kmer Range EstiMATION is an algorithm which predicts the best stopping point for the assembler (refer to the paper for more details). The saves runtime and the assembly results generated would be close to optimal.

#### Does it predicts the lower range of kmer
- The prediction of lower range is currently not supported by KREATION. We are developing an algorithm for prediction of lower range and will include in the future version of KREATION

#### Will KREATION work for genome assembly
- No. KREATION will only produce meaningful results for transcriptome assembly
 
#### Why am I asked to use the modified version of oases
- The current version of oases has an inbuilt merge function and a default max kmer value of 31. The oases-merge function provides little information about the transcripts obtained from a kmer run. Also it has been shown to have suboptimal performance than CD-HIT_EST for clustering. The default max kmer value of 31 defeats the purpose of KREATION.  The modified version of oases (supplied with the package) does not affect the oases assembly. It just doesnt implement the oases merge function and also removes the max kmer parameter   

#### KREATION is not working for my assembler
- KREATION is designed according to a general workflow which is followed by most of the assemblers. Note that by workflow we mean the way the assemblers interprets the parameters and the way that it stores the output. There might be some assemblers which has a unique workflow. If your assembler falls in this category you can modify the code accordingly or send us a mail and we will do it for you. 
*(This answer is based on a assumption that you have given the parameters to KREATION and updated the config files correctly)* 

#### How do I cite KREATION
cite as : 
