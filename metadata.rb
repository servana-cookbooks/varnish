maintainer        "Skystack"
maintainer_email  "tass@skystack.com"
license           "Skystack Ltd"
description       "Installs and configures varnish"
version           "0.1"

%w{ubuntu debian}.each do |os|
  supports os
end