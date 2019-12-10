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
Bash is useful to chain system commands and execute things in order, so we should not move away from it entirely. It clearly has its uses. In Python, you will need to call commands via _os.system(cmd)_, and likewise, in PHP you need to use _shell_exec()_, so while scripting languages are much better, bash is still best for basic chaining of commands.

Bash also has compatibility issues. We probably broadly refer to it as bash scripting, but there are other shells in use as well, and not all of them are compatible. 

Complex stuff is probably best done purely in Python, or perhaps even by using a bash script in combination with a Python _helper script_.

Regular expressions can be very tough to make using _sed_ in bash, and stuff that require complex use of regular expressions is therefor better handled in other scripting languages. In addition, a simple task such as expanding the tilde (**~**) character used in path names is very complex in pure bash, and should be avoided in favor of _helper scripts_. Most of us will likely think of tilde as a "shortcut" to the _home directory_ of the calling user, but it is also used for other purposes, such as linking to the home directories for other users I.e. (**~otherUserName/Path**), and it might also appear in file names on rare occasion.

While safe solutions might exist in pure bash, for the sanity of other people who might work on the scripts, it is best to use a more robust scripting language. Another problem is, having "large" functions that deal with hacking around issues in bash is just going to take up room in your scripts, making them harder to understand.

Bash is useful to run system commands in order, and basic conditionals, but it is brutal when it comes to more complex stuff, including tilde expansion, some conditional execution, loops and reguler expression use with sed. Please avoid making too complex logic in bash scripts.

# Issues with bash
In bash, even writing a simple if statement can be a nightmare to someone unfamilier with the syntax. Comparing numbers seem to be plain broken in some cases (bash variables are untyped), and when we compare strings contained in variables, we need to remember to use double quotes areound the variables.

I.e: 
```
  if [ "$some_var" = "$other_var" ]
  then
    printf '\n  The variables matched!\n\n'
  fi
```
Note that even the **space** characters is needed for the _i block_ to work. If you forgot a space, the statement would be broken. Now, compare this insanity to the syntax in your favorite scripting language, in my case this is PHP:

```
  if ($some_var == $other_var ) {
    echo "The variables matched\n\n";
  }
```

The above might look ugly, but it will work. People who are new to bash might not include spaces at all. They also have to remember to use double quotes around variables. These two syntax errors is a nasty combination that will leave people scratching their heads as to why their beautiful if statement is not working, when "clearly" they have written it correctly.

I will not go into much more detail in this Readme, but we should be aware that there are issues with basic stuff in bash that does not exist when using other languages.




