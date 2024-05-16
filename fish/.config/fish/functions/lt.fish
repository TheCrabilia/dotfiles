if type -q exa
  function lt --wraps=exa
    exa --long --git --group -snew $argv
  end
else
  function lt --wraps=ls
    command ls --color=auto -lt $argv
  end
end
