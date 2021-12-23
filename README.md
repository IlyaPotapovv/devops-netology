## Обязательная задача 1
Мы выгрузили JSON, который получили через API запрос к нашему сервису:
```
    { "info" : "Sample JSON output from our service\t",
        "elements" :[
            { "name" : "first",
            "type" : "server",
            "ip" : 7175 
            }
            { "name" : "second",
            "type" : "proxy",
            "ip" : "71.78.22.43"
            }
        ]
    }
```
  Нужно найти и исправить все ошибки, которые допускает наш сервис

## Обязательная задача 2
В прошлый рабочий день мы создавали скрипт, позволяющий опрашивать веб-сервисы и получать их IP. К уже реализованному функционалу нам нужно добавить возможность записи JSON и YAML файлов, описывающих наши сервисы. Формат записи JSON по одному сервису: `{ "имя сервиса" : "его IP"}`. Формат записи YAML по одному сервису: `- имя сервиса: его IP`. Если в момент исполнения скрипта меняется IP у сервиса - он должен так же поменяться в yml и json файле.

### Ваш скрипт:
```python
#!/usr/bin/env python3

import socket as s
import time as t
import json
import yaml
import datetime as dt

i     = 1
hold  = 1
srv   = {'drive.google.com':'1.1.1.1', 'mail.google.com':'1.1.1.1', 'google.com':'1.1.1.1'}
init  = 0

print('СКРИПТ ЗАПУЩЕН')
print(srv)
print('____________________________________________________________________________________________')

while True :
  for host in srv:
    ip = s.gethostbyname(host)
    if ip != srv[host]:
      if i==1 and init !=1:
        print('[ERROR] ' + str(host) +' IP mistmatch: '+srv[host]+' '+ip)
        # json файл
        with open('log.json', 'a') as jsf:
          json_data = json.dumps({host:ip})
          jsf.write(json_data)
        # yaml файл
        with open('log.yaml', 'a') as ymf:
          yaml_data= yaml.dump([{host : ip}])
          ymf.write(yaml_data)
  srv[host]=ip
  #print(i) использовал для поиска ошибок
  i=i+1
  if i >=2 :
   break
  t.sleep(hold)
```

### Вывод скрипта при запуске при тестировании:
```
[ERROR] drive.google.com IP mistmatch: 1.1.1.1 64.233.165.194
[ERROR] mail.google.com IP mistmatch: 1.1.1.1 64.233.165.17
[ERROR] google.com IP mistmatch: 1.1.1.1 173.194.222.101
```

### json-файл(ы), который(е) записал ваш скрипт:
```json
{"drive.google.com": "64.233.165.194"}
{"mail.google.com": "64.233.165.17"}
{"google.com": "173.194.222.101"}
```

### yml-файл(ы), который(е) записал ваш скрипт:
```yaml
- drive.google.com: 64.233.165.194
- mail.google.com: 64.233.165.17
- google.com: 173.194.222.101
```