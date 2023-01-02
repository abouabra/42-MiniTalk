/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abouabra < abouabra@student.1337.ma >      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/23 09:53:03 by abouabra          #+#    #+#             */
/*   Updated: 2023/01/02 11:46:28 by abouabra         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

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

int	main(int ac, char **av)
{
	int					server_pid;
	int					i;

	if (ac == 3)
	{
		server_pid = ft_atoi(av[1]);
		if (!server_pid)
			return (0);
		i = -1;
		while (av[2][++i])
			send_sig((unsigned char)av[2][i], server_pid);
	}
	return (0);
}
