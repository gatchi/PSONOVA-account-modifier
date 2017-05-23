#
# Modify-Account Makefile
#
# Make sure your mysql library is either called 'libmysqlclient' or you have
# a link named such pointing to the proper client library,
# like libmysqlclient.so -> libmysqlclient.so.18
#
# For installation on Linux, i recommend placing it with other PSO files
# in /opt since this utility does not require other Linux resources.

ifeq ($(OS),Windows_NT) 
    MYSQL = -Llib -llibmysql
else
    MYSQL = -lmysqlclient
endif

CFLAGS = 
CC = gcc

modify-account: modify-account.o md5.o include/md5.h
	$(CC) $(CFLAGS) -o $@ $< -L/usr/lib/x86_64-linux-gnu $(MYSQL) md5.o

modify-account.o: modify-account.c
	$(CC) $(CFLAGS) -Iinclude -c modify-account.c

md5.o: md5.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm *.o
