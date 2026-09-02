---
name: google-cloud-ninja
description: >-
  Master orchestrator for 85+ Google Cloud Platform agent skills from official Google repositories.
  Use when working with ANY GCP service, architecture, infrastructure, databases, networking,
  observability, security, cost optimization, or development task. Routes to the optimal
  specialized skill based on context. Triggers: GCP, Google Cloud, GKE, Cloud Run, BigQuery,
  Spanner, AlloyDB, Cloud SQL, Bigtable, Cloud Storage, GCS, IAM, VPC, Cloud Monitoring,
  Cloud Logging, Cloud Build, gcloud, Terraform, Well-Architected Framework, Kubernetes,
  or any Google Cloud service name.
---

# Google Cloud Ninja

**Jump Skill** — Master orchestrator that routes Google Cloud tasks to 85+ specialized skills from official Google repositories.

## Purpose

This skill acts as an intelligent router to the comprehensive Google Cloud skills library. Instead of manually searching for the right skill, describe your GCP task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level GCP knowledge

## Skill Catalog

### Getting Started

| Skill | Path | Use When |
|-------|------|----------|
| `google-cloud-recipe-auth` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-recipe-auth/` | Authentication, ADC, service accounts, authorization |
| `google-cloud-recipe-onboarding` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-recipe-onboarding/` | First project setup, billing, initial deployment |
| `google-cloud-recipe-foundation-builder` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-recipe-foundation-builder/` | Landing zone, org policies, hierarchy, security guardrails |

### GKE (Google Kubernetes Engine)

| Skill | Path | Use When |
|-------|------|----------|
| `gke-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-basics/` | Cluster creation, Autopilot vs Standard, Workload Identity |
| `gke-cluster-creation` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-cluster-creation/` | Production cluster provisioning, templates |
| `gke-networking` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-networking/` | Private clusters, VPC-native, Dataplane V2, IP planning |
| `gke-service-networking` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-service-networking/` | Gateway API, Ingress, Cloud Armor, NEGs, PSC |
| `gke-storage` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-storage/` | PVCs, Filestore, GCS FUSE |
| `gke-workload-scaling` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-workload-scaling/` | HPA, VPA, autoscaling |
| `gke-cluster-autoscaler` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-cluster-autoscaler/` | Node autoscaling, NAP |
| `gke-compute-classes` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-compute-classes/` | Spot VMs, GPUs/TPUs, machine families |
| `gke-platform-security` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-platform-security/` | RBAC, Binary Authorization, Shielded Nodes |
| `gke-workload-security` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-workload-security/` | Workload Identity, Network Policies, Pod Security |
| `gke-reliability` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-reliability/` | PDBs, health probes, topology spread |
| `gke-upgrades` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-upgrades/` | Cluster upgrades, maintenance windows |
| `gke-backup-dr` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-backup-dr/` | Backup for GKE, disaster recovery |
| `gke-observability` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-observability/` | Logging, Monitoring, managed Prometheus |
| `gke-cost-analysis` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-cost-analysis/` | GKE cost queries, BigQuery exports |
| `gke-cost-optimization` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-cost-optimization/` | Rightsizing, Spot VMs, CUDs |
| `gke-multitenancy` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-multitenancy/` | Namespace isolation, quotas, team RBAC |
| `gke-app-onboarding` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-app-onboarding/` | Containerization, deployment manifests |
| `gke-manifest-generation` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-manifest-generation/` | Production-ready YAML generation |
| `gke-golden-path` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-golden-path/` | Configuration defaults, best practices |
| `gke-productionize` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-productionize/` | Production readiness reviews |
| `gke-workload-troubleshooting` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-workload-troubleshooting/` | CrashLoopBackOff, OOMKilled, ImagePullBackOff |
| `gke-batch-hpc` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-batch-hpc/` | Batch jobs, HPC workloads |
| `gke-inference` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-inference/` | AI/ML inference, GPUs, TPUs, model servers |

### GKE AI/ML Troubleshooting

