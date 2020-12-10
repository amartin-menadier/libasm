/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <user42@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/11/27 16:02:49 by user42            #+#    #+#             */
/*   Updated: 2020/11/28 11:13:54 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "./libasm.h"

int		test_strlen(int passed_tests)
{
	int		i;
	char	*test[3];

	test[0] = "Rick";
	test[1] = "Morty";
	test[2] = "\0";
	i = 0;
	while (i < 3)
	{
		if ((int)ft_strlen(test[i]) == (int)strlen(test[i]))
		{
			printf("\n%sOK%s: \"%s\"", GREEN, DEFAULT, test[i]);
			passed_tests++;
		}
		else
			printf("\n%sKO%s: \"%s\"\nexpected: %d\n_____got: %d", RED, DEFAULT, test[i], (int)strlen(test[i]), (int)ft_strlen(test[i]));
		i++;
	}
	return (passed_tests);
}

int		test_strcpy(int passed_tests)
{
	char	dst[100];
	char	*test[3];
	int		i;

	test[0] = "Stan";
	test[1] = "Roger";
	test[2] = "\0";
	i = 0;
	while (i < 3)
	{
		if ((int)ft_strcpy(dst, test[i]) == (int)strcpy(dst, test[i]))
		{
			printf("\n%sOK%s: \"%s\"", GREEN, DEFAULT, test[i]);
			passed_tests++;
		}
		else
			printf("\n%sKO%s: \"%s\"\nexpected: %d\n_____got: %d", RED, DEFAULT, test[i], (int)strcpy(dst, test[i]), (int)ft_strcpy(dst, test[i]));
		i++;
	}
	return (passed_tests);
}

int		test_strcmp(int passed_tests)
{
	char	*test[10];
	int		i;

	test[0] = "Quagmire";
	test[1] = "Lois";
	test[2] = "Cleveland";
	test[3] = "Peter";
	test[4] = "Joe";
	test[5] = "Brian";
	test[6] = "";
	test[7] = "Stewie";
	test[8] = "\0";
	test[9] = "Chris";
	i = 0;
	while (i < 5)
	{
		if ((int)strcmp(test[2*i], test[2*i+1]) == (int)ft_strcmp(test[2*i], test[2*i+1]))
		{
			printf("\n%sOK%s: \"%s\" vs \"%s\"", GREEN, DEFAULT, test[2*i], test[2*i+1]);
			passed_tests++;
		}
		else
			printf("\n%sKO%s: \"%s\" vs \"%s\"\nexpected: %d\n_____got: %d", RED, DEFAULT, test[2*i], test[2*i+1], (int)strcmp(test[2*i], test[2*i+1]), (int)ft_strcmp(test[2*i], test[2*i+1]));
		i++;
	}
	return (passed_tests);
}

int		test_read(int passed_tests)
{
	int		fd;
	char	*buff;
	char	*buff2;
	int		ret_read;
	int		ret_ft_read;
	char	*tmp;
	char	*tmp2;
	int		i;
	char	*test[2];

	test[0] = "./ft_strlen.s";
	test[1] = "not found";
	i = 0;
	while (i < 2)
	{
		buff = malloc(sizeof(char) * 1000);
		buff2 = malloc(sizeof(char) * 1000);
		fd = open(test[i], O_RDONLY);
		ret_read = read(fd, buff, 500);
		if (ret_read == -1)
			tmp = strdup(strerror(errno));
		else
			tmp = strdup(buff);
		fd = open(test[i], O_RDONLY);
		ret_ft_read = ft_read(fd, buff2, 500);
		if (ret_ft_read == -1)
			tmp2 = strdup(strerror(errno));
		else
			tmp2 = strdup(buff2);
		if (!strcmp(tmp, tmp2))
		{
			printf("\n%sOK%s: file %s", GREEN, DEFAULT, test[i]);
			passed_tests++;
		}
		else
			printf("\n%sKO%s: file %s\nexpected: %s\n_____got: %s", RED, DEFAULT, test[i], tmp, tmp2);
		free(buff);
		free(buff2);
		free(tmp);
		free(tmp2);
		buff = NULL;
		buff2 = NULL;
		i++;
	}
	return (passed_tests);
}

int		test_write(int passed_tests)
{
	int		fd[7];
	char	*test[7];
	int		len[7];
	int		i;
	char	*expected;
	char	*got;

	fd[0] = 1;
	test[0] = "Marge";
	len[0] = 5;
	fd[1] = 0;
	test[1] = "Homer";
	len[1] = 5;
	fd[2] = 1;
	test[2] = "Lisa";
	len[2] = 1;
	fd[3] = 1;
	test[3] = "Bart";
	len[3] = 0;
	fd[4] = 100;
	test[4] = "Maggie";
	len[4] = 1;
	fd[5] = 1;
	test[5] = NULL;
	len[5] = 2;
	fd[6] = -1;
	test[6] = NULL;
	len[6] = 1;
	i = 0;
	while (i < 7)
	{
		printf("\n");
		if ((int)ft_write(fd[i], test[i], len[i]) == (int)write(fd[i], test[i], len[i]))
		{
			printf("\n%sOK%s: \"%d, %s, %d\"", GREEN, DEFAULT, fd[i], test[i], len[i]);
			passed_tests++;
		}
		else
			printf("\n%sKO%s: \"%d, %s, %d\"\nexpected: %d\n_____got: %d", RED, DEFAULT, fd[i], test[i], len[i], (int)write(fd[i], test[i], len[i]), (int)ft_write(fd[i], test[i], len[i]));
		i++;
	}
	return (passed_tests);
}

int		test_strdup(int passed_tests)
{
	char	*test[5];
	char	*expected;
	char	*got;
	int		i;

	test[0] = "Eric Cartman";
	test[1] = "Kyle Broflovski";
	test[2] = "Stan Marsh";
	test[3] = "Kenny McCormick";
	test[4] = "Butters Stotch";
	i = 0;
	while (i < 5)
	{
		if (!strcmp(ft_strdup(test[i]), strdup(test[i])))
		{
			printf("\n%sOK%s: \"%s\"", GREEN, DEFAULT, test[i]);
			passed_tests++;
		}
		else
			printf("\n%sKO%s: \"%s\"\nexpected: %s\n_____got: %s", RED, DEFAULT, test[i], strdup(test[i]), ft_strdup(test[i]));
		i++;
	}
	return (passed_tests);
}

int		main(int argc, char **argv)
{
	if (!argv[1])
		return (system("./start.sh"));
	else if (!strcmp(argv[1], "ft_strlen"))
		return (test_strlen(0));
	else if (!strcmp(argv[1], "ft_strcpy"))
		return (test_strcpy(0));
	else if (!strcmp(argv[1], "ft_strcmp"))
		return (test_strcmp(0));
	else if (!strcmp(argv[1], "ft_read"))
		return (test_read(0));
	else if (!strcmp(argv[1], "ft_write"))
		return (test_write(0));
	else if (!strcmp(argv[1], "ft_strdup"))
		return (test_strdup(0));
	else
		return (0);
}
