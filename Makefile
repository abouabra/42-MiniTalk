MAN_SER=server.c
MAN_CLI=client.c

BON_SER=server_bonus.c
BON_CLI=client_bonus.c

GSRC= minitalk_utils.c

OMAN_SER=$(MAN_SER)
OMAN_CLI=$(MAN_CLI)

OBON_SER=$(BON_SER)
OBON_CLI=$(BON_CLI)

BSRC=$(GSRC)

SERVER=server
CLIENT=client

SERVER_BON=server_bonus
CLIENT_BON=client_bonus

CFLAGS = -Wall -Wextra -Werror

all :$(SERVER) $(CLIENT)

bonus: $(SERVER_BON) $(CLIENT_BON)

$(SERVER) : $(OMAN_SER) $(BSRC)
	@$(CC) $(CFLAGS) $^ -o $@

$(CLIENT) : $(OMAN_CLI) $(BSRC)
	@$(CC) $(CFLAGS) $^ -o $@

$(SERVER_BON) : $(OBON_SER) $(BSRC)
	@$(CC) $(CFLAGS) $^ -o $@

$(CLIENT_BON) : $(OBON_CLI) $(BSRC)
	@$(CC) $(CFLAGS) $^ -o $@

clean:
	@rm -rf *.o
fclean:
	@rm -rf *.o $(SERVER) $(CLIENT) $(SERVER_BON) $(CLIENT_BON)

 
re: fclean all

.PHONY: all clean fclean all