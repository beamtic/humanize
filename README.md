# humanize
humanize

A small, but growing, collection of Linux command wrappers to make the terminal more userfriendly.

The idea is to create a more user-friendly, dialogue, based user experience when using common system commands.

# How to use wrapper scripts from Humanize
Running a humanize wrapper script will prompt the user for input, and give clear instructions as of what to do.

The scripts can be placed in ***/usr/local/bin**

According to the [Filesystem Hierarchy Standard](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html), this is a safe location for custom user scripts, and placing them in this location will allow you to call the script anywhere.

# Compatibility
Scripts are currently only tested on latest version of Ubuntu, but should be broadly compatible with other distributions as well.

I am aiming for broad compatibility with shells, but my knowledge of bash scripting is still limited, so please help fix errors and report any issues you might find.

# Dependencies
Some wrappers, such as the **youtube-dl-askme** wrapper will only work if **youtube-dl** is installed. The purpose of this wrapper is to make it easy for the user to select either **video** or **mp3** as the download option. The wrapper script will automatically take care of calling **youtube-dl** with the relevant option parameters.

# Rules for Contributing
Script wrappers must ask the user for input and give the user clear instructions on how to continiue.

We can do this using the **read** command to save input provided by the user in a variable.

To allow the user to use TAB to complete file paths, **read** may be called with the **-e** option.

Scripts must use the standard **#!/bin/sh** shebang in addition to the **.sh** file extension. The shebang should point to _System Shell_ that is preffered in the distribution.

