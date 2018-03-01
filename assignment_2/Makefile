OUT = out
SRC = src
CC	= gcc


default:
	$(call compile_part,part_1)
	$(call compile_part,part_2)
	$(call compile_part,part_3)


define compile_part
	$(CC) $(SRC)/$(1).c -o $(OUT)/$(1).out -Wall -pedantic
endef

clean:
	rm $(OUT)/*
