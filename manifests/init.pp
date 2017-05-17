class wintesti {
	include chocolatey

	Package {
		ensure => "installed",
		provider => "chocolatey",
	}


	package {["firefox", "steam", "rainmeter", "adblockplus-firefox", "teamspeak"]:}
	
	file { "c:/Program Files/Mozilla Firefox/mozilla.cfg":
                content => template("wintesti/mozilla.cfg.erb"),
        }

	file { "c:/Program Files/Mozilla Firefox/defaults/pref/autoconfig.js":
                content => template("wintesti/autoconfig.js.erb"),
	}
	
	file { "c:/Users/Tom/Documents/Rainmeter/":
		ensure => "directory",
		recurse => "remote",
		owner => "Tom",
		mode => 0755,
		source => "puppet:///modules/wintesti/Rainmeter",
		
	}
	
	file { "c:/Users/Tom/AppData/Roaming/Rainmeter/Rainmeter.ini":
		content => template("wintesti/Rainmeter.ini.erb"),
		require => Package["rainmeter"],
	}
}
