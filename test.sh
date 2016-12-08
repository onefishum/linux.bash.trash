timestamp=$(date +%s)
for file in "$@"
do
	if [[ ${file:0:1} != "-" ]] 
	then
		files=("${files[@]}" "${file}")
	fi
done
echo "${files[@]}"
#mkdir -p ~/.trash/$timestamp
#echo `date -r $timestamp '+%x %X'` " $timestamp: rm $* --> mv "${files[@]}" --> source: `pwd`" >> ~/.trash/.trash.log 
echo "mv "${files[@]}" ~/.Trash/$timestamp"
ls -l "${files[@]}"
