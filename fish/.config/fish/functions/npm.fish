function npm --wraps=npm
  if type -q nc; and nc -zw 1 artifactory.swisscom.com 443
    command npm config set registry https://artifactory.swisscom.com/artifactory/api/npm/npm-remote
  else
    command npm config delete registry
  end
  command npm $argv
end
