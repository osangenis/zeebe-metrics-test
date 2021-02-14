FROM node:latest

RUN npm i -g zbctl
COPY deploy-workflows.sh .
COPY *.bpmn .

ENTRYPOINT ["/bin/bash", "deploy-workflows.sh" ]
