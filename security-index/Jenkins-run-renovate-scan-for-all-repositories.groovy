pipeline {
    options {
        disableConcurrentBuilds()
        disableResume()
        timeout(time: 30, unit: 'MINUTES')
        ansiColor('xterm')
    }
    triggers {
        cron('H 12 * * 2')
    }
    stages {
        stage('Running repositories scan') {
            steps {
                script {
                    def defaultReviewer = null

                    if (currentBuild.rawBuild.getCause(Cause.UserIdCause)?.getUserId()) {
                        defaultReviewer = currentBuild.rawBuild.getCause(Cause.UserIdCause).getUserId().split('@')[0].trim()
                    } else {
                        defaultReviewer = fetchCurrentSupportEngineerAccount().split('@')[0].trim()
                    }

                    def repositoriesToCheck = [
                            [repositoryName: 'PROJECT/repository1', reviewer: defaultReviewer],
                            [repositoryName: 'PROJECT/repository2', reviewer: null]
                    ]

                    for (repository in repositoriesToCheck) {
                        build(job: 'run-renovate-scan-for-repository',
                                propagate: true,
                                parameters: [
                                        string(name: 'projectAndRepository', value: repository.repositoryName),
                                        string(name: 'reviewer', value: repository.reviewer) // If null, codeowners rules will be applied
                                ])
                    }
                }
            }
        }
    }
    post {
        failure {
            script {
                // Send Slack message about scan failure
            }
        }
        always {
            script {
                def authorId = slackUserIdFromEmail(currentBuild.rawBuild.getCause(Cause.UserIdCause)?.getUserId())
                if (authorId) {
                    def message = currentBuild.result == 'SUCCESS' ? 'Your Renovate scan is completed' : 'Your Renovate scan had been failed'
                    slackSend(message: message, channel: authorId)
                }
            }
        }
    }
}
