networking-midonet-ubuntu
=========================

This is the debian package project for Ubuntu.


How to Generate the Package
---------------------------


Run the following command to generate the package:

::

    $ ./package.sh

The package is generated in the same directory as the script.


How to Update the Package
-------------------------

Grab the appropriate pristine tarball from:

::

    http://tarballs.openstack.org/networking-midonet/


Run the following command to update the version in changelog:

::

    $ dch -i

