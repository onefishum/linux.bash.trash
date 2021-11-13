#Linux 解决rm误删除问题
添加到 ~/.bashrc 中
```bash
alias rm=trash
trash()
{ 
	files=()
	timestamp=$(date +%s)
	for file in "$@"
	do
		if [[ ${file:0:1} != "-" ]] 
		then
			files=("${files[@]}" "${file}")
		fi
	done
	
	mkdir -p ~/.trash/$timestamp
	echo `date -r $timestamp '+%x %X'` " $timestamp: rm $* --> mv "${files[@]}" --> source: `pwd`" >> ~/.trash/.trash.log 
	# ubuntu
	# echo `date -d@$timestamp '+%x %X'` " $timestamp: rm $* --> mv "${files[@]}" --> source: `pwd`" >> ~/.trash/.trash.log
	mv "${files[@]}" ~/.trash/$timestamp
}
```

