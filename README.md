# Dyad

An automation of the creation of a Linux sysroot closely aligned to the LFS documentation.

## System Requirements

Dyad is developed on a a vanilla Fedora 39 system.  In order to meet prerequisites to start the build, you will need to install the following packages:

```
dnf -y install make vim cmake g++ dialog
```

After you've installed these, just run `make` and a new sysroot will start compilation.
