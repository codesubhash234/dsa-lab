CFLAGS = -std=c11 -Wall -Wextra -pedantic
CPPFLAGS = -std=c++17 -Wall -Wextra -pedantic

C_SOURCES := $(shell find . -name '*.c' -print)
CPP_SOURCES := $(shell find . -name '*.cpp' -print)
C_BINS := $(C_SOURCES:.c=.out)
CPP_BINS := $(CPP_SOURCES:.cpp=.out)

.PHONY: all clean

all: $(C_BINS) $(CPP_BINS)

%.out: %.c
	gcc $(CFLAGS) $< -lm -o $@

%.out: %.cpp
	g++ $(CPPFLAGS) $< -o $@

clean:
	find . -name '*.out' -delete
