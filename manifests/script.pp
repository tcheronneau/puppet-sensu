class sensu::script {

  $requirements=["bc", "ruby-dev", "gcc", "make"]

  sensu::client::install {"disk-checks":}
  sensu::client::install {"cpu-checks":}
  sensu::client::install {"load-checks":}
  sensu::client::install {"memory-checks":
	require	=> Package[$requirements]
  }

  package {$requirements:
	ensure	=> installed,
  }
}
