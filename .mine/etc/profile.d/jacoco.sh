export JACOCO_VERSION=0.8.2;

jacoco() { 
  __jacoco_generate_report $*
}
__jacoco_generate_report() { 
  mvn clean org.jacoco:jacoco-maven-plugin:${JACOCO_VERSION}:prepare-agent install org.jacoco:jacoco-maven-plugin:${JACOCO_VERSION}:report $*
}
