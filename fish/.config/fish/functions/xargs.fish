if type -q gxargs
  function xargs --wraps=gxargs
    gxargs $argv
  end
end
