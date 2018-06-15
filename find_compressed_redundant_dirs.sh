while read -r subdir
	do
		dirname=`basename $subdir`
		targzfile="${subdir}.tar.gz"
		if [ -f $targzfile ] ;
		then
		echo $subdir >>/n/data1/cores/bcbio/PIs/size_monitoring/2018-06-14/dirs_redundant_with_compressed.txt
		fi
	done < /n/data1/cores/bcbio/PIs/size_monitoring/2018-06-14/subdirs.txt

#echo "done finding directories that have been compressed but not erased"

#touch /n/data1/cores/bcbio/PIs/size_monitoring/2018-06-14/gziptests.txt
#while read -r subdir
#do 
#	dirname=`basename $subdir`
# 	targzfile="${subdir}.tar.gz"
#	gzip -t $targzfile >>/n/data1/cores/bcbio/PIs/size_monitoring/2018-06-14/gziptests.txt
#done < /n/data1/cores/bcbio/PIs/size_monitoring/2018-06-14//dirs_redundant_with_compressed.txt

