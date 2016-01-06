class sensu::client {
#  include "sensu::check"
  include "sensu::handler"
  include "sensu::script"
	
  exec {"get_sensu":
	command 	=> "/usr/bin/wget -q http://repositories.sensuapp.org/apt/pubkey.gpg -O- | /usr/bin/apt-key add - && /bin/echo \"deb     http://repositories.sensuapp.org/apt sensu main\" | /usr/bin/tee /etc/apt/sources.list.d/sensu.list",
	creates		=> "/etc/apt/sources.list.d/sensu.list",
  }

  package {"sensu":
	ensure		=> installed,
	require		=> Exec["get_sensu"],
  }

  service {'sensu-client':
	ensure		=> stopped,
	require		=> Package["sensu"],
  }

  exec {"update":
	command		=> "/usr/bin/apt-get update",
	before		=> Package["sensu"],
	unless		=> "/usr/bin/test -e /etc/sensu",
  } 

  file {"rabbit":
	ensure		=> present,
	path		=> "/etc/sensu/config.json",
	source		=> "puppet:///modules/sensu/config.json",
	require		=> Package["sensu"],
	notify		=> Service["sensu-client"],
  }

  file {"client":
	ensure		=> present,
	path		=> "/etc/sensu/conf.d/client.json",
	content		=> template("sensu/client.erb"),
	require		=> Package["sensu"],
	notify		=> Service["sensu-client"],
  }


}
