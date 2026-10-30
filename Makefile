CXX := clang++
CXXFLAGS := -O2 -std=c++20

OUT_DIR := out
TARGET := $(OUT_DIR)/raytracer
SRC := main.cpp
OUT := $(OUT_DIR)/image.ppm
PNG := image.png

$(TARGET): $(SRC)
	mkdir -p $(OUT_DIR)
	$(CXX) $(CXXFLAGS) $(SRC) -o $(TARGET)

run: $(TARGET)
	./$(TARGET) > $(OUT)

view: run
	magick $(OUT) $(PNG)
	open $(PNG)

clean:
	rm -f $(TARGET) $(OUT) $(PNG)

.PHONY: run view clean