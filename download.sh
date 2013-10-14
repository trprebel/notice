git pull origin master
mysql -uroot -p123456 "$1" < $(pwd)/"$1".sql