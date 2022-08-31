#!/usr/bin/env python3
from ipaddress import ip_address
import requests
import re

def main():
    url = "check-host.net/ip"
    list_input = input("Enter proxy list: ")
    protocol_input = input("Enter protocol: ")

    def format(proxy_list):
        with open(proxy_list) as file:
            while (line := file.readline().rstrip()):
                line = re.split('[-:]', line)
                proxy_protocol = ['http','socks4','socks5']
                proxy_address = line[0]
                proxy_port = line[1]
                
                if (protocol_input == 'http'):
                    address = proxy_protocol[0] + "    " + proxy_address + "    " + proxy_port
                elif (protocol_input == 'socks4'):
                    address = proxy_protocol[1] + "    " + proxy_address + "    " + proxy_port
                elif (protocol_input == 'socks5'):
                    address = proxy_protocol[2] + "    " + proxy_address + "    " + proxy_port
                else:
                    print("invalid protocol")
                
                with open('proxy_formated.txt', 'a') as f:
                    f.write(address + '\n')
                #res = requests.get(url,proxies=)
    format(list_input)

if __name__ == '__main__':
    main()