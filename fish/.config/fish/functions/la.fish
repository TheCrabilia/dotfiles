if type -q exa
  function la --wraps=exa
    exa --long --all --git --group $argv
  end
else
  function la --wraps=ls
    command ls --color=auto -la $argv
  end
end
