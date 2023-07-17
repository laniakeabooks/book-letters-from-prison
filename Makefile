.PHONY: all
all: pdf epub

.PHONY: pdf
pdf:
	rm -f ./dist/letters-from-prison.pdf
	cd tex && tectonic -X build
	cp ./tex/build/book/book.pdf ./dist/letters-from-prison.pdf

.PHONY: epub
epub:
	rm -f ./dist/letters-from-prison.epub
	cd epub && zip -X  -r ../dist/letters-from-prison.epub mimetype META-INF EPUB -x "*.DS_Store"

.PHONY: lint
lint:
	epubcheck ./dist/letters-from-prison.epub
