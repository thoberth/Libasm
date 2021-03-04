#ifndef _LIBASM_
#define _LIBASM_
#include <unistd.h>
#include <stdio.h>

size_t  ft_strlen(char *s);
ssize_t ft_write(int fd, const void *buf, size_t count);

#endif