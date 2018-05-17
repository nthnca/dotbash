# cron

This is a simple little tool to turn off your machine when you aren't using it.
I find it particularly useful for machines I normally only ssh into.

## Install

```shell
sudo cp stayawake /etc/cron.d/
```

## Usage

To keep your machine away just touch any file like /tmp/stayawake..., I have
set up my PS1 prompt to touch a file in that path every time I execute a
command in bash, then if I stop doing anything for 30 minutes or so, my
machine will turn off.
