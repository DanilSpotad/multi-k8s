docker build -t spotaddockers/multi-client:latest -t spotaddockers/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t spotaddockers/multi-server:latest -t spotaddockers/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t spotaddockers/multi-worker:latest -t spotaddockers/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push spotaddockers/multi-client:latest
docker push spotaddockers/multi-server:latest
docker push spotaddockers/multi-worker:latest

docker push spotaddockers/multi-client:$SHA
docker push spotaddockers/multi-server:$SHA
docker push spotaddockers/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=spotaddockers/multi-server:$SHA
kubectl set image deployments/client-deployment client=spotaddockers/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=spotaddockers/multi-worker:$SHA