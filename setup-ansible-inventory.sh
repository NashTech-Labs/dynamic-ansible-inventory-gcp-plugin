#!/bin/sh
if grep -Fxq "projects:" ansible-inventory.gcp.yml && grep -Fxq "zones:" ansible-inventory.gcp.yml
then
    echo "Ansible inventory already setup"
else
    printf 'Setting up `project = ${GOOGLE_PROJECT}` in ansible inventory' | echo
    printf "\nprojects:" >> ansible-inventory.gcp.yml
    printf "\n- ${GOOGLE_PROJECT}" >> ansible-inventory.gcp.yml

    if "$GCP_FAILOVER" = true
    then
        printf 'Setting up `zones = ${GCP_ZONE_FAILOVER}` in ansible inventory' | echo
        printf "\nzones:" >> ansible-inventory.gcp.yml
        printf "\n- ${GCP_ZONE_FAILOVER}" >> ansible-inventory.gcp.yml
    else
        printf 'Setting up `zones = ${GCP_ZONE}` in ansible inventory' | echo
        printf "\nzones:" >> ansible-inventory.gcp.yml
        printf "\n- ${GCP_ZONE}" >> ansible-inventory.gcp.yml
    fi
fi
cat ansible-inventory.gcp.yml
ansible-inventory -i ansible-inventory.gcp.yml --graph
