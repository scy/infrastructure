# scydev - start developing anywhere, fast

I have developed software on Windows, OS X and Linux machines. Tools like Vagrant and Docker have been created to be able to start developing software as fast as possible, in any environment. However, you still need to set up your _development machine_ first, because you need your tools like Git, cURL or Vim.

In order to minimize the amount of work needed to convert a given computer to a customized _development machine_, I have created this project. It is not designed to be helpful for everyone, but it certainly helps me.

## What's the idea?

The physical host you're working at should only have a minimal amount of tools installed. Installing all kinds of programming languages, tools and libraries will only clutter the host. Most of the things should run in a virtual machine that's easy to recreate when you've made too much of a mess.

Therefore, I suggest that the host is running only the following:

* Your IDE of choice, in my case [IntelliJ IDEA](https://www.jetbrains.com/idea/download/).
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
* [Vagrant](https://www.vagrantup.com/downloads.html).
* An SSH client to connect into the VM. [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html), for example, or the SSH Remote Run plugin in IDEA.

Currently, the system is using plain Debian Jessie. In the future, it's supposed to support Docker containers.

## Status

This is a work in progress.
It's not yet fleshed out completely, but starts to become usable.

## Initial Setup

* Download VirtualBox and Vagrant using the links above.
* Run `vagrant up`.
* Browse imgur for a minute or two.
* Be done.
