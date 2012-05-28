Setup.Package
{
 	vendor = "liflg.org",
 	id = "homm3",
 	description = "Heroes of Might and Magic 3",
 	version = "1.3.1a-english",
 	splash = "splash.png",
 	superuser = false,
	write_manifest = true,
 	support_uninstall = true,
 	recommended_destinations =
 	{
 		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
 	},

 	Setup.Readme
 	{
 		description = "README",
 		source = "README.liflg"
 	},

	Setup.Media
 	{
 		id = "homm3-disc",
		description = "Heroes 3 Loki disc",
		uniquefile = "Heroes_III_Tutorial.pdf"	
 	},

	Setup.Option {
		required = true,
		description = "Files for Heroes 3",
		bytes = 397391706,  
                Setup.DesktopMenuItem
                {
                	disabled = false,
			name = "Heroes 3",
                        genericname = "Heroes 3",
                        tooltip = "Play Heroes 3",
                        builtin_icon = false,
                        icon = "icon.xpm",
                        commandline = "%0/homm3.dynamic.sh",
                        category = "Game",
                },
		
		Setup.File {
			source = "media://homm3-disc/bin/x86/",
			permissions = "755",
		},

		Setup.File {
			source = "media://homm3-disc/",
			allowoverwrite = true,
			wildcards = {"Heroes_III_Tutorial.pdf", "README", "icon.xpm", "icon.bmp", "mp3/*", "data/*", "maps/*" },
		},

		Setup.File {
			allowoverwrite = true,
			source = "media://homm3-disc/hiscore.tar.gz",
		},

		Setup.File 
		{
			wildcards =  "homm3.sh",
			permissions = "0755",
		},

		Setup.File
		{	
			wildcards = "README.liflg",
		},
		
		Setup.Option {
			value = false,
			description = "Install the map editor (WARNING: highly unstable)",
			bytes = 5736818,
			Setup.File {
				source = "base:///h3maped-1_0-i686.tar.gz/",
				allowoverwrite = true,
				filter = function(dest)
					if( string.match( dest, "h3maped-1.0-i686/h3maped") ) then
						return dest, "755"
					end
					return dest
				end
			},

			Setup.File {
				wildcards = "h3maped.sh",
				permissions = "755",
			},
			
			Setup.DesktopMenuItem
                	{
				disabled = false,
				name = "Heroes 3 Map Editor",
				genericname = "Heroes 3 Map Editor",
				tooltip = "Start the Heroes 3 Map Editor",
				builtin_icon = false,
				icon = "icon.xpm",
				commandline = "%0/h3maped.sh",
				category = "Game",
			},
		},

		Setup.Option {
			value = true,
			required = true,
			description = "Apply Patch 1.3.1a",
			tooltip = "Latest update from Loki",
			bytes = 6440960,
			Setup.File{
				allowoverwrite = true,
				source = "base:///patch-1_3_1a.tar/",
				filter = function(dest)
					if ( string.match( dest, "homm3" ) ) then
						return dest, "0755"
					end
					return dest
				end
			},

			Setup.File{
				wildcards = "homm3.dynamic.sh",
				permissions = "755",
			},
		},
				
		Setup.Option {
			value = true,
			description = "Install Loki-Compat libs, strongly recommended",
			tooltip = "Needed for multiplayer",
			bytes = 5477376, 
			Setup.File{
				allowoverwrite = true,
				source = "base:///loki_compat_libs-1.3.tar.bz2/",
			},
		},
	},
}			
