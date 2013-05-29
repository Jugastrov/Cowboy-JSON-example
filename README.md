Cowboy echo_post Hello World with JSON. 
-------

To compile this example you need rebar in your PATH.

Type the following command:

```
$ rebar get-deps compile

$ ./start.sh

$ ./curl_post.sh STRING_TO_ECHO
```

Example
-------
Terminal 1:
```
./start.sh
1> Run ./curl_post.sh STRING_TO_ECHO 
```
Terminal 2:
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
Terminal 1:
```
JSON Body: <<"{\"echo\":\"hello\"}">>
List: [{<<"echo">>,<<"hello">>}]
Echo: <<"hello">>
JSON Reply: <<"{\"reply\":\"hello\"}">>
