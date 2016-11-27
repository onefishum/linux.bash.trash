#Linux 解决rm问题
```bash
alias rm=trash
trash()
{ 
    timestamp=$(date +%s) 
    dir=`echo $@ | sed 's/ --\{0,1\}[a-z]\{1,\}//g'`
    mkdir -p ~/.trash/$timestamp 
    echo `date -d@$timestamp '+%x %X'` " $timestamp: rm $* --> $dir">> ~/.trash/.trash.log 
    mv $dir ~/.trash/$timestamp
}
```
