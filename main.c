#include "libasm.h"

size_t ft_strlen(char *s);

int main(int ac, char **av)
{
    char *s = "hello World !";
    int i;

    i = ft_strlen(s);
    printf("%i\n", i);
    return (0);
}