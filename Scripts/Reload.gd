extends Label

func reload():
	if get_parent().get_node("Bomb").enable:
		get_parent().get_node("Bomb").reload()
		get_parent().get_node("Bomb").update_text()
	
	if get_parent().get_node("Gun").enable:
		get_parent().get_node("Gun").reload()
		get_parent().get_node("Gun").update_text()
	
	if get_parent().get_node("Shotgun").enable:
		get_parent().get_node("Shotgun").reload()
		get_parent().get_node("Shotgun").update_text()