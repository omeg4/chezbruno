# Completions for ~/.local/bin/cheatsheet
complete -c cheatsheet -f

complete -c cheatsheet -s a -l add -d 'Add entry (default: clipboard; . = cwd; - = stdin)'
complete -c cheatsheet -n '__fish_seen_argument -s a -l add' -F
complete -c cheatsheet -s d -l desc -x -d 'Entry description'
complete -c cheatsheet -s l -l lang -x -a '(cheatsheet --langs 2>/dev/null)' -d 'Snippet language'
complete -c cheatsheet -s c -l category -x -a 'cli paths snippets' -d 'Force category'
complete -c cheatsheet -s p -l pwd -d 'Add current directory'
complete -c cheatsheet -s L -l list -d 'Print entries to the terminal'
complete -c cheatsheet -n '__fish_seen_argument -s L -l list' -a 'cli paths snippets'
complete -c cheatsheet -s e -l edit -d 'Edit data file in $EDITOR'
complete -c cheatsheet -s f -l force -d 'Skip the secret check'
complete -c cheatsheet -l no-sync -d "Don't commit/push this change via chezmoi"
complete -c cheatsheet -l sync -d 'Commit/pull/push the data file via chezmoi now'
complete -c cheatsheet -l langs -d 'List known snippet languages'
complete -c cheatsheet -s h -l help -d 'Show help'
