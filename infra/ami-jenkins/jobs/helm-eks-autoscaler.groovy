multibranchPipelineJob('helm-eks-autoscaler') {
    branchSources {
        github {
            id('kubernetes-mlops-helm-eks-autoscaler')
            scanCredentialsId('git-credentials-id')
            repoOwner('Ajay6601')
            repository('helm-eks-autoscaler')
            buildForkPRMerge(true)
            buildOriginBranch(false)
            buildOriginBranchWithPR(false)
        }
    }
}
