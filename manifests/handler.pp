class sensu::handler {

  file {"email":
	ensure		=> present,
	path		=> "/etc/sensu/handlers/mail_handler.json",
	source		=> "puppet:///modules/sensu/mail_handler.json",
	require		=> Package["sensu"],
	notify		=> Service["sensu-client"],
  }

}
