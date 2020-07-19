## oscap-ssh HTML reports
 - Visualize compliance score (%) for each RHEL8.2 VM
 - See the compliance status of each configuration item in the reference hardening standard (e.g., _pass_, _fail_, _error_)
 - Visualize remediation suggestions for each configuration item in the reference hardening standard
#### rhel-disa-stig-report.html
- Audit report for VM _RHEL8.2-DISA-STIG_ **before** hardening with Ansible
- Compliance score of **~56%**
#### rhel-disa-stig-report-post.html
- Audit report for VM _RHEL8.2-DISA-STIG_ **after** hardening with Ansible (Ansible playbook: **rhel8-playbook-stig.yml**)
- Compliance score of **~83.67%**
#### rhel-disa-stig-addon-report.html
- Audit report for VM _RHEL8.2-DISA-STIG-ADDON_ **before** hardening with Ansible
- Compliance score of **~97.92%**
#### rhel-disa-stig-addon-report-post.html
- Audit report for VM _RHEL8.2-DISA-STIG-ADDON_ **after** hardening with Ansible  (Ansible playbook: **rhel8-playbook-stig-addon.yml**)
- Compliance score of **100%**
