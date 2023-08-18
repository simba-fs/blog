# filediff := $(shell git diff --name-only HEAD | grep --color=never content/post | sed -e 's/content\/post\///')
date := $(shell date +%Y-%m-%d)
push: 
	git add .
	git commit -m "$(date)"
	git pull
	git push

diff:
	@echo "$(filediff)"

tree: 
	tree content/post | less
	# tree -d content/post

build:
	hugo --minify --gc

server:
	hugo server -D

frontmatter:
	cd ./script/formatmatter/ && ts-node index.ts
.PHONY: push tree build diff
