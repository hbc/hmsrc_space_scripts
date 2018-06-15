#find /n/data1/cores/bcbio/PIs/ -name "*.fastq"  > /n/data1/cores/bcbio/PIs/size_monitoring/fastq_files.txt
#find /n/data1/cores/bcbio/PIs/ -name "*.fastq.gz"  > /n/data1/cores/bcbio/PIs/size_monitoring/fastq.gz_files.txt
#find /n/data1/cores/bcbio/PIs/ -name "*.fq"  > /n/data1/cores/bcbio/PIs/size_monitoring/fq_files.txt
#find /n/data1/cores/bcbio/PIs/ -name "*.fq.gz"  > /n/data1/cores/bcbio/PIs/size_monitoring/fq.gz_files.txt

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
done < /n/data1/cores/bcbio/PIs/size_monitoring/fastq_files.txt


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
done < /n/data1/cores/bcbio/PIs/size_monitoring/fq_files.txt

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
done < /n/data1/cores/bcbio/PIs/size_monitoring/fastq.gz_files.txt

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
done < /n/data1/cores/bcbio/PIs/size_monitoring/fq.gz_files.txt

