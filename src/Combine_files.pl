$dirname=$ARGV[0];
$start=$ARGV[1];
$end=$ARGV[2];
$step=$ARGV[3];
system("rm -r $dirname/Cluster/Combined/combine_p.fa");
system("mv $dirname/Cluster/Combined/combine.fa $dirname/Cluster/Combined/combine_p.fa");
open(FP,">>$dirname/Cluster/Combined/combine.fa");
for($i=$start;$i<=$end;$i+=$step)
{
	open(FP1,"$dirname/Cluster/$i/transcripts_clust.fa");
	chomp(@Data=<FP1>);
	for($j=0;$j<@Data;$j++)
	{
		print FP $Data[$j],"\n";	
	}	
}
