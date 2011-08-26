
Gem::Specification.new do |s|
  s.name        = 'just_print'
  s.version     = '1.0'
  s.summary     = 'Just Print without prompting on touchscreen workstations' 
  s.description = 'Allows printing of labels from a full-screen mode browser without prompting'
  
  s.authors     = 'Baobab Health Trust'
  s.email       = %q{developers@baobabhealth.org}
  s.date        = %q{2011-04-15}
  
  s.executables = ['print', 'print.rb', 'print_via_cgi.rb', 
                   'netcat_server.sh']
  s.has_rdoc    = false

  s.files       = ['bin/print', 'bin/print.rb', 'bin/print_via_cgi.rb', 
                   'bin/netcat_server.sh', 
                   'resources/mimeTypes.rdf', 'resources/rc.local',
                   'README', 'CHANGELOG'
                   ]
end
