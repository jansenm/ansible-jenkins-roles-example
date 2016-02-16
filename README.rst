*********************************************
ANSIBLE JENKINS DEVOPS ROLES EXAMPLE PLAYBOOK
*********************************************

.. contents:: Table of Contents

Definitions
===========

The playbook uses the following definitions which are used for host groups.

Jenkins Master::
   A jenkins master is a machine prepared to run jenkins instances.

   - Apache Tomcat Distribution installed `CATALINA_BASE`.
   - Java SDK installed.

Jenkins Instance::
   A running jenkins instance. The playbook runs jenkins inside apache tomcat. The tomcat is setup following the
   `tomcat advanced configuration`_ document distributed with tomcat. One installation of the tomcat distribution
   can power multiple tomcat instances.

   The playbook allows to run multiple jenkins instances to run in one tomcat instance using different context paths.

.. _tomcat advanced configuration: https://tomcat.apache.org/tomcat-8.0-doc/RUNNING.txt

Jenkins Slave::
   A host prepared to run jenkins slaves. The master is a slave too in the definition of the playbook. Software
   needed by the jenkins instance to execute builds will be installed using this host group.

   - Maven
   - Gradle
   - <your requirement here>

Implementation
==============

A jenkins instance is defined as a ansible host in the inventory like this:

    [jenkins-instance]
    project-jenkins ansible_ssh_host=jenkins-devel

The `ansible_ssh_host` variable tells ansible on which host this `virtual host` is located. The real host needs to
have the `jenkins-master` host group assigned or the install will fail.

The jenkins master is defined like this:

    [jenkins-host]
    jenkins-devel

And a slave surprisingly like this:

    [jenkins-slave]
    jenkins-slave-host

.. note:: Slaves are not yet 100% implemented. I still try to get the jenkins master/instance setup 100% right.

Configuration
=============

The most important configurations can be found in :file:`host_vars/root-jenkins` and :file:`jenkins-instance.yml`.
The configuration is not yet separated as much from the plays/roles as i would like. The created user for jenkins is
at this time hardcoded at `jenkins`. But i am working on that.

Installing without root rights
==============================

The playbook as it is assumes you have the possible to become root and configure sudo in the usual ansible fashion.
If you don't have that possibility its still possible to adapt the playbook.

Remove everything that requires root rights and change both `{{install_prefix}}` variables from the
:file:`host_vars/root-jenkins` and :file:`host_vars/jenkins-devel` to existing directories you can write to. I plan
to add an example for this too in the future.
