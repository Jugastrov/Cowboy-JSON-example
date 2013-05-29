Cowboy echo_post с JSON. 
-------
(Подразумевается, что уже установлены erlang и rebar)

Делаем так:

```
$ rebar get-deps compile

$ ./start.sh

$ ./curl_post.sh STRING_TO_ECHO
```

Пример
-------
```
$ ./curl_post.sh hello
HTTP/1.1 200 OK
connection: keep-alive
server: Cowboy
date: Wed, 29 May 2013 17:05:09 GMT
content-length: 17
content-encoding: utf-8`

{"reply":"hello"}
```
