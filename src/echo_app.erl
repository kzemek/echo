%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(echo_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
	{ok, _} = ranch:start_listener(echo, 1,
		ranch_etls, [{port, 5555}, {certfile, "/tmp/server.pem"},
		             {keyfile, "/tmp/server.key"}], echo_protocol, []),
	echo_sup:start_link().

stop(_State) ->
	ok.
