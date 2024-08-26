Role Name
=========

Install Zsh completions for the tools don't have Oh My Zsh plugin.

Requirements
------------

- [brew](https://brew.sh)
- fd
- rg
- task

Role Variables
--------------

- `completions_path`: A path to install completions to. Should be included into
  `$FPATH`.

Dependencies
------------

Example Playbook
----------------

```yaml
    - hosts: localhost
      roles:
         - install-completions
```

License
-------

BSD
