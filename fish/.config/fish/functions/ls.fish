if type -q exa
  function ls --wraps=exa
    exa $argv
  end
else
  function ls --wraps=ls
    command ls --color=auto $argv
  end
end
