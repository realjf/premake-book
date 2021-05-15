@echo off

echo "Pushing updates to GitHub..."

git pull
git add -A
git commit -m "updates"
git push origin master

rmdir /s /Q _book

gitbook build
git worktree prune

rem checking out gh-pages branch into public
git worktree add -B gh-pages public origin/gh-pages
cd _book
git add --all
git commit -m "update"
cd ..
rem push to repo
git push origin gh-pages

echo "done"