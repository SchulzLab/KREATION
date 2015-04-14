## Frequently Asked Questions

#### Why should I use KREATION
- Most of these assemblers use the de Bruijn graph (DBG) as the underlying data structure. A fundamental parameter with large influence on  assembly quality with DBGs is the exact word length k. As such no single kmer value leads to optimal results. Instead, DBGs over different k-mer values are build and the assemblies merged to improve sensitivity. In most of the cases a suboptimal selection of kmer values is used by practitioners which results in suboptimal assembly.

KREATION or Kmer Range EstiMATION is an algorithm which predicts the best stopping point for the assembler. The saves runtime and the assembly results generated would be close to optimal.   
