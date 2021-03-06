include(platform.m4)

apiVersion: v1
kind: Service
metadata:
  name: ad-decision-service
  labels:
    app: ad-decision
spec:
  ports:
  - port: 8080
    protocol: TCP
  selector:
    app: ad-decision

---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: ad-decision
  labels:
     app: ad-decision
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ad-decision
  template:
    metadata:
      labels:
        app: ad-decision
    spec:
      enableServiceLinks: false
      containers:
        - name: ad-decision
          image: ssai_ad_decision_frontend:latest
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 8080
          env:
            - name: NO_PROXY
              value: "*"
            - name: no_proxy
              value: "*"
PLATFORM_NODE_SELECTOR(`Xeon')dnl
