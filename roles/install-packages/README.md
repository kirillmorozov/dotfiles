Role Name
=========

Install all must have packages to Linux Mint, Fedora Linux or macOS.

Requirements
------------

- [brew](https://brew.sh)

Role Variables
--------------

- `brew_packages`: A list of packages to be installed via Homebrew on macOS.
- `deb_packages`: A list of packages to be install on Linux Mint.
- `local_bin_dir`: A directory executables will be installed to.
- `rpm_packages`: A list of packages to be installed on Fedora Linux.

Dependencies
------------

Example Playbook
----------------

```yaml
    - hosts: localhost
      roles:
         - install-packages
```

License
-------

BSD
