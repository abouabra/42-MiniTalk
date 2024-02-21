MAN_SER=src/server.c
MAN_CLI=src/client.c

BON_SER=src/server_bonus.c
BON_CLI=src/client_bonus.c

GSRC= src/minitalk_utils.c

SERVER=server
CLIENT=client

SERVER_BON=server_bonus
CLIENT_BON=client_bonus

CFLAGS = -Wall -Wextra -Werror

all :$(SERVER) $(CLIENT)

bonus: $(SERVER_BON) $(CLIENT_BON)

$(SERVER) : $(MAN_SER) $(GSRC)
	@$(CC) $(CFLAGS) $^ -o $@

$(CLIENT) : $(MAN_CLI) $(GSRC)
	@$(CC) $(CFLAGS) $^ -o $@

$(SERVER_BON) : $(BON_SER) $(GSRC)
	@$(CC) $(CFLAGS) $^ -o $@

$(CLIENT_BON) : $(BON_CLI) $(GSRC)
	@$(CC) $(CFLAGS) $^ -o $@

clean:
	@rm -rf *.o
fclean:
	@rm -rf *.o $(SERVER) $(CLIENT) $(SERVER_BON) $(CLIENT_BON)

 
re: fclean all

.PHONY: all clean fclean all