TARGET = bin\dbview
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))

run: clean default
	$(TARGET) -f ./mynewdb.db -n
	$(TARGET) -f ./mynewdb.db -a "Timmy H.,123 Sheshire LN.,120"



default: $(TARGET)

clean:
	del /Q obj\*.o
	del /Q bin\*
	del /Q *.db

$(TARGET): $(OBJ)
	gcc -o $@ $? -lws2_32

obj/%.o : src/%.c
	gcc -c $< -o $@ -Iinclude
