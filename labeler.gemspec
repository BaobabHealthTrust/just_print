
Gem::Specification.new do |s|
  s.name        = 'labeler'
  s.version     = '1.0'
  s.summary     = 'Label Print Server for touchscreen workstations' 
  s.description = 'Allows printing of labels from a full-screen mode browser without prompting'
  
  s.authors     = 'Baobab Health Trust'
  s.email       = %q{developers@baobabhealth.org}
  s.date        = %q{2011-02-24}
  
  s.executables = ['bin/print', 'bin/print.rb', 'bin/print_via_cgi.rb', 
                   'bin/netcat_server.sh']
  s.has_rdoc    = false

  s.files       = ['bin/print', 'bin/print.rb', 'bin/print_via_cgi.rb', 
                   'bin/netcat_server.sh', 
                   'resources/mimeTypes.rdf', 'resources/rc.local',
                   'README', 'CHANGELOG'
                   ]
end
