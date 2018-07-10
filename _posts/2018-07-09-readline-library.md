---
title: Readline library tutorial
description: Readline is a gnu library that we unknowingly use daily to write/edit commands on terminal.
categories:
- tutorial
subtitle: sample subtitle
tags:
- tutorial
- terminal
- readline library
---

> [Readline](https://tiswww.cwru.edu/php/chet/readline/rltop.html) is a gnu library that we unknowingly use daily to write/edit commands on terminal. Really? Yes, we use it daily, though only small portion.
So fire up the terminal.

I have included only those keystrokes which might be most useful. You can get a complete list from this  [documentation](https://tiswww.cwru.edu/php/chet/readline/rltop.html).

<!-- more -->

## Meta key
By default, *`Meta`* key is mapped to your *`ESC`* key or *`ALT`* key. It is recommended that you bind to left *`ALT/Option`* key.
### Iterm2 setting
*`Preferences`* -> *`Keys`* -> *`Left Option key act as : +Esc`*
### Mac Terminal setting
*`Preferences`* -> *`Profiles`* -> *`Keyboard`* -> *`Use Option as Meta key`*

## Terminal cursor navigation
Readline provides methods to make cursor jump some set of characters/words.
### Character navigation
Though we can use right and left arrows but to make it complete, following are the corresponding keys.
1. *`Ctrl + f`* - Move forward one character
2. *`Ctrl + b`* - Move backward one character

### Word navigation
Here, a word is composed of letters and digits.
1. *`Meta + f`* - Move forward a word
2. *`Meta + b`* - Move backward a word

### Extremes navigation
1. *`Ctrl + a`* - Move to the start of line
2. *`Ctrl + e`* - Move to the end of line

### Clear screen
* *`Ctrl + l`* - Clear the screen and move the prompt to top of screen.

## Delete/Killing Text
Every text killed by following keystrokes is stored in a `kill-ring`. We will see how to retrieve those in next section.

### Word Killing
1. *`Meta + d`* - Kill from the cursor to the end of the current word or if between words, to the end of the next word.
2. *`Meta + DEL`* - Kill from the cursor to the start of the current word, or, if between words, to the start of the previous word.

### Extremes Killing
1. *`Ctrl + k`* - Kill from cursor to the end of the line.
2. *`Ctrl + u`* - Kill from cursor to the start of the line.

## Yanking / Pasting
1. *`Ctrl + y`* - Yank the most recently killed text back at the cursor.
2. *`Meta + y`* - Rotate the kill-ring stack, and yank the new top. It works only if the prior command is *`Ctrl + y`* or *`Meta + y`*.

## Searching
You can search your command history using readline methods. Readline provides `incremental` and `Non - incremental` search.
### Incremental searching
1. *`Ctrl + r`* (Reverse incremental search) :  
This keystroke evokes reverse incremental search and searches as you type. You can iterate through matched results through same keystroke again. To accept, use *`Ctrl + j`* or *`Esc`* and to directly execute press *`Enter/Return`*. To abort and restore the prompt, use *`Ctrl + g`*.
2. *`Ctrl + s`* (Forward incremental search) :  
If you have gone far behind in reverse incremental search (`Ctrl + r`), you can iterate forward by *`Ctrl + s`*.  
Note : If *`Ctrl + s`* doesn't work for you, it is possibly mapped to `xon/xoff`. To remove this mapping, use following command in terminal.
```sh
$ stty -ixon
```
To make this permanent, store this line in `~/.bashrc`(linux) or `~/.profile`(mac).

### Non - incremental searching
* *`Meta + p`* : There is not much of a use of this, IMHO. If you know what are you looking for, then typing this keystroke presents a colon on the prompt. Type your search string after the colon and press enter. There it is.

## Completions
Commands can be completed by readline. The actual completion is application specific.

### TAB completion
Type *`TAB`* key where you want the command to be completed by readline. Readline will only complete untill there is no conflict.
* Let's say, I have `file1` and `file2` in current directory. Now if I write following command in terminal.
```sh
$ ls fil
```
and press *`TAB`*, then command will be completed by readline as
```sh
$ ls file
```

### List possible completions (*`Meta + ?`*) or (*`TAB + TAB`*)
To list all completions, press any of these two. Like in previous example, it will show :
``` sh
$ ls file
file1 file2
$ ls file
```

### Insert completions (*`Meta + *`*)
With this, you can insert all completions in command line. Like in previous example :
```sh
$ rm file
```
This will be completed by :
```sh
$ rm file1 file2
```

## Readline arguments
### Numeric arguments to facilitate repetitions
* *`Meta + N`* : You can provide these arguments before readline keystrokes and those keystrokes will repeated N times. So, if you want to move 16 words forward, then *`Meta + 1 + 6 + Meta + f`* should work for you.

### Negative arguments
* *`Meta + -`* : To change direction of readline command, prepend this. So, if you want to move 16 words forward, then you can also use *`Meta + - + 1 + 6 + Meta + b`*. I didn't find any proper use cases for this, because every navigation keystoke in readline has a keystroke in opposite direction. So if you have some use cases then please comment.


## Undoing
* *`Ctrl + -`* : Incremental undo, separately remembered for each line.
* *`Meta + r`* : Undo all changes made to this line. This is like executing the undo command enough times to get back to
the beginning.
