# Repositórios por Ninja

Cada seção `[ninja-name]` contém os repositórios fonte das skills daquele ninja.

---

## [aws-ninja]

Repositórios oficiais AWS com skills para agentes IA.

```repos
https://github.com/aws/agent-toolkit-for-aws
https://github.com/aws/tools-for-devops-agent
https://github.com/aws-samples/sample-apex-skills
https://github.com/aws-samples/sample-agent-skills-for-builders
https://github.com/aws-samples/sample-well-architected-skills-and-steering
https://github.com/aws-samples/sample-corgiro-aws-ops-skills
https://github.com/aws-samples/sample-strands-agents-agentskills
https://github.com/aws-samples/sample-agentcore-websearch-agent-skill
https://github.com/aws-samples/sample-eks-to-agentcore-mcpserver-skills
https://github.com/aws-samples/sample-devops-agent-custom-mcp-skills
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| agent-toolkit-for-aws | aws | MCP servers, skills e plugins oficiais AWS |
| tools-for-devops-agent | aws | Skills operacionais do DevOps Agent |
| sample-apex-skills | aws-samples | Platform engineering (EKS/ECS) |
| sample-agent-skills-for-builders | aws-samples | CDK, security, testing workflows |
| sample-well-architected-skills-and-steering | aws-samples | Well-Architected Framework |
| sample-corgiro-aws-ops-skills | aws-samples | Multi-account cloud operations |
| sample-strands-agents-agentskills | aws-samples | Strands Agents SDK skills |
| sample-agentcore-websearch-agent-skill | aws-samples | AgentCore web search |
| sample-eks-to-agentcore-mcpserver-skills | aws-samples | EKS to AgentCore migration |
| sample-devops-agent-custom-mcp-skills | aws-samples | Custom DevOps Agent skills |

---

## [azure-ninja]

Skills Azure combinando o plugin oficial Microsoft + skills Azure da comunidade awesome-copilot.

```repos
https://github.com/microsoft/azure-skills
https://github.com/github/awesome-copilot
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| azure-skills | microsoft | Plugin oficial Azure: prepare, validate, deploy, diagnostics, cost, AI, RBAC, Foundry |
| awesome-copilot | github | Coleção comunitária - usamos apenas skills azure-* |

---

## [firecrawl-ninja]

Repositório oficial Firecrawl com skills para web scraping e research.

```repos
https://github.com/firecrawl/skills
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| skills | firecrawl | Skills core, build e workflows do Firecrawl CLI |

---

## Formato

Cada seção segue o formato:

```
## [ninja-name]

Descrição opcional.

\`\`\`repos
https://github.com/org/repo1
https://github.com/org/repo2
\`\`\`
```

O script `sync-repos.sh` parseia os blocos `repos` de cada seção.
