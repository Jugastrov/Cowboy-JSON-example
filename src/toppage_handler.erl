%% Feel free to use, reuse and abuse the code in this file.

%% @doc POST echo handler.
-module(toppage_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

init(_Transport, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
	{Method, Req2} = cowboy_req:method(Req),
	HasBody = cowboy_req:has_body(Req2),
	{ok, Req3} = maybe_echo(Method, HasBody, Req2),
	{ok, Req3, State}.

maybe_echo(<<"POST">>, true, Req) ->
	{ok, Body, Req2} = cowboy_req:body(Req),
	io:format("JSON Body: ~p~n",[Body]),

	List = jsonx:decode(Body, [{format, proplist}]),
	io:format("List: ~p~n",[List]),

	Echo = proplists:get_value(<<"echo">>, List),
	io:format("Echo: ~p~n",[Echo]),

	Reply = jsonx:encode([{reply,Echo}]),
	io:format("JSON Reply: ~p~n",[Reply]),

	echo(Reply, Req2);

maybe_echo(<<"POST">>, false, Req) ->
	cowboy_req:reply(400, [], <<"Missing body.">>, Req);
maybe_echo(_, _, Req) ->
	%% Method not allowed.
	cowboy_req:reply(405, Req).

echo(undefined, Req) ->
	cowboy_req:reply(400, [], <<"Missing echo parameter.">>, Req);
echo(Echo, Req) ->
	cowboy_req:reply(200,
		[{<<"content-encoding">>, <<"utf-8">>}], Echo, Req).

terminate(_Reason, _Req, _State) ->
	ok.
