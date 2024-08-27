### HELM WEBAPP CVE

1. Added CI for HELM WEBAPP
2. Consists all resources for creating GO application and have init containers for scanning the image

kubectl logs helm-webapp-cve-processor -c db-migration
kubectl logs helm-webapp-cve-processor -c webapp
kubectl get pods helm-webapp-cve-processor
kubectl describe pod helm-webapp-cve-processor
kubectl describe secret db-secret


