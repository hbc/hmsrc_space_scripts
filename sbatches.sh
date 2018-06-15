while read -r dir
do
	echo $dir
	subdir=`basename $dir`
	targzfile="${dir}/../${subdir}.tar.gz"
	echo $targzfile
	sbatch -t 720 -p short --wrap="tar --remove-file -czvf $targzfile $dir" 

done <mydirs
