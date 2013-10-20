message=$1
if [ "$message" = "" ];then
    echo "please input your commit message:"
    read message
fi
dbname=$2
if [ "$dbname" = "" ];then
    echo "please input your dbname:"
    read dbname
fi
mysqldump -u root -p123456 "$dbname" > $(pwd)/"$dbname".sql
git add .
git commit -m "$message"
git push origin master
