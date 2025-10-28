CC = gcc
CFLAGS = -Wall -O3 -march=native -std=c99
LDFLAGS = -lm

TARGET = search
SOURCES = main.c
#HEADERS = ivfflat.h

all: $(TARGET)

$(TARGET): $(SOURCES)
	$(CC) $(CFLAGS) $(SOURCES) -o $(TARGET) $(LDFLAGS)