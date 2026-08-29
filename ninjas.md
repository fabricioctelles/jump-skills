# Ninjas

Lista de Jump Skills disponíveis. Cada ninja é um roteador inteligente que orquestra múltiplas skills especializadas.

## Ninjas Ativos

```ninjas
aws-ninja
azure-ninja
firecrawl-ninja
```

## Descrições

| Ninja | Descrição | Skills |
|-------|-----------|--------|
| `aws-ninja` | Orquestra 230+ skills AWS oficiais (EKS, Lambda, DynamoDB, CDK, Security, etc.) | 230+ |
| `azure-ninja` | Orquestra 40 skills Azure (AKS, App Service, Entra, Foundry, DevOps, Cost, etc.) | 40 |
| `firecrawl-ninja` | Orquestra skills Firecrawl (scrape, search, crawl, workflows, etc.) | 33 |

## Como Adicionar um Novo Ninja

1. Adicione o nome do ninja no bloco `ninjas` acima
2. Adicione a seção correspondente em `repos.md` com os repositórios fonte
3. Execute `./sync-repos.sh` para clonar os repositórios
4. Execute `./install-ninjas.sh` para gerar e instalar a Jump Skill
