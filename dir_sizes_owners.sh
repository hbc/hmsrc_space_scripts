find . -maxdepth 2 -mindepth 2 -type d > subdirs.txt
find . -maxdepth 2 -mindepth 2 -name '*.tar.gz' > compressed_projects.txt


readonly tab=$'\t'
echo -e "subdirectory\tsize_bytes\tsize_human\towner\tlast_date\ttype" >dir_owners_and_sizes.tsv

function scan_directories {
	size_gb=`du -sh $subdir  2>/dev/null | awk '{print $1}'|  tr -d '\n'`
	size_bytes=`du -s $subdir  2>/dev/null | awk '{print $1}'|  tr -d '\n'`
	owner=`ls -ld $subdir | awk '{print $3}'`
	last_date=`find $subdir  -type f -printf '%TY-%Tm-%Td %TH:%TM: %Tz %p\n' 2>/dev/null | sort -n | tail -n1 | awk '{print $1}'`
	# output_string=`$subdir"\t"$size_bytes"\t"$size_gb"\t"$owner"\t"$last_date`
	# echo $output_stringi
	type=`echo directory`
	echo "$subdir$tab$size_bytes$tab$size_gb$tab$owner$tab$last_date$tab$type"
}

while read -r subdir
do
	scan_directories &
done <subdirs.txt >>dir_owners_and_sizes.tsv


function scan_compressed {
	size_gb=`ls -sh $compressed_project 2>/dev/null | awk '{print $1}'|  tr -d '\n'`
	size_bytes=`ls -s $compressed_project 2>/dev/null | awk '{print $1}'|  tr -d '\n'`
	owner=`ls -ld $compressed_project | awk '{print $3}'`
	last_date=`find $compressed_project -type f -printf '%TY-%Tm-%Td %TH:%TM: %Tz %p\n' 2>/dev/null | sort -n | tail -n1 | awk '{print $1}'`
	type=`echo compressed`
	echo "$compressed_project$tab$size_bytes$tab$size_gb$tab$owner$tab$last_date$tab$type"
}

while read -r compressed_project
do
	scan_compressed &
done <compressed_projects.txt >>dir_owners_and_sizes.tsv


