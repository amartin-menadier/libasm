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
# %.o : %.s = target : source	
# %.o = any file ending with .o
# nasm = netwide assembler for linux
# nasm=cmd -f=format elf64=64 bits format
# $<=first dependency=%.s 
# -o=output file $@=target being generated=%.o 

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)
# ar -rcs is the most likely command you would use 
# 		when using a Makefile to compile a library. 
# r means that if the library already exists, 
# 		replace the old files within the library with your new files. 
# c means create the library if it did not exist. 
# s can be seen to mean ‘sort’ (create a sorted index of) the library, 
#		so that it will be indexed and faster to access the functions in the library.
# Therefore, rcs can be seen to mean "replace, create, sort".

all:$(NAME) 

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)
	rm -rf a.out


test: all
	clang main.c $(NAME)
	./a.out

re: fclean all 
	rm -rf $(OBJS)
