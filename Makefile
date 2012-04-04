OUTPUT = tinto.js

SOURCES = tinto/tinto.coffee \
          tinto/canvas.coffee \
          tinto/input.coffee \
          tinto/resource.coffee \
          tinto/sprite.coffee \
          tinto/text.coffee

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