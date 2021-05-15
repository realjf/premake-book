@echo off

echo "Pushing updates to GitHub..."

git pull
git add -A
git commit -m "updates"
git push origin master
rmdir /s /Q _book
gitbook build

echo "done"