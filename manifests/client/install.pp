define sensu::client::install { 

  exec {"${name}":
	command 	=> "/usr/bin/sensu-install -p ${name} && /usr/bin/touch /tmp/${name}",
	unless		=> "/usr/bin/test -e /tmp/${name}",
	require		=> Package["sensu"],
  }

}	
