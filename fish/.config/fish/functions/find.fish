if type -q gfind
  function find --wraps=gfind
    gfind $argv
  end
end
