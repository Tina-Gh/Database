#Tina Gholami
#Databases Lab - Final Project: Redis URL Shortner
#Amirkabir University of Technology (Tehran Polytechnique) - Spring 2021 
#......................................................................#
#Importing libraries:
# import pandas as pd
import matplotlib.pyplot as plt 
import numpy as np
from collections import Counter
import random
import redis
import string
import random
from datetime import datetime, timedelta
import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)

#Call Redis on the system:
redis_host = 'localhost'
redis_port = 6379
r = redis.Redis(host = redis_host, port = redis_port, db = 0)

print('Please choose how to proceed:')
print('"input": feeding in some new data')
print('"graph": Seeing the Dashboard graphs (part 1)')
print('"popularity": Seeing the Dashboard top 3 popular links (part 2)')
print('"mappings": Seeing the Dashboard mappings and their TTL (part 3)')
first = input()


#Get input from console:
if first == 'input':
    condition = True
    while(condition):
        url = input()
        if url == 'stop':
            break

        if len(url) > 6:
            long_url = url
            if bytes(long_url, encoding='UTF-8') not in r.hmget(long_url, 'long_url'): #!!!#
                short_url = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(6))
                refer_num = 0
                r.hmset('All_Data_Links', {short_url:long_url})

                temp_dict = {'short_url':short_url, 'long_url':long_url, 'references':refer_num, 'new_date':datetime.today().strftime('%d')} #%Y-%m-%d-%H:%M:%S
                r.hmset(long_url, temp_dict) 
                #Or:
                # r.hset(long_url, 'short_url', short_url)
                # r.hset(long_url, 'references', refer_num)
                r.expire(long_url, 604800) #TTL for one week = 604800
    
                r.hmset('short_url_num_call', {short_url:refer_num}) #refer_num = 0

                print(r.hgetall(long_url))



            else:
                r.hincrby(long_url, 'references', 1)
                print(r.hgetall(long_url))
            

        elif len(url) == 6:
            short_url = url
            r.expire(short_url, 604800)
            r.persist(r.ttl(short_url)) 
            r.hincrby('short_url_num_call', short_url, 1)
            if bytes(short_url, encoding='UTF-8') not in r.hkeys('All_Data_Links'): #Searches for short URLs
                print('hi! There is an error! Since the link has not been registered in our database! :D')
            
            else:
                temp_date = random.randint(0, 5) #Just for the sake of introducing more variety in the second graph!
                temp_key = r.hmget('short_url_num_call', short_url)[0]
                temp_key = temp_key.decode('utf8')
                temp_time = (datetime.today() + timedelta(2)).strftime('%d') #temp_date
                r.hmset(short_url, {temp_time:temp_key}) #MUST BE: temp_time:temp_key
                # r.hset('Date_Refer', short_url, datetime.today().strftime('%d')) #%Y-%m-%d-%H:%M:%S
                flag = r.hget('All_Data_Links', short_url)
                print('The link is:' + ' ' + flag.decode('UTF-8'))


#Manually adding data for test:
add_data = False #It was True before, for adding data.
if add_data == True:
    r.hmset('www.longgoogle.com', {'short_url':'salam1', 'long_url':'www.longgoogle.com', 'references':3, 'new_date':(datetime.today() + timedelta(2)).strftime('%d')})
    r.expire('www.longgoogle.com', 604800)
    r.hmset('www.longyahoo.com', {'short_url':'salam2', 'long_url':'www.longyahoo.com', 'references':1, 'new_date':(datetime.today() + timedelta(1)).strftime('%d')})
    r.expire('www.longyahoo.com', 604800)
    r.hmset('www.longlinkedin.com', {'short_url':'salam3', 'long_url':'www.longlinkedin.com', 'references':0, 'new_date':(datetime.today() + timedelta(0)).strftime('%d')})
    r.expire('www.longlinkedin.com', 604800)
    r.hmset('www.longfacebook.com', {'short_url':'salam4', 'long_url':'www.longfacebook.com', 'references':0, 'new_date':(datetime.today() + timedelta(0)).strftime('%d')})
    r.expire('www.longfacebook.com', 604800)
    r.hmset('www.longgithub.com', {'short_url':'salam5', 'long_url':'www.longgithub.com', 'references':0, 'new_date':(datetime.today() + timedelta(0)).strftime('%d')})
    r.expire('www.longgithub.com', 604800)

    r.hmset('All_Data_Links', {'salam1':'www.longgoogle.com'})
    r.hmset('All_Data_Links', {'salam2':'www.longyahoo.com'})
    r.hmset('All_Data_Links', {'salam3':'www.longlinkedin.com'})
    r.hmset('All_Data_Links', {'salam4':'www.longfacebook.com'})
    r.hmset('All_Data_Links', {'salam5':'www.longgithub.com'})

    r.hset('Date_Refer', 'www.longgoogle.com', (datetime.today() + timedelta(3)).strftime('%d'))
    r.hset('Date_Refer', 'www.longgoogle.com', (datetime.today() + timedelta(4)).strftime('%d'))
    r.hset('Date_Refer', 'www.longgoogle.com', (datetime.today() + timedelta(5)).strftime('%d'))
    r.hset('Date_Refer', 'www.longyahoo.com', (datetime.today() + timedelta(3)).strftime('%d'))
    r.hset('Date_Refer', 'www.longlinkedin.com', (datetime.today() + timedelta(0)).strftime('%d'))
    r.hset('Date_Refer', 'www.longfacebook.com', (datetime.today() + timedelta(0)).strftime('%d'))
    r.hset('Date_Refer', 'www.longgithub.com', (datetime.today() + timedelta(0)).strftime('%d'))



