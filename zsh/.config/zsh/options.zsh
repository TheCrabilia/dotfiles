setopt ALWAYS_TO_END            # when completing a word, move the cursor to the end of the word
setopt CASE_GLOB                # make globbing (filename generation) sensitive to case
setopt NO_LIST_BEEP             # don't beep on ambiguous completions.

setopt APPEND_HISTORY           # append history to the history file
setopt EXTENDED_HISTORY         # save timestamp and duration of command in the history file
setopt INC_APPEND_HISTORY       # write to the history file immediately, not when shell exits

setopt HIST_VERIFY              # don't execute immediately upon history expansion
setopt HIST_SAVE_NO_DUPS        # don't save duplicates in the history file
setopt HIST_IGNORE_SPACE        # ignore commands that start with a space
setopt HIST_IGNORE_DUPS         # ignore duplicates in the history file
setopt HIST_FIND_NO_DUPS        # don't display duplicates when searching
setopt HIST_EXPIRE_DUPS_FIRST   # expire duplicates first when trimming history

setopt AUTO_CD		            # cd if "command" is a directory
setopt CD_SILENT                # don't print the working direcotry after a cd

setopt AUTO_LIST		        # automatically list choises on an ambiguouse completion
setopt EXTENDED_GLOB	        # treat the # ~ ^ as part of patterns for filename generation
setopt GLOB_DOTS                # include dot files in regular globs
setopt NOTIFY		            # report the status of background jobs immediately
setopt NO_CORRECT_ALL	        # do not correct commands and arguments
setopt NO_BEEP		            # disable beep

setopt AUTO_PUSHD	            # make cd push the old dir onto the dir stack
setopt PUSHD_MINUS	            # exchanges the meanings of + and - when used with a number to specify a dir in the stack
setopt PUSHD_IGNORE_DUPS	    # don't push multiple copies of the same dir onto the dir stack
setopt PUSHD_SILENT             # don't print the directory stack after pushd or popd
setopt PUSHD_TO_HOME            # have pushd without arguments act like "pushd ${HOME}"

setopt INTERACTIVE_COMMENTS     # allow comments starting with # in the interactive shell
setopt NO_CLOBBER               # disallow > to overwrite existing files, use >| or >! instead

setopt NO_BG_NICE               # prevent background jobs being given a lower priority
setopt LONG_LIST_JOBS	        # print job notifications in the long format by default
setopt NO_HUP		            # do not send HUP (Hang UP) signal to running jobs on exit
