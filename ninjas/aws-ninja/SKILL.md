---
name: aws-ninja
description: >-
  Master orchestrator for 230+ AWS agent skills from official AWS repositories.
  Use when working with ANY AWS service, architecture, operations, security,
  cost optimization, migration, or development task. Routes to the optimal
  specialized skill based on context. Triggers: AWS, Amazon, EKS, ECS, Lambda,
  S3, DynamoDB, RDS, Aurora, Bedrock, CDK, CloudFormation, VPC, IAM, security,
  cost, migration, serverless, containers, databases, networking, observability,
  Well-Architected, DevOps, CI/CD, or any AWS service name.
---

# AWS Ninja

**Jump Skill** — Master orchestrator that routes AWS tasks to 230+ specialized skills from official AWS repositories.

## Purpose

This skill acts as an intelligent router to the comprehensive AWS skills library. Instead of manually searching for the right skill, describe your AWS task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level AWS knowledge

## Skill Catalog

### Compute

| Skill | Path | Use When |
|-------|------|----------|
| `aws-compute` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-core/skills/aws-compute/` | EC2, Auto Scaling, Graviton, IMDSv2 |
| `aws-containers` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-core/skills/aws-containers/` | ECS, Fargate, ECR, task definitions |
| `aws-serverless` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-core/skills/aws-serverless/` | Lambda, API Gateway, Step Functions |
| `aws-lambda-microvms` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/serverless-skills/aws-lambda-microvms/` | Firecracker MicroVMs, tenant isolation |
| `aws-step-functions` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/serverless-skills/aws-step-functions/` | State machines, ASL, JSONata |

### Databases

| Skill | Path | Use When |
|-------|------|----------|
| `aws-database` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-core/skills/aws-database/` | Database selection and comparison |
| `amazon-dynamodb` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/database-skills/amazon-dynamodb/` | DynamoDB design, GSIs, single-table |
| `amazon-aurora-mysql` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/database-skills/amazon-aurora-mysql/` | Aurora MySQL setup, optimization |
| `amazon-aurora-postgresql` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/database-skills/amazon-aurora-postgresql/` | Aurora PostgreSQL setup |
| `amazon-rds` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/database-skills/amazon-rds/` | RDS MySQL, PostgreSQL, SQL Server |
| `amazon-documentdb` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/database-skills/amazon-documentdb/` | DocumentDB/MongoDB |
| `amazon-elasticache` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/database-skills/amazon-elasticache/` | Redis, Valkey, Memcached |
| `amazon-neptune` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/database-skills/amazon-neptune/` | Graph database, Gremlin |
| `amazon-timestream` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/database-skills/amazon-timestream/` | Time-series database |

### Networking

| Skill | Path | Use When |
|-------|------|----------|
| `aws-networking` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/core-skills/aws-networking/` | VPC, Route 53, CloudFront, ALB/NLB |
| `creating-production-vpc-multi-az` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/networking-and-content-delivery-skills/creating-production-vpc-multi-az/` | Production VPC setup |
| `cloudfront` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/networking-and-content-delivery-skills/cloudfront/` | CDN, edge, caching |
| `route53` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/networking-and-content-delivery-skills/route53/` | DNS, health checks |
| `elastic-load-balancing` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/networking-and-content-delivery-skills/elastic-load-balancing/` | ALB, NLB, GWLB |
| `waf` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/specialized-skills/networking-and-content-delivery-skills/waf/` | AWS WAF, bot control |

### Security & Identity

| Skill | Path | Use When |
|-------|------|----------|
| `aws-iam` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-core/skills/aws-iam/` | IAM policies, roles, permissions |
| `aws-security` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/skills/core-skills/aws-security/` | Security Hub, GuardDuty, Inspector |
| `scanning-with-aws-security-agent` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-agents-for-devsecops/skills/scanning-with-aws-security-agent/` | Full security scan |
| `threat-modeling-with-aws-security-agent` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-agents-for-devsecops/skills/threat-modeling-with-aws-security-agent/` | STRIDE threat modeling |
| `pentesting-with-aws-security-agent` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-agents-for-devsecops/skills/pentesting-with-aws-security-agent/` | Penetration testing |

### IaC & Deployment

| Skill | Path | Use When |
|-------|------|----------|
| `aws-cdk` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-core/skills/aws-cdk/` | CDK TypeScript/Python |
| `aws-cloudformation` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-core/skills/aws-cloudformation/` | CloudFormation templates |
| `aws-cdk-development` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-agent-skills-for-builders/skills/aws-cdk-development/` | CDK expert patterns |
| `terraform-skill` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/terraform-skill/` | Terraform modules, HCL |

### AI & Machine Learning

| Skill | Path | Use When |
|-------|------|----------|
| `amazon-bedrock` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-core/skills/amazon-bedrock/` | Bedrock, GenAI, RAG, Agents |
| `aws-ai-ml` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-core/skills/aws-ai-ml/` | SageMaker, ML workflows |
| `aws-agentic-ai` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-agent-skills-for-builders/skills/aws-agentic-ai/` | Bedrock AgentCore deployment |

### Observability & Cost

