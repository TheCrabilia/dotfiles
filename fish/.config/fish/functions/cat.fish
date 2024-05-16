if type -q bat
  function cat --wraps=bat
    bat $argv
  end
end
