vagrant-android-develop
=======================

A Vagrant VM for Android development environment

## Manual

To install, download and install [Vagrant](https://www.vagrantup.com/) for your platform, then download and install [VirtualBox](https://www.virtualbox.org/).

Clone and switch into this repository, run command `vagrant up`. 

``` console
$ git clone https://github.com/nerds-odd-e/vagrant-android-develop.git
$ cd vagrant-android-develop
$ vagrant up
```

Once everything completes, run command `vagrant ssh` to login.

``` console
$ vagrant ssh
```

## What's inside?

 * Git
 * OpenJDK 7
 * Gradle 2.2.1
 * Maven 3.2.3
 * Ant 1.9.4
 * Android SDK with packages:
   - tools
   - platform-tools
   - build-tools-21.1.1
   - android-21
   - build-tools-19.1.0
   - android-19
   - extra-android-m2repository
   - extra-android-support
   - extra-google-m2repository

