function pdash -d "cd DashOfExile; start pipenv shell; start either [-j]upyter or python [-d]ash"
  # Set up fish argparse https://fishshell.com/docs/current/language.html#variables-argv
  argparse v/verbose h/help j/jupyter d/dash -- $argv
  or return

  if set -ql _flag_help
    echo "Usage: pdash [-j]upyter or python [-d]ash"
    return 0
  end

  # https://github.com/fish-shell/fish-shell/issues/6409
  # Redirect stdout and stderr to /dev/null UNLESS -v is passed
  set -l out_stream # Maybe this isn't necessary?
  if set -ql _flag_verbose
    set out_stream /dev/tty # if blocks are their own local scope, so don't use set -l here!
  else
    set out_stream /dev/null
  end

  # debug -v flag with simple echo here
  echo "Verbose mode on" &>$out_stream

  # Change to the DashOfExile directory
  cd $HOME/poedev/DashOfExile/

  # Start either jupyter or python dash
  # hmmm... I bet I need to prepend `pipenv run` here...?
  if set -ql _flag_jupyter
    pipenv run jupyter lab &>$out_stream &
  else if set -ql _flag_dash
    pipenv run python app.py &>$out_stream &
  else
    echo "Usage: pdash [-j]upyter or python [-d]ash"
    return 1
  end

  # Since we need(?) to use pipenv run to launch jupyter or dash anyway,
  #   We can move $(pipenv shell) to the end of the function
  # Start the pipenv shell
  pipenv shell &>$out_stream

end
