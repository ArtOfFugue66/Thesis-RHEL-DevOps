# RHEL8.2-DISA-STIG-COMPLIANCE-WORKFLOW
Files necessary for automating the creation of RHEL8.2 VMs and hardening them according to the guidelines of the profile (at the time of writing) [DRAFT] DISA STIG for Red Hat Enterprise Linux 8.x
## Workflow
> TODO: workflow diagram
## Virtual lab environment
> TODO: environment architecture diagram 
## Packer
- Version 1.5.5
- _vsphere-iso_ builder; Requires a _vCenter Server Instance_ (VCSA7.0 VM)
- Build command:
<span>`PACKER_LOG=1 PACKER_LOG_PATH=build-log.txt ./packer build --var-file=build-variables.json rhel8.2-disa-stig-compliance.json`</span>
- Credentials used in the template are stored in _build-variables.json_
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
## Results
> TODO: compliance scores chart
