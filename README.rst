Vagrant Debian Builder
======================

Very simple repos to build debian packages in a very clean environment:
a virtual instance (Debian Wheezy) is started and provisioned (with puppet) to provide pbuilder, git-buildpackage and such tools.

Packages to be built can be copied into this repository (I use a gitignored tmp/ folder) and built inside the Vagrant Box.

Most probably this repository will be used by me only.

TODO
----

* debsign without copying the private key inside Vagrant
