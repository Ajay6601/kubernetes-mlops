![Architecture](diagram.png)

# kubernetes-mlops

CSYE 7125 SU24 Team 12 CVE platform, imported from
[cyse7125-su24-team12](https://github.com/cyse7125-su24-team12) with original
commit history (May–August 2024).

The Flask efficiency demo at the repo root is the earlier serving sketch.
The course system lives under `apps/`, `charts/`, and `infra/`.

```
CVE List V5 zip / GitHub _delta_ releases
        |
        v
cve-operator  -->  webapp-cve-processor (Job)  --Kafka-->  webapp-cve-consumer
                                                              |
                                                              v
                                                           Postgres
        |
        v
webapp-llm  (Pinecone + Ollama llama3.1:8b)
```

| Path | What it is |
|---|---|
| `apps/webapp-cve-processor` | Go Job: download CVE JSON, produce to Kafka |
| `apps/webapp-cve-consumer` | Go consumer: SHA-256 upsert into Postgres |
| `apps/webapp-llm` | Flask RAG + Streamlit, MiniLM / Pinecone / Ollama |
| `apps/cve-operator` | Kubebuilder operator (`GithubReleaseMonitor`, `GithubRelease`) |
| `apps/static-site` | Caddy static site |
| `charts/` | Helm charts for the apps, operator, and cluster autoscaler |
| `infra/infra-aws` | Terraform: VPC, EKS 1.29, Kafka, Postgres, Istio, Fluent Bit |
| `infra/infra-jenkins` | Terraform: Jenkins EC2 |
| `infra/ami-jenkins` | Packer AMI with Jenkins |
| `infra/k8s-yaml-manifests` | Raw ConfigMap / Secret / Pod / Service samples |
