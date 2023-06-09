.PHONY: all
all: pdf epub

.PHONY: pdf
pdf:
	rm letter-from-prison-book.pdf
	cd tex && tectonic -X build
	cp ./tex/build/book/book.pdf letter-from-prison-book.pdf

.PHONY: epub
epub:
	rm letter-from-prison-book.epub
	cd epub && zip -X  -r ../letter-from-prison-book.epub mimetype META-INF EPUB -x "*.DS_Store"

.PHONY: lint
lint:
	epubcheck letter-from-prison-book.epub
