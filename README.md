This is a Puppet module create really fast for my use but can be a start for someone. 

Feel free to use, fork or most likely improve it. 


Example : 


For server :
  include sensu::server

For client :
  include sensu::client


To install new check add on server :
   sensu::server::check {"$the_check":
	 command		=> "$the_command",
   }
And for script install on client : 
   sensu::client::install {"$the_check":}
