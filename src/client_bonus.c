/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abouabra < abouabra@student.1337.ma >      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/23 09:53:03 by abouabra          #+#    #+#             */
/*   Updated: 2023/01/02 11:45:36 by abouabra         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/minitalk_bonus.h"
#include <unistd.h>

void	send_sig(unsigned char s, int server_pid)
{
	int	i;

	i = 8;
	while (--i >= 0)
	{
		if (s & (1 << i))
			kill(server_pid, SIGUSR1);
		else
			kill(server_pid, SIGUSR2);
		usleep(300);
	}
}

void	recive_confirmation(int SIGUSR)
{
	if (SIGUSR == SIGUSR1)
	{
		ft_putstr("MSG RECEIVED\n");
	}
}

int	main(int ac, char **av)
{
	int					server_pid;
	int					i;
	struct sigaction	sa_usrs;

	if (ac == 3)
	{
		server_pid = ft_atoi(av[1]);
		if (server_pid == 0)
			return (0);
		sa_usrs.sa_flags = 0;
		sa_usrs.sa_handler = recive_confirmation;
		sigaction(SIGUSR1, &sa_usrs, NULL);
		i = -1;
		while (av[2][++i])
			send_sig((unsigned char)av[2][i], server_pid);
	}
	return (0);
}
