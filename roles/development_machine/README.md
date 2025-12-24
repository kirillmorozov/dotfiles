Role Name
=========

Provision my development machine.

Requirements
------------

- [brew](https://brew.sh) on macOS.

Role Variables
--------------

- `development_machine_completions_path`: A path to install completions to. Should be included into
  `$FPATH`.
- `development_machine_local_bin_dir`: A directory executables will be installed to.

Dependencies
------------

Example Playbook
----------------

```yaml
    - hosts: localhost
      roles:
         - development-machine
```

License
-------

BSD
