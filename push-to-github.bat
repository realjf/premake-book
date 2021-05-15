@echo off

echo "Pushing updates to GitHub..."

git pull
git add -A
git commit -m "updates"
git push origin master

git subtree pull --prefix=_book origin gh-pages --squash
git subtree push --prefix=_book origin gh-pages

echo "done"