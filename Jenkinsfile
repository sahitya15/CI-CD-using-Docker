pipeline{
    agent any
    triggers {
        pollSCM '* * * * *'
    }
    environment
    {
        VERSION="${BUILD_NUMBER}"
        PROJECT= 'practice'
        IMAGE= "$PROJECT:$VERSION"
        ECRURL='https://453993228295.dkr.ecr.us-east-1.amazonaws.com/practice'
        ECRCRED= 'ecr:us-east-1:aws-cred'
    }
    stages{
        stage('get scm'){
            steps{
            git 'https://github.com/sahitya15/CI-CD-using-Docker.git'
         }
    }
         stage('Mvn Package'){
             steps{
                 
         sh 'mvn clean package'
            
             }
    }

         stage('image build'){
             steps{
                 script{
                     docker.build('$IMAGE')
                 }
             }

    }
    stage('push image'){
        steps{
            script{
                docker.withRegistry(ECRURL,ECRCRED)
                {
                    docker.image(IMAGE).push()
                }
            }
        }
    }
}
post
{
    always{
        sh "docker rmi $IMAGE | true"
    }
}
}
