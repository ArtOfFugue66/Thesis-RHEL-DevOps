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
