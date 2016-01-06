define sensu::server::check (
	$command	= undef,
	$interval	= "10",
	$subscribers = "all",
  ){

  file { "${name}":
	ensure		=> present,
	path		=> "/etc/sensu/conf.d/${name}.json",
	content		=> template("sensu/check.erb"),
	owner		=> "sensu",
	group		=> "sensu",
	notify		=> Service["sensu-server"],
  }

}
