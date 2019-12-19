# build image
docker build -t dev_hello_node_img .

# remove contaier
docker rm -f $(docker ps -a | grep "dev_hello_node" | awk "{print \$1}")

# run container
docker run -itd --name dev_hello_node -p 3001:3000 dev_hello_node_img

# clean dummy image
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
