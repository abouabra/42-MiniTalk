/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abouabra < abouabra@student.1337.ma >      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/02 21:40:51 by ayman             #+#    #+#             */
/*   Updated: 2023/01/02 11:26:53 by abouabra         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	check_interupt(siginfo_t *info, pid_t *client_pid, int *counter)
{
	if (info->si_pid != *client_pid)
	{
		*client_pid = info->si_pid;
		*counter = 0;
	}
}

void	handle_usr_signals(int SIGUSR, siginfo_t *info, void *vp)
{
	static int				counter;
	static pid_t			client_pid;
	static unsigned char	c;

	(void)vp;
	check_interupt(info, &client_pid, &counter);
	if (!counter)
	{
		counter = 8;
		c = 0;
	}
	if (SIGUSR == SIGUSR1)
	{
		c |= 1 << (counter - 1);
		counter--;
	}
	if (SIGUSR == SIGUSR2)
		counter--;
	if (counter == 0)
	{
		write(1, &c, 1);
		counter = 0;
	}
}

int	main(void)
{
	struct sigaction	sa_usrs;

	ft_putstr("PID: ");
	ft_putnbr(getpid());
	ft_putchar('\n');
	sa_usrs.sa_flags = SA_SIGINFO;
	sa_usrs.sa_sigaction = handle_usr_signals;
	sigaction(SIGUSR1, &sa_usrs, NULL);
	sigaction(SIGUSR2, &sa_usrs, NULL);
	while (1)
		pause();
	return (0);
}
