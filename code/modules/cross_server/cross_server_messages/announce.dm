/datum/cross_server_message/announce
	name = "announce"

	receive(list/data, datum/game_server/server)
		command_alert(data["body"], data["title"], override_big_title="Communication from [data["station_name"]]")
		global.cooldowns["transmit_centcom"] = 0 // reset cooldown for reply
		return TRUE

	send(datum/game_server/server, title, body)
		return src._send(server, list("title"=title, "body"=body, "station_name"=global.station_name))