| Skill | Path | Use When |
|-------|------|----------|
| `gke-ai-troubleshooting-handle-disruption-gpu-tpu` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-ai-troubleshooting-handle-disruption-gpu-tpu/` | GPU/TPU node disruptions, maintenance |
| `gke-ai-troubleshooting-jobset-interruption` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-ai-troubleshooting-jobset-interruption/` | JobSet restarts, preemptions |
| `gke-ai-troubleshooting-tpu-dynamic-slices-monitoring` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-ai-troubleshooting-tpu-dynamic-slices-monitoring/` | TPU slice lifecycle |
| `gke-ai-troubleshooting-tpu-metrics-monitoring` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-ai-troubleshooting-tpu-metrics-monitoring/` | TPU metrics, PromQL |
| `gke-ai-troubleshooting-tpu-vbar-oom` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-ai-troubleshooting-tpu-vbar-oom/` | TPU v6e OOM, vbar crashes |

### Databases & Analytics

| Skill | Path | Use When |
|-------|------|----------|
| `cloud-databases-onboarding` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/cloud-databases-onboarding/` | Database selection guide |
| `bigquery-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/bigquery-basics/` | BigQuery datasets, tables, SQL queries |
| `bigquery-ai-ml` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/bigquery-ai-ml/` | BigQuery ML, forecasting, anomaly detection |
| `bigquery-bigframes` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/bigquery-bigframes/` | BigQuery DataFrames, pandas-style |
| `alloydb-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/alloydb-basics/` | AlloyDB for PostgreSQL |
| `spanner-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/spanner-basics/` | Spanner provisioning, schema design |
| `cloud-sql-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/cloud-sql-basics/` | Cloud SQL MySQL, PostgreSQL, SQL Server |
| `bigtable-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/bigtable-basics/` | Bigtable schema, row keys, queries |
| `datalineage-summary` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/datalineage-summary/` | Data lineage graphs |
| `datalineage-bigquery-asset-impact-analysis` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/datalineage-bigquery-asset-impact-analysis/` | BigQuery blast radius analysis |

### Managed Airflow (Cloud Composer)

