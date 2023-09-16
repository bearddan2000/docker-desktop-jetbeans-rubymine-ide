# docker-desktop-jetbeans-rubymine-ide

## Description
This is a POC project to demonstrate jetbeans rubymine an ide for ruby developers, trial version only.

This is a barebones installation no pluggins where added.

In order to be able to get files out of the container one must add a *volume* to the docker run command.

ie.
without a volume
`docker run --rm` ...
with a volume
`docker run --rm -v $(pwd):/app` ...

Supports X11 display forwarding from docker container.

## Tech stack
- ruby
- rubymine

## Docker stack
- ubuntu

## To run
`sudo ./install.sh -u`

## To stop (optional)
`sudo ./install.sh -d`

## To see help
`sudo ./install.sh -h`