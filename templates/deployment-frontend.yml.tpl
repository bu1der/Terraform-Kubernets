apiVersion: apps/v1beta2
kind: Deployment
metadata:
  name: eschool-frontend-deployment
  labels:
    app: eschool-frontend
spec:
  replicas: 1
  selector:
    matchLabels:
      name: eschool-frontend
  template:
    metadata:
      labels:
        name: eschool-frontend
    spec:
      containers:
      - name: frontend-app
        image: gcr.io/${project}/eschool-frontend:0.0.1
        imagePullPolicy: Always
        livenessProbe:
          httpGet: 
            path: /
            port: 80  
          initialDelaySeconds: 90
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: / 
            port: 80
          initialDelaySeconds: 90
          periodSeconds: 10
      imagePullSecrets:
        - name: gcr-json-key