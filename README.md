#Linux 解决rm误删除问题
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
	ls -l  "${files[@]}" 
	mv "${files[@]}" ~/.trash/$timestamp
}
```

