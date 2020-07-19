## Ansible playbook files for hardening
 - Used to harden RHEL 8.2 VMs
 - `ansible-playbook --user [unprivileged-username] --become --ask-become-pass [playbook-filename]`
#### rhel8-playbook-stig.yml
- Obtained from the _scap-security-guide_ package (**/usr/share/scap-security-guide/**)
- Contains Ansible configuration tasks to implement **each** hardening item in _[DRAFT] DISA STIG for Red Hat Enterprise Linux 8_
#### rhel8-playbook-stig-addon.yml
- Created to take the RHEL8.2-DISA-STIG-ADDON VM from **~97.92%** compliance to **100%** (3 hardening items addressed)
- Uses Ansible modules _lineinfile_ and _command_
