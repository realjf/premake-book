@echo off

echo "Pushing updates to GitHub..."

git pull
git add -A
git commit -m "updates"
git push origin master

git checkout gh-pages
git checkout master
git subtree pull --prefix=_book origin master --squash
git subtree push --prefix=_book origin gh-pages


echo "done"