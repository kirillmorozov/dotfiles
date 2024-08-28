Role Name
=========

Downloads and installs specified Nerd Fonts for the current user.

Requirements
------------

Role Variables
--------------

- `dest_per_system`: A mapping between `ansible_system` value and a location to
  install fonts to.
- `fonts`: A list of Nerd Fonds to install. Names should match artefact names
  in a [GitHub release](https://github.com/ryanoasis/nerd-fonts/releases/latest).
- `version`: Nerd Font release to use.

Dependencies
------------

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - install-nerd-fonts

License
-------

BSD
