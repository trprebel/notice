mysqldump -u root -p123456 "$2" > $(pwd)/"$2".sql
git add .
git commit -m "$1"
git push origin master