| Skill | Path | Use When |
|-------|------|----------|
| `aws-observability` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-core/skills/aws-observability/` | CloudWatch, X-Ray, logs |
| `aws-billing-and-cost-management` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-core/skills/aws-billing-and-cost-management/` | Cost analysis, budgets |
| `cost-estimator` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-agent-skills-for-builders/skills/cost-estimator/` | CDK infrastructure cost estimation |

### EKS & Kubernetes (sample-apex-skills)

| Skill | Path | Use When |
|-------|------|----------|
| `eks-design` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/eks-design/` | EKS architecture design, ADRs |
| `eks-build` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/eks-build/` | EKS Terraform/Helm implementation |
| `eks-security` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/eks-security/` | EKS hardening, CIS benchmarks |
| `eks-upgrade-check` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/eks-upgrade-check/` | EKS upgrade readiness |
| `eks-cost-intelligence` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/eks-cost-intelligence/` | EKS cost optimization |
| `eks-genai` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/eks-genai/` | GPU/Neuron workloads on EKS |
| `eks-platform-engineering` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/eks-platform-engineering/` | IDP, Backstage, golden paths |

### ECS (sample-apex-skills)

| Skill | Path | Use When |
|-------|------|----------|
| `ecs-architect` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/ecs-architect/` | ECS architecture design |
| `ecs-build` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/ecs-build/` | ECS implementation |
| `ecs-security` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/ecs-security/` | ECS security |
| `ecs-devops` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-apex-skills/skills/ecs-devops/` | ECS CI/CD, deployments |

### Well-Architected Framework

| Skill | Path | Use When |
|-------|------|----------|
| `aws-well-architected-framework-review` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-well-architected-skills-and-steering/skills/aws-well-architected-framework-review/` | Full WA review, 6 pillars |
| `wa-builder` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-well-architected-skills-and-steering/skills/wa-builder/` | Learn WA, create diagrams |
| `wa-guardrails` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-well-architected-skills-and-steering/skills/wa-guardrails/` | Config rules, SCPs |
| `migration-readiness` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-well-architected-skills-and-steering/skills/migration-readiness/` | 7 Rs assessment |

### DevOps & Operations (tools-for-devops-agent)

| Skill | Path | Use When |
|-------|------|----------|
| `aws-health-events` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/tools-for-devops-agent/skills/aws-health-events/` | AWS Health events |
| `rds-operation-review` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/tools-for-devops-agent/skills/rds-operation-review/` | RDS/Aurora operational review |
| `service-quota-check` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/tools-for-devops-agent/skills/service-quota-check/` | Quota limits, capacity planning |
| `investigating-incidents-with-aws-devops-agent` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/agent-toolkit-for-aws/plugins/aws-agents-for-devsecops/skills/investigating-incidents-with-aws-devops-agent/` | Incident investigation |

### Multi-Account Operations

| Skill | Path | Use When |
|-------|------|----------|
| `corgiro` | `{{JUMP_SKILLS_DIR}}/repos/aws-ninja/sample-corgiro-aws-ops-skills/skills/corgiro/` | AWS Organization sweep, multi-account reports |

## Routing Logic

When a task arrives:

1. **EKS/Kubernetes?** → `sample-apex-skills/skills/eks-*`
2. **ECS/Fargate?** → `sample-apex-skills/skills/ecs-*`
3. **Well-Architected review?** → `sample-well-architected-skills-and-steering/skills/*`
4. **Specific database?** → `agent-toolkit-for-aws/skills/specialized-skills/database-skills/<db-name>`
5. **Security scanning?** → `agent-toolkit-for-aws/plugins/aws-agents-for-devsecops/skills/*`
6. **Incident/operations?** → `tools-for-devops-agent/skills/*`
7. **CDK/IaC?** → `agent-toolkit-for-aws/.../aws-cdk` or `sample-agent-skills-for-builders/skills/aws-cdk-development`
8. **Core AWS service?** → `agent-toolkit-for-aws/plugins/aws-core/skills/*`
9. **Serverless?** → `agent-toolkit-for-aws/skills/specialized-skills/serverless-skills/*`
10. **Networking?** → `agent-toolkit-for-aws/skills/specialized-skills/networking-and-content-delivery-skills/*`

## Execution Pattern

```
1. Announce: "Routing to [skill-name]..."
2. Load: Read the SKILL.md from the path in the catalog
3. Execute: Follow the skill's instructions
4. Cite: Reference the skill in the response
```

## Quick Reference

| Task | Route To |
|------|----------|
| Design EKS cluster | `eks-design` |
| EKS security hardening | `eks-security` |
| Lambda debugging | `aws-serverless` |
| DynamoDB design | `amazon-dynamodb` |
| Security scan | `scanning-with-aws-security-agent` |
| Well-Architected review | `aws-well-architected-framework-review` |
| CDK patterns | `aws-cdk-development` |
| Cost optimization | `aws-billing-and-cost-management` |
| Incident investigation | `investigating-incidents-with-aws-devops-agent` |

## Statistics

- **Total Skills:** 230+
- **Repositories:** 10
- **Sources:** Official AWS (aws/), AWS Samples (aws-samples/)

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
