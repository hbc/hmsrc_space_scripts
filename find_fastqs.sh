#find . -name "*.fastq"  > fastq_files.txt
#find . -name "*.fastq.gz"  > fastq.gz_files.txt
#find . -name "*.fq"  > fq_files.txt
#find . -name "*.fq.gz"  > fq.gz_files.txt

while read -r fastqfile
do
	directory=`dirname $fastqfile`
	filename=`basename $fastqfile`
	filestub=${filename%.*}
	gzfile="${directory}/${filestub}.gz"
	bz2file="${directory}/${filestub}.bz2"
	if [ -f $gzfile ] || [ -f $bz2file ] ;
	then
		echo $directory
	fi
done < fastq_files.txt

while read -r fqfile
do
	directory=`dirname $fqfile`
	filename=`basename $fqfile`
	filestub=${filename%.*}
	gzfile="${directory}/${filestub}.gz"
	bz2file="${directory}/${filestub}.bz2"
	if [ -f $gzfile ] || [ -f $bz2file ] ;
	then
	echo $directory
	fi
done < fq_files.txt

while read -r fastqgzfile
do
	directory=`dirname $fastqgzfile`
	filename=`basename $fastqgzfile`
	filestub=${filename%.*}
	bz2file="${directory}/${filestub}.bz2"
	if [ -f $bz2file ] ;
	then
	echo $directory
	fi
done < fastq.gz_files.txt

while read -r fqgzfile
do
	directory=`dirname $fqgzfile`
	filename=`basename $fqgzfile`
	filestub=${filename%.*}
	bz2file="${directory}/${filestub}.bz2"
	if [ -f $bz2file ] ;
	then
	echo $directory
	fi
done < fq.gz_files.txt

