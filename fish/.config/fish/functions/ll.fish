if type -q exa
  function ll --wraps=exa
    exa --long --git --group $argv
  end
else
  function ll --wraps=ls
    command ls --color=auto -l $argv
  end
end