# Method "Dashboard":
elif first == 'graph':
    #part 1:
    date_new= []
    date_refer = []
    refer_dict_keys_lst = []
    refer_dict_values_lst = []
    refered_link_dates_lst = []
    refered_link_num_lst = []
    for i in r.hvals('All_Data_Links'): #related to the first graph -> new links
        i = i.decode('UTF-8')
        date_new.append(int(r.hget(i, 'new_date')))

    for j in r.hkeys('All_Data_Links'): #related to the second graph -> referenced short links
        j = j.decode('UTF-8') #Just making the list of referenced dates into a propper shape lol!
        if r.hgetall(j) != {}:
            refer_dict = r.hgetall(j)
            refer_dict_keys = r.hkeys(j)
            refer_dict_keys_lst.append(refer_dict_keys)
            refer_dict_values = r.hvals(j)
            refer_dict_values_lst.append(refer_dict_values)
    for k in range(0, len(refer_dict_keys_lst)):
        for r in range(0, len(refer_dict_keys_lst[k])):
            refer_dict_keys_lst[k][r] = int(refer_dict_keys_lst[k][r].decode('UTF-8'))
            refer_dict_values_lst[k][r] = int(refer_dict_values_lst[k][r].decode('UTF-8'))
    for k in range(0, len(refer_dict_keys_lst)): 
        for r in range(0, len(refer_dict_keys_lst[k])-1):
            refer_dict_values_lst[k][r+1] -= refer_dict_values_lst[k][r]
    for k in range(0, len(refer_dict_keys_lst)):
        for r in range(0, len(refer_dict_keys_lst[k])):
            refered_link_dates_lst.append(refer_dict_keys_lst[k][r])
            refered_link_num_lst.append(refer_dict_values_lst[k][r])
    totals = {} #Making a dictionary of the non-repeating dates
    for i in range(0, len(refered_link_dates_lst)):
        totals[refered_link_dates_lst[i]] = totals.get(refered_link_dates_lst[i], 0) + refered_link_num_lst[i]

    data_dict = dict(Counter(date_new)) #The first graph for the new links
    x = list(data_dict.keys())
    y = list(data_dict.values())
    fig = plt.figure(1)
    plt.bar(x, y, color = 'blue', label = 'New Links')
    plt.title('New Links VS Days Graph')
    plt.xlabel('Days')
    plt.ylabel('Count New Links')
    plt.legend()
    plt.show()
    
    data_dict_2 = totals #The second graph for the referenced links
    x_2 = list(data_dict_2.keys())
    y_2 = list(data_dict_2.values())
    fig = plt.figure(2)
    plt.bar(x_2, y_2, color = 'red', label = 'References')
    plt.title('References to Short URLs VS Days Graph')
    plt.xlabel('Days')
    plt.ylabel('Count References to Short URLs')
    plt.legend()
    plt.show()
#part 2
elif first == 'popularity':
    lst = []    
    for x in r.hvals('All_Data_Links'):
        x = x.decode('UTF-8')
        lst.append(r.hgetall(x))
    lst = sorted(lst, key = lambda k: k[bytes('references', encoding='UTF-8')], reverse = True) #sort by key 'references' 
    print(lst[0:3])
#part 3
elif first == 'mappings':
    for x in r.hvals('All_Data_Links'):
        x = x.decode('UTF-8')
        print(r.hgetall(x))
        print('The TTL is: {0}' .format(r.ttl(x)))
        print('***')

