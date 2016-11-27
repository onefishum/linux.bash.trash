#Linux 解决rm问题
```bash
trash()
{
    timestamp=$(date +%s)
    dir=`echo ' '$@ | sed 's/ --\{0,1\}[a-z]\{1,\}//g'`
    mkdir -p ~/.trash/$timestamp
    echo `date -r $timestamp '+%x %X'` " $timestamp: rm $* --> mv $dir --> source: `pwd`">> ~/.trash/.trash.log
    mv $dir ~/.Trash/$timestamp
}
```