| Skill | Path | Use When |
|-------|------|----------|
| `managed-airflow-dag-authoring` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/managed-airflow-dag-authoring/` | DAG authoring best practices |
| `managed-airflow-dag-troubleshooting` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/managed-airflow-dag-troubleshooting/` | DAG failures troubleshooting |
| `managed-airflow-migrations` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/managed-airflow-migrations/` | Airflow 2/3 migrations |

### Storage

| Skill | Path | Use When |
|-------|------|----------|
| `google-cloud-storage-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-storage-basics/` | GCS buckets, objects, IAM, lifecycle |
| `google-cloud-storage-fuse` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-storage-fuse/` | gcsfuse mounts, caching, GKE CSI |
| `google-cloud-filestore-autoscale` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-filestore-autoscale/` | Filestore capacity autoscaling |

### Serverless & Compute

| Skill | Path | Use When |
|-------|------|----------|
| `cloud-run-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/cloud-run-basics/` | Cloud Run services, jobs, worker pools |
| `cloud-build-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/cloud-build-basics/` | Cloud Build triggers, workflows |

### Networking

| Skill | Path | Use When |
|-------|------|----------|
| `google-cloud-global-frontend-configuration` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-global-frontend-configuration/` | Global ALB, Cloud CDN, Cloud Armor |
| `google-cloud-networking-observability` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-networking-observability/` | VPC Flow Logs, NAT, Connectivity Tests |

### Observability & Logging

| Skill | Path | Use When |
|-------|------|----------|
| `cloud-logging-configuration-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/cloud-logging-configuration-basics/` | Log buckets, sinks, views, exclusions |
| `cloud-logging-cross-project-configuration` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/cloud-logging-cross-project-configuration/` | Cross-project centralized logging |
| `cloud-logging-query-generation` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/cloud-logging-query-generation/` | LQL queries from natural language |
| `cloud-monitoring-metric-selection` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/cloud-monitoring-metric-selection/` | Metric discovery, descriptors |
| `cloud-monitoring-promql-query` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/cloud-monitoring-promql-query/` | PromQL query generation |
| `cloud-monitoring-list-time-series-request` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/cloud-monitoring-list-time-series-request/` | ListTimeSeries requests |
| `cloud-monitoring-chart-generation` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/cloud-monitoring-chart-generation/` | Dashboard widget generation |
| `google-cloud-slo-alert-configuration` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-slo-alert-configuration/` | SLO alerting policies |
| `gke-alert-configuration` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gke-alert-configuration/` | GKE alerting with PromQL/Terraform |

### Security & Identity

| Skill | Path | Use When |
|-------|------|----------|
| `iam-helper-for-policy-simulator` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/iam-helper-for-policy-simulator/` | IAM policy simulation |
| `iam-helper-for-privileged-access-management` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/iam-helper-for-privileged-access-management/` | PAM entitlements, temporary access |
| `google-cloud-scc-query` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-scc-query/` | Security Command Center queries |
| `detection-engineering-coverage-evaluation` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/detection-engineering-coverage-evaluation/` | SecOps detection engineering |

### Well-Architected Framework

| Skill | Path | Use When |
|-------|------|----------|
| `google-cloud-waf-cost-optimization` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-waf-cost-optimization/` | Cost optimization pillar |
| `google-cloud-waf-operational-excellence` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-waf-operational-excellence/` | Operational excellence pillar |
| `google-cloud-waf-performance-optimization` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-waf-performance-optimization/` | Performance optimization pillar |
| `google-cloud-waf-reliability` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-waf-reliability/` | Reliability pillar |
| `google-cloud-waf-security` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-waf-security/` | Security pillar |
| `google-cloud-waf-sustainability` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/google-cloud-waf-sustainability/` | Sustainability pillar |

### Developer Tools

| Skill | Path | Use When |
|-------|------|----------|
| `gcloud` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/gcloud/` | gcloud CLI validation, guardrails |
| `workload-manager-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/workload-manager-basics/` | Workload Manager evaluations |
| `developer-device-platform-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/developer-device-platform-basics/` | Remote Android devices |

### Infrastructure Design

| Skill | Path | Use When |
|-------|------|----------|
| `application-design-center-design-deploy` | `{{JUMP_SKILLS_DIR}}/repos/google-cloud-ninja/skills/skills/cloud/application-design-center-design-deploy/` | ADC Terraform workflows |

## Routing Logic

When a task arrives:

1. **GKE/Kubernetes?** → `gke-*` skills
2. **BigQuery?** → `bigquery-*` skills
3. **Database selection?** → `cloud-databases-onboarding`
4. **Specific database?** → `alloydb-basics`, `spanner-basics`, `cloud-sql-basics`, `bigtable-basics`
5. **Cloud Storage?** → `google-cloud-storage-*`
6. **Cloud Run?** → `cloud-run-basics`
7. **Logging?** → `cloud-logging-*`
8. **Monitoring/metrics?** → `cloud-monitoring-*`
9. **Security/IAM?** → `iam-helper-*`, `google-cloud-scc-query`
10. **Well-Architected?** → `google-cloud-waf-*`
11. **Networking?** → `google-cloud-global-frontend-configuration`, `google-cloud-networking-observability`
12. **Getting started?** → `google-cloud-recipe-*`

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
| Create GKE cluster | `gke-cluster-creation` |
| GKE security hardening | `gke-platform-security`, `gke-workload-security` |
| BigQuery queries | `bigquery-basics` |
| Database selection | `cloud-databases-onboarding` |
| Cloud Storage setup | `google-cloud-storage-basics` |
| Cloud Run deploy | `cloud-run-basics` |
| Cost optimization review | `google-cloud-waf-cost-optimization` |
| gcloud commands | `gcloud` |
| GKE troubleshooting | `gke-workload-troubleshooting` |

## Statistics

- **Total Skills:** 85+
- **Repository:** google/skills (skills/cloud/)
- **Source:** Official Google Cloud

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
