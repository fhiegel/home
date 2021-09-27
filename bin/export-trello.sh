#!/bin/sh

curl -X GET 'https://api.trello.com/1/search?query=board:Sph%C3%A9rier&key=SECRETKEY&token=TOKEN&modelTypes=cards&card_fields=name,shortUrl,desc&cards_limit=1000' \
	| jq -r '.cards[] | "# <a name=\""+(.shortUrl)+"\">" + (.name) +"</a>


" + (.desc) + "
"'
