OUTPUT = tinto.js

SOURCES = tinto/tinto.coffee \
          tinto/canvas.coffee \
          tinto/input.coffee \
          tinto/resource.coffee \
          tinto/sprite.coffee \
          tinto/text.coffee

EXAMPLES = examples

TESTS = tests
TESTS_OUTPUT = $(TESTS)/tests.js

build:
	coffee --join $(OUTPUT) --compile $(SOURCES)

watch:
	coffee --watch --join $(OUTPUT) --compile $(SOURCES)

examples: build
	coffee --compile $(EXAMPLES)

watch-examples:
	coffee --watch --compile $(EXAMPLES)

tests: build
	coffee --join $(TESTS_OUTPUT) --compile $(TESTS)

watch-tests: build
	coffee --watch --join $(TESTS_OUTPUT) --compile $(TESTS)

clean:
	find . -name *.js -delete

all: build