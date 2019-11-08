# Changelog

## v4.2.1 (2019-11-08)

### Fix

- Fix condition in [tasks/main.yml](tasks/main.yml) task name: Remove VM "{{ vm_name }}" if exists
- Poweroff VM before deletion

## v4.2.0 (2019-11-08)

### Feature

- Add `Makefile` and targets to do `molecule lint` and `molecule syntax`

### Fix

- Fix condition in [tasks/main.yml](tasks/main.yml) task name: Remove VM "{{ vm_name }}" if exists

## v4.1.0 (2019-11-08)

### Feature

- Delete existing vm before creation new one (if `replace_existing_vm` is true)

## v4.0.2 (2019-11-06)

### Fix

- Fix [templates/user-data.j2](templates/user-data.j2) syntax
- Fix [tasks/main.yml](tasks/main.yml) name for task `wait_for_connection`

## v4.0.0 (2019-11-06)

### Features

- Allow run list of custom commands via `runcmd` variable
  Example:
  ```yaml
  runcmd:
    - echo "Provisioned at `date +'%Y-%m-%d %H:%M:%S'`" | tee /etc/provisioned
  ```

### Changes

- Set ipv4 address by `runcmd` command `ifconfig ens192 {{ static_ipv4 }}/{{ netmask }}`
  if variable `force_static_ipv4` is true
- Wait ssh connection for `poweron_timeout` seconds when `force_static_ipv4` is true

## v3.0.0 (2019-05-17)

### Features

- Disks may be added.  
  In order to add a disk, supply a `disk` parameter with two disk specifications.
  The first element pertains to the configuration of the existing disk.
  The second and subsequent ones configure additional disks.
  See [vmware_guest_disk](https://docs.ansible.com/ansible/latest/modules/vmware_guest_disk_module.html).
- Ubuntu 19.04 is a tested platform.

### Changes

- In order to enable creation of disks, a new module (which was added in Ansible 2.8.0) had to be used.
  This module requires additional parameters when used to configure an existing disk.
  If your playbooks increase disk size, they will have to be updated.
  See the [example playbook](README.md#example-playbook).

## v2.1.0 (2019-04-02)

### Features

- Disk size may be increased.
- Support for custom network mappings
  
  This allows to override the default network mappings of
  *ansible_deploy_ovf* with user-defined or empty mappings.

## v2.0.1 (2018-12-17)

### Features

- Parameter verification is only executed once.

### Changes

- Ansible 2.7.1 is required, a workaround for Ansible 2.7.0 was removed.

## v2.0.0 (2018-10-02)

### Features

- Customization of the ssh public keys was moved from the dedicated `public-keys` property to a [Cloud Config Data](https://cloudinit.readthedocs.io/en/latest/topics/format.html#cloud-config-data) section file specified in `user-data`.
This enables the following features: 
  - Multiple ssh public keys can be added. 
  - A password can be set for the user "ubuntu" without forcing it to be changed on first login (which would break the ansible connection).

- A workaround for https://github.com/ansible/ansible/issues/45223 was added.

### Changes

- The `cidr` variable was renamed to `network`.

## v1.0.0 (2018-09-27)

Support for creating virtual machines from Ubuntu Cloud Images with adjusted hardware.
