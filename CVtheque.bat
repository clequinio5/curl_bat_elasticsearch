@echo off 
:again 
	set /p query=Query?
	%~dp0\curl\bin\curl.exe -X POST "192.168.0.112:9200/cvs/_search?pretty" -H "Content-Type: application/json" -d"{\"_source\": [\"file.url\"],\"query\": {\"query_string\": {\"query\" : \"%query%\",\"default_field\" : \"content\"}},\"highlight\": {\"fields\": {\"content\": {\"fragment_size\": 100,\"number_of_fragments\": 3}}}}"
	rem echo %query%
	goto again
