# Ansible Role: SDDM

This role installs and configures SDDM (Simple Desktop Display Manager) on a target system.

## Requirements

None.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```yaml
sddm_package: sddm
sddm_service: sddm
sddm_conf: /etc/sddm.conf
