#!/bin/bash

# Execute doxygen on all or a selection of directories.
#
# If no parameter is specified to this script, it executes doxygen on all
# directories specified with the `INPUT` parameter in the `Doxyfile`.
#
# Alternatively, a space separated list of directories can be specified. The
# directories are expected to be relative to `src_dir` directory.
#
# For example
#    ./doxygen_make.sh io util
# creates the documentation for `io` and `util`.
#
# Note that the script only prints the commands to be executed. If you want to
# execute them directly, pipe the output to bash. E.g.
#    doxygen_make.sh | bash
#
# Also note that the script uses bash for execution. Since parts of the script
# is bash specific (arrays), it will not run on plain sh.

# The directory of this script. This makes it possible to call this script
# from anywhere, not only from within the current directory.
script_dir="$( cd "$( dirname "$0" )" && pwd )"

# Source directory. This should be changed if it is different from the directory
# where this script is located.
src_dir=$script_dir


# We will overwrite the `OUTPUT_DIRECTORY` variable, in order to ensure that
# it matches the directory where this script is located.
doxygen_opts=$(printf 'OUTPUT_DIRECTORY=%s' "$script_dir") 

# Command to create the complete documentation
if [ $# -eq 0 ]; then
    printf "(cat %s ; printf '$doxygen_opts') | doxygen -" "$script_dir/Doxyfile"
	exit
fi

# Command to create the documentation for selected directories.
selected_dirs=($@)
selected_dirs_array=( "${selected_dirs[@]/#/$src_dir/}" )
doxygen_opts=$(printf 'OUTPUT_DIRECTORY=%s\nINPUT=%s' "$script_dir" "${selected_dirs_array[*]}")
printf "(cat %s ; printf '$doxygen_opts') | doxygen -" "$script_dir/Doxyfile"
