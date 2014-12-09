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

### Build WordPress for Android

Switch into *wordpress-android* branch and update submodule.

``` console
$ git checkout wordpress-android
$ git submodule update --init
```

Log on the VM, and build *WordPress-Android*

``` console
$ vagrant ssh
$ cd ~/WordPress-Android
$ echo sdk.dir=$ANDROID_HOME > local.properties
$ cp WordPress/gradle.properties-example WordPress/gradle.properties
$ gradle assembleVanillaDebug
```

## What's inside?

 * Git
 * OpenJDK 7
 * Gradle 2.2.1
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

