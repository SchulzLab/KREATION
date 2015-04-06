$filename=$ARGV[0];
$clust=$filename."\.clstr";
$start=$ARGV[1];
$end=$ARGV[2];
$step=$ARGV[3];

my %hash;
my %seq_id;
$new=0;
$old=0;
$unique=0;
$extended=0;
$array=0;

open(FP,$clust);
@Data = split(">Cluster",join("",<FP>));
open(FP1,$filename);
@Data1=split(">",join("",<FP1>));

for($i=0;$i<@Data1;$i++)
{
	@var=split("\n",$Data1[$i]);
	$hash{$var[0]}=$Data1[$i];
}

for($i=$start;$i<=$end;$i+=$step)
{
	$seq_id{$i}=0;
}

@var=split("\n",$Data[$i]);

for($i=0;$i<@Data;$i++)
{
	$max=0;
	@var=split("\n",$Data[$i]);
	my @array;
	for($j=1;$j<@var;$j++)
	{
		@var1=split("	",$var[$j]);
		@var2=split(", ",$var1[-1]);
		$var2[0]=~s/nt//g;
		@var3=split("at",$var2[1]);
		@var4=split("\_",$var3[0]);
		$var4[0]=~s/\>//g;
		$k=0;
		for($l=0;$l<@array;$l++)
		{
			if($array[$l]==$var4[0])
			{
				$k++;
			}
		}
		if($k==0)
		{
			push(@array,$var4[0]);
		}
		if($max<$var2[0])
		{
			$max=$var2[0];
			$sq=$var3[0]; 
		}
	}
	$str_num=">".$end."_";
	if($sq=~/^$str_num/)
	{
		$sq=~s/\.\.\.//g;
		$sq=~s/ //g;
		$sq=~s/\*//g;
		$sq=~s/\>//g;
		if($hash{$sq} ne ""){
			if(scalar(@array)==1)
			{
				$unique++;
			}
			else{
				$extended++;		
			}		
		}	

	}
}
print $unique,"\t",$extended,"\n";
