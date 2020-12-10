NAME = libasm.a

SRCS = ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s \
		handle_error.s

OBJS = $(SRCS:.s=.o)

%.o : %.s
	nasm -f elf64 $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

all:$(NAME) 

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)
	rm -rf a.out

test: all
	clang main.c $(NAME)
	./a.out
	rm -rf *.o
	rm -rf a.out
	rm -rf $(NAME)

re: fclean all 
	rm -rf $(OBJS)
