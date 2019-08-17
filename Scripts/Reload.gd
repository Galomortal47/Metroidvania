extends Label

func reload():
	for i in range(0,4):
		if get_parent().get_child(i).enable:
			get_parent().get_child(i).reload()
			get_parent().get_child(i).update_text()
