# About
- This tech hub will help you to create dynamic ansible inventory using gcp_compute plugin
- Get inventory hosts from Google Cloud Platform GCE.
- Uses a YAML configuration file that ends with gcp_compute.(yml|yaml) or gcp.(yml|yaml).

# Requirements
The below requirements are needed on the local controller node that executes this inventory. </br>
- requests >= 2.18.4
- google-auth >= 1.3.0

# Usage
- export or declare used variables. Get them from gcp console.
- run sh setup-ansible-inventory.sh

# References
- https://docs.ansible.com/ansible/latest/collections/google/cloud/gcp_compute_inventory.html
