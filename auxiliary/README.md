## auxiliary files
 - Used to simplify some management operations
 - Further comments in the content of each file
### lab.dns
- Found in **/etc/dnsmasq.d/**
- Config file to use _dnsmasq_ as local DNS server
#### hosts
- Contains addressing info for elements in the network (workstations, ESXi instances, VCSA instance, newly-created RHEL8.2 VMs)
- Contents are used as reference by _dnsmasq_
#### <span>add-vms.sh</span>
- Used by the _shell-local_ Packer provisioner at the end of each build task, after establishing SSH connection to the newly-created VMs
- Gets the hostname of each new VM and adds it to the DNS entries file and to the Ansible inventory file (e.g., **/etc/hosts** and **/etc/ansible/hosts**)
#### service.xml
- Definition file for the ESXi firewall rules
- The final rule definition pertains to the **http_port_min** and **http_port_max** fields in the Packer template, which effectively define a port range to allow requests to the Packer ephemeral HTTP servers 
- Without this the Anaconda instance is not able to access the Packer HTTP server and retrieve a kickstart file
