-module(host_this). 
-export([start/3]). 
-author("Dennis McGrogan <char68.net>").

%% Kicks off the http server on the given port (80 for http)
start(ServerLogDirectory, IndexHTMLDirectory, Port) ->
   _ = inets:start(),
   inets:start(
      httpd, 
      [ 
         %% Additional parameters at http://erlang.org/doc/man/httpd.html
         {port, Port}, 
         {server_name, "host_this"}, 
         {document_root, IndexHTMLDirectory}, %% Top directory of publicly available documents on the http server
         {server_root, ServerLogDirectory}, %% Home directory of server where logs can be written
         {directory_index, ["index.html"]},
         {mime_types, [ {"html","text/html"}, {"css","text/css"}, {"js","application/x-javascript"} ]} 
      ]
   ).