import requests, codecs
from bs4 import BeautifulSoup
import re
from sys import argv

params = {
	'email':'dodaihoc.abvk@gmail.com',
	'password':'FWAXW',
	'rememberMe':'rememberMe',
	'submitted':'Y',
	'forgot':'N',
	'request':''
}

header = {
	'Host': 'thegioisongngu.com',
	'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0',
	'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
	'Accept-Language': 'en-US,en;q=0.5',
	'Accept-Encoding': 'gzip, deflate',
	'Referer': 'http://thegioisongngu.com/login/',
	'Cookie': '__cfduid=d7c05478e3a3553592e532dac7b9c46701458140686; PHPSESSID=e7ba858eeecd6f2790b9e796125d7560; cookie_data_lastviewed_widget_2=1370%2C1873%2C1880',
	'Connection': 'keep-alive'
}

script, url = argv
f = open('data.html','a')

response = requests.post(url, data=params, headers=header)
response.encoding = 'utf-8'
# codecs.open('test.html','w','utf-8').write(response.text)
soup = BeautifulSoup(response.text,'lxml')
content = soup.find_all('td')
for member in content:
	text = member.text	
	f.write(text.encode('UTF-8'))
	f.write('\n')

print "success crawl URL: " + url
