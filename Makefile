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


RED = \033[1;31m
GREEN = \033[1;32m
BLUE = \033[1;34m
YELLOW = \033[1;33m
RESET = \033[0m

all : ascii $(SERVER) $(CLIENT)

bonus: ascii $(SERVER_BON) $(CLIENT_BON)

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




ascii:
	@clear
	@printf "$(GREEN)\
                                                                                                                                 \n\
MMMMMMMM               MMMMMMMM  iiii                     iiii TTTTTTTTTTTTTTTTTTTTTTT                lllllll kkkkkkkk           \n\
M:::::::M             M:::::::M i::::i                   i::::iT:::::::::::::::::::::T                l:::::l k::::::k           \n\
M::::::::M           M::::::::M  iiii                     iiii T:::::::::::::::::::::T                l:::::l k::::::k           \n\
M:::::::::M         M:::::::::M                                T:::::TT:::::::TT:::::T                l:::::l k::::::k           \n\
M::::::::::M       M::::::::::Miiiiiiinnnn  nnnnnnnn    iiiiiiiTTTTTT  T:::::T  TTTTTTaaaaaaaaaaaaa    l::::l  k:::::k    kkkkkkk\n\
M:::::::::::M     M:::::::::::Mi:::::in:::nn::::::::nn  i:::::i        T:::::T        a::::::::::::a   l::::l  k:::::k   k:::::k \n\
M:::::::M::::M   M::::M:::::::M i::::in::::::::::::::nn  i::::i        T:::::T        aaaaaaaaa:::::a  l::::l  k:::::k  k:::::k  \n\
M::::::M M::::M M::::M M::::::M i::::inn:::::::::::::::n i::::i        T:::::T                 a::::a  l::::l  k:::::k k:::::k   \n\
M::::::M  M::::M::::M  M::::::M i::::i  n:::::nnnn:::::n i::::i        T:::::T          aaaaaaa:::::a  l::::l  k::::::k:::::k    \n\
M::::::M   M:::::::M   M::::::M i::::i  n::::n    n::::n i::::i        T:::::T        aa::::::::::::a  l::::l  k:::::::::::k     \n\
M::::::M    M:::::M    M::::::M i::::i  n::::n    n::::n i::::i        T:::::T       a::::aaaa::::::a  l::::l  k:::::::::::k     \n\
M::::::M     MMMMM     M::::::M i::::i  n::::n    n::::n i::::i        T:::::T      a::::a    a:::::a  l::::l  k::::::k:::::k    \n\
M::::::M               M::::::Mi::::::i n::::n    n::::ni::::::i     TT:::::::TT    a::::a    a:::::a l::::::lk::::::k k:::::k   \n\
M::::::M               M::::::Mi::::::i n::::n    n::::ni::::::i     T:::::::::T    a:::::aaaa::::::a l::::::lk::::::k  k:::::k  \n\
M::::::M               M::::::Mi::::::i n::::n    n::::ni::::::i     T:::::::::T     a::::::::::aa:::al::::::lk::::::k   k:::::k \n\
MMMMMMMM               MMMMMMMMiiiiiiii nnnnnn    nnnnnniiiiiiii     TTTTTTTTTTT      aaaaaaaaaa  aaaallllllllkkkkkkkk    kkkkkkk\n\
																																 \n\
                                                                                                          $(RED)by: abouabra$(RESET)\n"


.PHONY: all clean fclean all