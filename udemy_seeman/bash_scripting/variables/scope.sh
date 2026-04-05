#!/usr/bin/env bash

#This is a simple script to show difference between bash and environemnt variable

#To see the diffrence delcare two variables
#1) export ENV_OUTER="ENV_OUTER"
#2) bash_var="bash_var"

declare -x ENV_INNER="Inner script environment variable"

echo "ENV_OUTER value:=${ENV_OUTER}"
echo "BASH variable value:=${bash_var}"
if [[  -z "${bash_var}" ]]; then
    echo "bash_var is empty because child process inherit only environment variables";
fi   