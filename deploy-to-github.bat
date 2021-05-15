@echo off 


git worktree prune

rem checking out gh-pages branch into public
git worktree add -B gh-pages _book origin/gh-pages
cd _book
git add --all
git commit -m "update"
cd ..
rem push to repo
git push origin gh-pages

echo "done"


