OUTPUT = tinto.js

SOURCES = tinto/canvas.coffee tinto/resource.coffee tinto/text.coffee tinto/sprite.coffee tinto/input.coffee

EXAMPLES = examples

build:
	coffee --join $(OUTPUT) --compile $(SOURCES)
	
watch:
	coffee --watch --join $(OUTPUT) --compile $(SOURCES)
	
examples: build
	coffee --compile $(EXAMPLES)
	
watch-examples:
	coffee --watch --compile $(EXAMPLES)
	
clean:
	find . -name *.js -delete
	
all: build