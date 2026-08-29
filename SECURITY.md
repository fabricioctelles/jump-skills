# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| latest  | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability within this project, please take the following steps:

1. **Do not** disclose the vulnerability publicly until it has been addressed.

2. **Email** the details to the maintainer through [ft.ia.br](https://ft.ia.br) contact form.

3. **Include** the following information:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Any suggested fixes (if applicable)

## Response Timeline

- **Acknowledgment**: Within 48 hours
- **Initial Assessment**: Within 1 week
- **Resolution**: Depends on severity and complexity

## Security Considerations

### This Repository

Jump Skills is a **meta-repository** that:
- Clones external repositories to your local machine
- Installs skill files to AI agent directories
- Does not transmit data to external services
- Does not execute code from cloned repositories automatically

### Source Repositories

The skill files reference external repositories that are cloned locally. Each source repository has its own security policy:

- **AWS repositories**: Follow [AWS Security practices](https://aws.amazon.com/security/)
- **Microsoft repositories**: Follow [Microsoft Security Response Center](https://www.microsoft.com/en-us/msrc)
- **Community repositories**: Review individually before use

### Best Practices

1. **Review cloned content**: Always review skill files before using them with AI agents
2. **Keep updated**: Run `./sync-repos.sh` regularly to get security updates
3. **Limit permissions**: AI agents should have minimal required permissions
4. **Audit usage**: Monitor what skills your AI agents are loading and executing

## Scope

This security policy covers:
- The sync and install scripts (`sync-repos.sh`, `install-ninjas.sh`)
- The Ninja SKILL.md files in the `ninjas/` directory
- Repository configuration files (`repos.md`, `ninjas.md`)

It does **not** cover:
- Content of cloned source repositories (covered by their own policies)
- AI agent behavior or security
- Third-party tools or services
