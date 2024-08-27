multibranchPipelineJob('helm-webapp-llm-job') {
    branchSources {
        github {
            id('kubernetes-mlops-helm-webapp-llm')
            scanCredentialsId('git-credentials-id')
            repoOwner('Ajay6601')
            repository('helm-webapp-llm')
            buildForkPRMerge(true)
            buildOriginBranch(false)
            buildOriginBranchWithPR(false)
        }
    }
}