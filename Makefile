CXXFLAGS += -std=c++11 -fPIC -Wall
LDFLAGS = -lfftw3 -shared

SRCS =  audiodata.cpp \
    chromagram.cpp \
    chromatransform.cpp \
    chromatransformfactory.cpp \
    fftadapter.cpp \
    keyclassifier.cpp \
    keyfinder.cpp \
    lowpassfilter.cpp \
    lowpassfilterfactory.cpp \
    spectrumanalyser.cpp \
    temporalwindowfactory.cpp \
    toneprofiles.cpp \
    windowfunctions.cpp \
    workspace.cpp \
    constants.cpp
OBJS = $(subst .cpp,.o,$(SRCS))

all: build

build: $(OBJS)
	g++ $(LDFLAGS) -o libkeyfinder.so $(OBJS)

clean:
	rm -f $(OBJS) libkeyfinder.so

%.o: %.cpp
	g++ -c $(CXXFLAGS) -o $@ $<

install:
	install libkeyfinder.so /usr/local/lib
	mkdir -p /usr/local/include/keyfinder
	install *.h /usr/local/include/keyfinder

.PHONY: clean install
