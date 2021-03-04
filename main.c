#include "libasm.h"

int main(int ac, char **av)
{
    char *s = "hello World !";
    int i;

    i = ft_write(1, &s[3], 1);
    printf("%i\n", i);
    return (0);
}