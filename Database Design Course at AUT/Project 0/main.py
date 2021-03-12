#Import libraries
import pandas as pd
import redis

#Call Redis on the system
redis_host = 'localhost'
redis_port = 6379
r = redis.Redis(host = redis_host, port = redis_port, db = 0) #decode_responses = True

#import data
data = pd.read_csv("NYSE_20210301.csv", header = None)
for j in range(len(data)):
    r.set(data[0][j], data[1][j])

#Method "create": (redis keys are in UTF-8!)
def create(key, value):
    if(bytes(key, encoding='UTF-8') not in r.keys()):
        r.set(key, value)
        print("true")
    else:
        print("false")

#Method "fetch":
def fetch(key):
    if(bytes(key, encoding='UTF-8') not in r.keys()):
        print("false")
    else:
        print("true")
        print(r.get(key).decode('UTF-8'))

#Method "update":
def update(key, value):
    if(bytes(key, encoding='UTF-8') not in r.keys()):
        print("false")
    else:
        r.set(key, value)
        print("true")

#Method "delete":
def delete(key):
    if(bytes(key, encoding='UTF-8') not in r.keys()):
        print("false")
    else:
        r.delete(key)
        print("true")

#Get input from console:
condition = True
while(condition):

    cnsl_in = input()
    in_split = cnsl_in.split(" ")

    if in_split[0] == "create":
        create(in_split[1], in_split[2])
    elif in_split[0] == "fetch":
        fetch(in_split[1])
    elif in_split[0] == "update":
        update(in_split[1], in_split[2])
    elif in_split[0] == "delete":
        delete(in_split[1])

