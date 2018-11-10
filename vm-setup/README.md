# Configuring a VM for serving Locus-PQTL

This directory contains an Ansible playbook used to configure a VM for serving Locus-PQTL.

## Usage

Ansible requires Python 2 on the remote VM. Run the playbook as follows:

```bash
# ansible-playbook -i hosts.yml -e 'user=USER_NAME domain=DOMAIN_NAME' vm-setup.yml
```

where `USER_NAME` is the name of the user on the VM, and `DOMAIN_NAME` is the domain associated with the VM (e.g., locus-pqtl.epfl.ch).
The file `hosts.yml` is the inventory file listing the hostnames of all the machines to be configured. The names should be provided
in a `[locus-pqtl]` section.
