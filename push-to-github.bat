@echo off

echo "Pushing updates to GitHub..."

git pull
git add -A
git commit -m "updates"
git push origin master

git subtree push --prefix=_book origin gh-pages -m "updates"


echo "done"