# RHEL8.2-DISA-STIG-COMPLIANCE-WORKFLOW
Files necessary for automating the creation of RHEL8.2 VMs and hardening them according to the guidelines of the profile named (at the time of writing) _[DRAFT] DISA STIG for Red Hat Enterprise Linux 8.x_
## Workflow
![Workflow diagram](/images/workflow-diagram.png)
## Virtual lab environment
![Env diagram](/images/environment-diagram.png)
- PC-1, PC-2, PC-3 - hardware platforms
- ESXi-1, ESXi-2, ESXi-3 - instance of the (normally) bare-metal ESXi hypervisor; Here, they are installed as VMs using VMware Workstation Pro 15
  - ESXi-1 - its sole purpose is to host the VCSA 7.0 VM
  - ESXi-2, ESXi-3 - these will host the VMs created with Packer
- RHEL8-MAIN - work environment for the system administrator; All processes necessary to reach the final result are run on this virtual machine
  - oscap-ssh - OpenSCAP compliance audit tool
  - Ansible - configuration management tool
  - dnsmasq - local DNS server instance using the dnsmasq tool
  - Packer - used to unattendedly create the two RHEL 8.2 VMs 
- VCSA 7.0 - instance of _vCenter Server Appliance_ version 7.0
- vSphere Web Client - web interface used to view and manage the components of the virtualized environment
- vSphere API - used by Packer to create the RHEL 8.2 VMs
## Packer
- Version 1.5.5
- _vsphere-iso_ builder; Requires a _vCenter Server Instance_ (VCSA 7.0 VM)
- Build command:  
<span>`PACKER_LOG=1 PACKER_LOG_PATH=build-log.txt ./packer build --var-file=build-variables.json rhel8.2-disa-stig-compliance.json`</span>
- Credentials used in the template are stored in _build-variables.json_
- Results visible in the vSphere Web Client interface:
![Web client interface hosts detail](/images/vcenter-hosts-interface-detail-VMs.png)
## Ansible
- _ansible-playbook_ version 2.9.6
- For _RHEL8.2-DISA-STIG_ VM  
`ansible-playbook --user admin --become --ask-become-pass rhel8-playbook-stig.yml`
- For _RHEL8.2-DISA-STIG-ADDON_ VM  
`ansible-playbook --user admin --become --ask-become-pass rhel8-playbook-stig-addon.yml`
## oscap-ssh
- Installation:  
    yum -y install openscap-scanner
- Requires _bash_, _SSH_, _scp_ and _mktemp_ (see [https://www.systutorials.com/docs/linux/man/8-oscap-ssh/](https://www.systutorials.com/docs/linux/man/8-oscap-ssh/))
- For _RHEL8.2-DISA-STIG_ VM (change report name on second audit)  
`oscap-ssh --sudo admin@rhel-disa-stig 22 xccdf eval --profile xccdf_org.ssgproject.content_profile_stig --report ./scap-reports/rhel-disa-stig-report.html /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml`
- For _RHEL8.2-DISA-STIG-ADDON_ VM (change report name on second audit)  
`oscap-ssh --sudo admin@rhel-disa-stig-addon 22 xccdf eval --profile xccdf_org.ssgproject.content_profile_stig --report ./scap-reports/rhel-disa-stig-addon-report.html /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml`
## Compliance results
![Results diagram](/images/compliance-scores-chart.png)
- Using a kickstart file which commands the use of OSCAP Anaconda Addon during the installation results in an initial compliance score of **~97.92%**
- After minimal hardening with Ansible playbook **rhel8-playbook-stig-addon.yml**, a score of **100%** can be achieved
