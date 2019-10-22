import socket
import os

HOST = '10.0.1.136'  # Standard loopback interface address (localhost)
PORT = 65432     # Port to listen on (non-privileged ports are > 1023)

dataFromClient = ""

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    conn, addr = s.accept()
    with conn:
        print('Connected by', addr)
        while True:
            data = conn.recv(1024)
            print(data)
            if not data:
                break
            dataFromClient = data.decode('utf-8')
            conn.sendall(data)
            break

fileName = 'tempfile.py'
with open(fileName,'w+') as f:
    f.write(dataFromClient)

os.system(f"python3 {fileName}")