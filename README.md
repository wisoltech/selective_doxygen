Selective Doxygen
=================

Script to generate [doxygen][1] documentation for all or a selection of directories,
based on command line parameters.

This script is part of an [article][2].

Usage
-----

Download the script and place it to the directory where the documentation
should be created.

~~~
curl -fLo /path/do/project/doxygen_make.bash \
     https://raw.githubusercontent.com/eglimi/selective_doxygen/master/doxygen_make.bash
~~~

If not already present, generate a new doxygen configuration file.

~~~
doxygen -g
~~~

The script can the be used from anywhere in the filesystem. Without any
parameters, the script generates the documentation for all directories
specified with the `INPUT` parameter in the `Doxyfile`. Otherwise, a space
separated list of directories can be specfied as arguments. Then only the
documentation for the selected directories will be generated.

Note that the script only prints the commands to be executed. To effectively
execute them, pipe the output to `bash`.

Example
-------

~~~
./doxygen_make.sh io util | bash
~~~

More Documentation
------------------

Please read the documentation in the script itself. It might be necessary to
adjust the source directory. Also read the documentation of [doxygen][1] to
understand how to configure doxygen.

[1]: http://www.stack.nl/~dimitri/doxygen/
[2]: http://wisol.ch/w/articles/2014-12-11-doxygen-dynamic-selection/
