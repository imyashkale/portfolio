---
title: Bash Shortcuts Cheat Sheet
icon: material/newspaper-variant-outline
date: 2024-12-15 02:15:01
comments: true
categories:
  - Bash
  - SRE
tags:
  - Bash
  - SRE
---

!! info Ensure that your terminal emulator is properly configured to treat the OPTION key as a modifier key (Meta key).

    For macOS Terminal:
        Open Terminal preferences (Cmd + ,).
        Go to the Profiles tab and select your current profile.
        Under the Keyboard tab, check the option Use Option as Meta key.
        This setting ensures that the OPTION key is used as a modifier for key combinations like OPTION+B.
    For iTerm2:
        Open iTerm2 preferences (Cmd + ,).
        Go to Profiles -> Keys.
        Under Left Option Key (or Right Option Key), set it to Esc+ (this makes OPTION act like the Meta key).
        Make sure that Send escape sequences is not causing unexpected behavior.
---

## Command Editing Shortcuts

| Shortcut       | Description                                                                                 |
|----------------|---------------------------------------------------------------------------------------------|
| `CTRL+A`       | Go to the start of the command line                                                        |
| `CTRL+E`       | Go to the end of the command line                                                          |
| `CTRL+U`       | Delete from cursor to the start of the command line                                        |
| `CTRL+K`       | Delete from cursor to the end of the command line                                          |
| `CTRL+W`       | Delete from cursor to the start of the word                                                |
| `OPTION+D`     | Delete from cursor to the end of the word (whole word if at the boundary)                  |
| `CTRL+Y`       | Paste the last cut text after the cursor                                                   |
| `CTRL+XX`      | Move between the start of the command line and the current cursor position (toggle)        |
| `OPTION+B`     | Move backward one word (or go to the start of the current word)                            |
| `OPTION+F`     | Move forward one word                                                                      |
| `OPTION+C`     | Capitalize to the end of the current word                                                  |
| `OPTION+U`     | Make uppercase from the cursor to the end of the word                                      |
| `OPTION+L`     | Make lowercase from the cursor to the end of the word                                      |
| `OPTION+T`     | Swap the current word with the previous word                                               |
| `CTRL+F`       | Move forward one character                                                                |
| `CTRL+B`       | Move backward one character                                                               |
| `CTRL+D`       | Delete the character under the cursor                                                     |
| `CTRL+H`       | Delete the character before the cursor                                                    |
| `CTRL+T`       | Swap the character under the cursor with the previous one                                 |

## Command Recall Shortcuts

| Shortcut       | Description                                                                                 |
|----------------|---------------------------------------------------------------------------------------------|
| `CTRL+R`       | Search command history backward                                                            |
| `CTRL+J`       | End the history search at the current entry                                                |
| `CTRL+G`       | Escape from history searching mode                                                         |
| `CTRL+P`       | Go to the previous command in history                                                      |
| `CTRL+N`       | Go to the next command in history                                                          |
| `CTRL+_`       | Undo the last command                                                                      |
| `OPTION+.`     | Use the last word of the previous command                                                  |

## Command Control Shortcuts

| Shortcut       | Description                                                                                 |
|----------------|---------------------------------------------------------------------------------------------|
| `CTRL+L`       | Clear the screen                                                                           |
| `CTRL+S`       | Stop output to the screen (useful for long-running verbose commands)                       |
| `CTRL+Q`       | Resume output to the screen                                                                |
| `CTRL+C`       | Terminate the current command                                                              |
| `CTRL+Z`       | Suspend the current command                                                                |

## Bash Bang Shortcuts

| Shortcut       | Description                                                                                 |
|----------------|---------------------------------------------------------------------------------------------|
| `!!`           | Run the last command                                                                       |
| `!blah`        | Run the most recent command starting with "blah"                                           |
| `!blah:p`      | Print the command that `!blah` would run                                                   |
| `!$`           | The last word of the previous command                                                      |
| `!$:p`         | Print the last word of the previous command                                                |
| `!*`           | All arguments of the previous command except the first word                                |
| `!*:p`         | Print what `!*` would substitute                                                           |

---
