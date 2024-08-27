multibranchPipelineJob('k8s-yaml-manifests-job') {
    branchSources {
        github {
            id('kubernetes-mlops-k8s-yaml-manifests')
            scanCredentialsId('git-credentials-id')
            repoOwner('Ajay6601')
            repository('k8s-yaml-manifests')
            buildForkPRMerge(true)
            buildOriginBranch(false)
            buildOriginBranchWithPR(false)
        }
    }
}