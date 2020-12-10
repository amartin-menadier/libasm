#!/bin/bash
### COLORS
Red="\e[31m"
Green="\e[32m"
Dark_yellow="\n\e[33;1m"
Yellow="\e[1;33m"
Blue="\e[1;94m"
Purple="\e[35m"
Default="\e[0m"
### FUNCTIONS
functions="ft_strlen ft_strcpy ft_strcmp ft_write ft_read ft_strdup"
### OTHERS
total_tests=25;
passed_tests=0;

printf "${Yellow}"
printf "# ****************************************************************************** #\n"
printf "#                                                                                #\n"
printf "#                    :::          :::                                            #\n"
printf "#                   :+:      :+: :+:                                             #\n"
printf "#                  +:+          +:+                                              #\n"
printf "#                 +#+      +#+ +#+#+#+  +#+#+#+  +#+#+#+ +#+#+#+#+               #\n"
printf "#                #+#      #+# #+#  #+#     +#+# #+#+    #+#  +  #+#              #\n"
printf "#               #+#      #+# #+#  #+# #+#  #+#    +#+# +#+  +  #+#               #\n"
printf "#              ######## ### #######   ####### ####### ###  #  ###                #\n"
printf "#                                                                                #\n"
printf "#                                                                                #\n"
printf "#                                                                                #\n"
printf "# ****************************************************************************** #\n"
printf "${Default}"

for function in $functions
do
    printf "\n\n${Purple} --- Tests for ${function} ---${Default}";
    ./a.out $function $passed_tests
    passed_tests=$(($passed_tests+$?))
done

printf "${Yellow}\n\n\n--- RESULTS ---\n"
printf "${Default}1- Check the tests for write: \nBefore \'OKs\', you should have nothing or two non-separated identic strings\n(ie \'MargeMarge\')\n2- Regarding the return values, the output below is supposed to be explicit:\n"

if (($passed_tests == $total_tests))
then
printf "${Blue}\nYeeeeeah! $passed_tests tests/$total_tests passed successfully\n░░░░░░░░░░░░▄▄░░░░░░░░░░░░░░\n░░░░░░░░░░░█░░█░░░░░░░░░░░░░\n░░░░░░░░░░░█░░█░░░░░░░░░░░░░\n░░░░░░░░░░█░░░█░░░░░░░░░░░░░\n░░░░░░░░░█░░░░█░░░░░░░░░░░░░\n██████▄▄█░░░░░██████▄░░░░░░░\n▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░\n▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░\n▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░\n▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░\n▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░\n▓▓▓▓▓▓█████░░░░░░░░░██░░░░░░\n█████▀░░░░▀▀████████░░░░░░░░\n░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n\n${Default}\n"
else
printf "${Red} \nWell... That's kinda sad...\nOnly $passed_tests tests/$total_tests passed successfully                  \n░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n█████▄░░░░▄▄████████░░░░░░░░\n▓▓▓▓▓▓█████░░░░░░░░░██░░░░░░\n▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░\n▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░\n▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░\n▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░\n▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░\n██████▀▀█░░░░░██████▀░░░░░░░\n░░░░░░░░░█░░░░█░░░░░░░░░░░░░\n░░░░░░░░░░█░░░█░░░░░░░░░░░░░\n░░░░░░░░░░░█░░█░░░░░░░░░░░░░\n░░░░░░░░░░░█░░█░░░░░░░░░░░░░\n░░░░░░░░░░░░▀▀░░░░░░░░░░░░░░\n\n${Default}\n"
fi
