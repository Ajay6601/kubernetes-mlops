multibranchPipelineJob('webapp-llm-job') {
    branchSources {
        github {
            id('kubernetes-mlops-webapp-llm')
            scanCredentialsId('git-credentials-id')
            repoOwner('Ajay6601')
            repository('webapp-llm')
            buildForkPRMerge(true)
            buildOriginBranch(false)
            buildOriginBranchWithPR(false)
        }
    }
}