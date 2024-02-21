# MiniTalk

## Description

MiniTalk is a project that allows two processes to communicate with each other using signals. The project is divided into two programs: a server and a client. The server and client can communicate with each other using the process ID (PID) of the server and SIGUSR1 and SIGUSR2 signals.
## Installation

1. Clone the repository:
```bash
git clone https://github.com/abouabra/42-MiniTalk.git
```
2. Change the current working directory:
```bash
cd 42-MiniTalk
```
3. Compile the server and client programs:
```bash
make
```
you will find two executables `server` and `client` in the current working directory.

## Usage

1. Run the server program:
```bash
./server
```
The server will display its process ID (PID) and wait for the client to connect.
**copy the server's PID** to use it in the next step.

2. Run the client program with the server's PID and a message as third argument:
```bash
./client <server_pid> "Hello, World!"
```
The client will send the message to the server, and the server will display the message.

## Bonus
### Description

The bonus part of the project is to implement a server and client programs that support Unicode characters. The server and client must acknowledge the receipt of each message.

### Installation

1. Compile the bonus server and client programs:
```bash
make bonus
```
you will find two executables `server_bonus` and `client_bonus` in the current working directory.

### Usage

1. Run the bonus server program:
```bash
./server_bonus
```
The server will display its process ID (PID) and wait for the client to connect.
**copy the server's PID** to use it in the next step.

2. Run the bonus client program with the server's PID and a message as third argument:
```bash
./client_bonus <server_bonus_pid> 😊
```
The client will send the message to the server, and the server will display the message.

## Final Note
If you have any suggestions or improvements, feel free to open an issue or submit a pull request.
