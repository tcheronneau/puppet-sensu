class sensu::server inherits client {

  service {"sensu-server":
	ensure		=> stopped,
	require		=> Package["sensu"],
  }

  service {"sensu-api":
	ensure		=> stopped,
	require		=> Package["sensu"],
  }

  sensu::server::check {"load":
	command		=> "check-load.rb -w 1.5,1.5,1.5 -c 3,3,3",
  }

  sensu::server::check {"cpu":
	command		=> "check-cpu.rb",
  }

  sensu::server::check {"memory":
	command		=> "check-memory-percent.rb -w 80 -c 90",
  }

  sensu::server::check {"disks":
	command		=> "check-disk-usage.rb -w 85 -c 95",
  }


}
