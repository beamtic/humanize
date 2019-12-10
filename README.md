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

We can do this in _bash_ by using the **read** command, which allows us to save input provided by the user in a variable for later use. To allow the user to use TAB to complete file paths, **read** may be called with the **-e** option.

**Bash** scripts must use the standard **#!/bin/sh** shebang in addition to the **.sh** file extension. The shebang will point to _System Shell_ that is preffered in the distribution.

# Moving away from bash
Bash is useful to chain system commands and execute things in order, so I am not planning on moving away from it entirely. It clearly has its uses. In Python, you will need to call system commands via _os.system(cmd)_, and in PHP you need to use _shell_exec()_, so while bash is useful for basic chaining of commands, it is not very practical for more complex stuff.

Complex stuff is probably best done purely in Python, or perhaps even by using a Python helper script. For example, regular expressions can be very tough to make using _sed_ in bash, and stuff that require complex use of regular expressions are therefor probably better handled in other scripting languages. In addition, a simple task such as expanding the tilde (~) character used in path names is very complex in pure bash, and should probably be avoided in favor of helper scripts. Most of us will likely think of tilde as a "shortcut" to the home directory, but it is also used for other purposes, such as getting home directories for other users I.e. (~otherUserName/Path), and it might also appear in file names on rare occasion.

While safe solutions might exist in pure bash, it is best to use a more robust scripting language for the sanity of other people who might work on the scripts.

Bash is useful to "chain" system commands, but it is brutal when it comes to basic conditional execution, tilde expansion, loops and reguler expression use with sed. Please avoid making too complex ligic in bash scripts.

# Issues with bash
In bash, even writing a simple if statement can be a nightmare to someone unfamilier with the syntax. Comparing int values seem to be plain broken in some cases, and when you compare strings contained in variables, you need to remember to use double quotes areound your variables.

I.e: 
```
  if \[ "$some_var" = "$other_var" \]
  then
    printf '\n  The variables matched!\n\n'
  fi
```
Note that even the **space** characters are needed for the block to work. If you forgot a space, the statement would be broken. Now, compare this insanity to the syntax in your favorite scripting language, in my case this is PHP:

```
  if ($some_var == $other_var ) {
    echo "The variables matched\n\n";
  }
```

Not that you would actually code this way, as it would look ugly. But, people who are new to bash might not include spaces at all, which breaks their statement. In addition, they also have to remember to use double quotes around variables. This is a nasty combination that will leave people scratching their heads as to why their beautiful if statement is not working, when "clearly" they have written it correctly.

I will not go into much more detail in this Readme, but we should be aware that there are issues with bash that does not exist when using Python or PHP. Since PHP is mostly a web language, we should probably not expect people to have it installed. Python is used for much more than just web stuff.




