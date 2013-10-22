dbname=$1
if [ "$dbname" = "" ];then
    echo "please input your dbname:"
    read dbname
fi
git pull origin master
mysql -uroot -p123456 "$dbname" < $(pwd)/"$dbname".sql