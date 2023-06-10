.PHONY: all
all: pdf epub

.PHONY: pdf
pdf:
	rm -f ./dist/letter-from-prison.pdf
	cd tex && tectonic -X build
	cp ./tex/build/book/book.pdf ./dist/letter-from-prison.pdf

.PHONY: epub
epub:
	rm -f ./dist/letter-from-prison.epub
	cd epub && zip -X  -r ../dist/letter-from-prison.epub mimetype META-INF EPUB -x "*.DS_Store"

.PHONY: lint
lint:
	epubcheck ./dist/letter-from-prison.epub
