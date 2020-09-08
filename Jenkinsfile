pipeline {
	agent any
	
	parameters {
		string(name: 'Cluster_Owner', description: 'Cluster Owner', trim: true)
		string(name: 'GSA_name', description: 'GCP service account', trim: true)
		string(name: 'KSA_name', description: 'kubernetes service account', trim: true)
		string(name: 'Namespace', description: 'kubernetes namespace', trim: true)
	}

	stages {
		stage('GKE credentials'){
			steps {
				script {
					echo "get GKE credentials"
					sleep 5
				}
			}
		}
		
		stage('get Google service account'){
			steps {
				script {
					echo "${GSA_name}"
					sleep 5
				}
			}
		}
		
		stage('get k8s service account'){
			steps {
				script {
					echo "${KSA_name}"
					sleep 5
				}
			}
		}
		
		stage('get k8s namespace'){
			steps {
				script {
					echo "${Namespace}"
					sleep 5	
				}
			}
		}	
	}
}
