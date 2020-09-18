#!/bin/bash
if [ $HOSTNAME == "controller" ]; then
    echo """
    Access Dashboard at: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
    """
    kubectl proxy --address='0.0.0.0'  --accept-hosts='^*$'
fi
