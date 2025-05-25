Role Name
=========

A brief description of the role goes here.

Requirements
------------

- [brew](https://brew.sh)

Role Variables
--------------

To configure packages installation:
- `brew_packages`: A list of packages to be installed via Homebrew on macOS.
- `deb_packages`: A list of packages to be install on Linux Mint.
- `local_bin_dir`: A directory executables will be installed to.
- `rpm_packages`: A list of packages to be installed on Fedora Linux.

To configure fonts installation:
- `dest_per_system`: A mapping between `ansible_system` value and a location to
  install fonts to.
- `fonts`: A list of Nerd Fonds to install. Names should match artefact names
  in a [GitHub release](https://github.com/ryanoasis/nerd-fonts/releases/latest).
- `version`: Nerd Font release to use.

to configure completions installation:
- `completions_path`: A path to install completions to. Should be included into
  `$FPATH`.

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
