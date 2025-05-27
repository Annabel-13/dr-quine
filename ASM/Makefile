SOURCES1 = Colleen/Colleen.s
SOURCES2 = Grace/Grace.s
SOURCES3 = Sully/Sully.s

OBJECTS1 = $(SOURCES1:.s=.o)
OBJECTS2 = $(SOURCES2:.s=.o)
OBJECTS3 = $(SOURCES3:.s=.o)

NAME1 = Colleen/Colleen
NAME2 = Grace/Grace
NAME3 = Sully/Sully

ASM = nasm
ASM_FLAGS = -f elf64

.PHONY: all clean fclean re

all: $(NAME1) $(NAME2) $(NAME3)

$(NAME1): $(OBJECTS1)
	gcc -no-pie -o $@ $^

$(NAME2): $(OBJECTS2)
	gcc -no-pie -o $@ $^

$(NAME3): $(OBJECTS3)
	gcc -no-pie -o $@ $^

%.o: %.s
	$(ASM) $(ASM_FLAGS) $< -o $@

clean:
	rm -f $(OBJECTS1) $(OBJECTS2) $(OBJECTS3)

fclean: clean
	rm -f $(NAME1) $(NAME2) $(NAME3)

re: fclean all
