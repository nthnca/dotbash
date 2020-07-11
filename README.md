# dotbash

DEPRECATED: See [config](https://github.com/nthnca/config)

This repository contains my basic environment setup. It contains a number of
different configuration tweaks that I have built up over the years. Hopefully
it is organized in a way that is easy to understand and easy to modify for your
own uses if you so wish.

## Install

```shell
mkdir -p github; cd github
git clone https://github.com/nthnca/dotbash.git
cp $PWD/dotbash/example.bashrc ~/.bashrc
ln ~/.bashrc ~/.bash_profile
ln $PWD/dotbash/tmux.conf ~/.tmux.conf
```

At this point open .bashrc and tweak any variables referred to there.

## Features

### Insanely useful prompt

Normally it will look something like (the prompts also have color):

```
[mybox] ~/dir$
```

But it can also show you if you are running bash inside bash (recursion depth),
it can show you if there are any background processes running, what the return
status of the last command was, the current git repository you are in, and what
branch the repo is on. So if you were running bash inside bash (so a depth of
2), you had 3 background processes running, the last command had returned an
error code of 4, your current git repo is dotbash, and you are on the master
branch it will look something like:

```
[mybox-d2-j3-ERR4] dotbash[master]/bash$
```

It is also relatively easy to add support for other types of repositories
in addition to the git support.


### Quick customization

- eal - open a window to edit your bash aliases.
- xal - reload your bash aliases


### Good defaults

Useful defaults for cd, df, rm, and ls commands.


### Multiple chrome profiles

If you want multiple chrome profiles (for example one for work and on for your
personal account) in your bashrc set:

```shell
CHROME_USERS="work personal"
```

This will give you a startworkchrome and a startpersonalchrome command to open
a chrome window for two different profiles.


### git repos

When you set the REPO_PATHS environment variable to the set of directories that
contain your git repositories, the following commands will work:

- rls: Lists all of your git repositories
- rst: Fetches and gets a basic status for each
- rpull: Does a pull for each
- rpush: Does a push for each


### And more

There are numerous other features such as scrambling your git commit
timestamps, localized git shortcuts, aliases for cd'ing to your repositories,
and more. I would encourage you to dig through the source code for more
details.
