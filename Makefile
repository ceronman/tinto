OUTPUT = tinto.js

SOURCES = tinto/canvas.coffee tinto/text.coffee

EXAMPLES = examples/test.coffee

build:
	coffee --join $(OUTPUT) --compile $(SOURCES)
	
watch:
	coffee --watch --join $(OUTPUT) --compile $(SOURCES)
	
examples: build
	cp $(OUTPUT) examples
	coffee --compile $(EXAMPLES)
	
watch-examples:
	coffee --watch --compile $(EXAMPLES)
	
clean:
	find . -name *.js -delete
	
all: build