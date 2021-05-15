@echo off

echo "Pushing updates to GitHub..."

git pull
git add -A
git commit -m "updates"
git push origin master

gitbook build
git subtree add --prefix=_book origin gh-pages
git subtree push --prefix=_book origin gh-pages

echo "done"