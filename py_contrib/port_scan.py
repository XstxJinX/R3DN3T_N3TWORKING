#!/bin/python3

import pyfiglet
import sys
import socket
from time import sleep
from datetime import datetime

ascii_banner = pyfiglet.figlet_format("REDNET-P0RTS")

print("-" * 70)
print(ascii_banner)

target = input(str("Target-IP : "))
print("-" * 70)
sleep(1)
print("Scanning Target : " + target)
print("Scanning started at : " + str(datetime.now()))
sleep(1)
print("\n[*] THIS MAY TAKE A WHILE ! [*]")
print("_" * 70)


try:
    for port in range(1,65535):
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        socket.setdefaulttimeout(0.5)

        result = s.connect_ex((target,port))
        if result == 0:
            print("[*] Port {} is open".format(port))
            s.close()
except KeyboardInterrupt:
    print("\n Exiting . . . ")
    sys.exit()
except socket.error:
    print("\ Host not responding.")
    sys.exit()