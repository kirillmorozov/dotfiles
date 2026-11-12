# Global instructions

- Use `jj` for all version control. Plain `git` commands are denied; use `jj git …` subcommands (`clone`, `fetch`, `init`, `push`) instead.
- Never mutate Terraform infrastructure or state (`apply`, `destroy`, `import`, `state rm|mv|push`, `workspace delete`, etc. are denied). Use `terraform plan`, `show`, `state list` and `validate` to review changes.
