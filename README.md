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

### How to connect my Android phone?

First, use command `VBoxManage list usbhost` to find the *VendorId* of your Android phone.

``` console
$ VBoxManage list usbhost
Host USB Devices:

UUID:               d957abf9-18bf-46c6-a182-0466509d36de
VendorId:           0x04e8 (04E8)
ProductId:          0x6868 (6868)
Revision:           4.0 (0400)
Port:               1
USB version/speed:  0/2
Manufacturer:       SAMSUNG
Product:            SAMSUNG_Android
SerialNumber:       4df782582f0e405b
Address:            p=0x6868;v=0x04e8;s=0x0000608fbd70f37e;l=0x14100000
Current State:      Busy
```

Now we got the VendorId '*0x04e8*'. Set a system environment variable '*ANDROID_VENDOR_ID*' to this value, and reload the VM. Maybe you need to plug in your device again.

``` console
$ ANDROID_VENDOR_ID=0x04e8 vagrant reload
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

