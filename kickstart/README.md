## kickstart files
 - Used to automate the installation of _Red Hat Enterprise Linux 8.2_ VMs
 - Specify initial configuration of the newly-created VMs
 - Served to the _Anaconda installer_ instance through the use of _Packer_ ephemeral HTTP server (**http_port_min**, **http_port_max**, **http_directory** and **boot_command** fields in the Packer build template)
#### ssg-rhel8-stig-ks.cfg
- Obtained from the _scap-security-guide_ package (**/usr/share/scap-security-guide/kickstart/**)
- Commands the use of _OSCAP Anaconda Addon_ to implement compliance with the hardening standard in the OS installation process
[https://www.open-scap.org/tools/oscap-anaconda-addon/](https://www.open-scap.org/tools/oscap-anaconda-addon/)
#### generated-rhel8-stig-ks.cfg
- Generated with the _Red Hat Kickstart Generator_ app: [https://access.redhat.com/labs/kickstartconfig/](https://access.redhat.com/labs/kickstartconfig/)
- Does not specify the use of the _OSCAP Anaconda Addon_ 
