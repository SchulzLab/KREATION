$filename=$ARGV[0];
$kmer=$ARGV[1];
$mod_file=$filename;
$mod_file=~s/\.fa/\_clu\.fa/g;

system("rm -r $mod_file");

open(FP1,">>$mod_file");
open(FP,$filename);
chomp(@Data=<FP>);

$count=0;
for($j=0;$j<@Data;$j++)
{
	if($Data[$j]=~/^>/)
	{
		$count++;
		$Data[$j]=">$kmer"."_".$count;	
	}
	print FP1 $Data[$j],"\n";
}

close(FP);
close(FP1);
