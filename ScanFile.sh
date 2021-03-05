#!/bin/bash

#ScanFile.sh
#author:pfh
#date:2021/03/05

Files=$1
echo "----------begin----------"
echo "Directory:"$1
if [ X$1 = X ];then
echo "Directory is null" 
else echo "Directory is not null" 
fi
if [ $# -eq 1 ];
	then
	#find $1 -print0 >tmpfile
	while IFS= read -r -d $'\0'; do 
	#for FileList in $(find $1 -print0);do
		#echo FileList
		FileList=("$REPLY")
	        #echo $FileList
		#echo ls -lhd $FileList
		FileType=$(ls -lhd "$FileList" | awk -F ' ' '{print $1}' |cut -c 1)
		if [ "$FileType" == d ]; then 
			#DirSize=$(du -sh "$FileList" |awk '{print $1}')
			#ls -lhd "$FileList"|sed "s/[^ ]\+/$DirSize/5"
			:
		else 
			FileSize=$(ls -l "$FileList" | awk -F ' ' '{print $5}')
			Max_size=$((1024*10*10))
			#100k	
			if [ "$FileSize" -gt "$Max_size" ]; then
				ls -lh "$FileList"
				#rm -rf "$FileList"
				#delete
			fi
		fi
	done < <(find $1 -print0)
	#done
else
	echo "--usage:bash $0 + [directory] or [file];"
	echo "--example:bash $0 /root/test"

fi
echo "----------end----------"
————————————————
版权声明：本文为CSDN博主「Shawn582818273」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/Shawn582818273/article/details/114374123
