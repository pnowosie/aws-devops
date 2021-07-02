# Don't fear the Makefile

# IaC deployment process for the Memes-Generator website
# AWS components that will be provisioned:
up: .network

down: down-network

clean:
	rm .network

.network:
	${MAKE} -f tasks/network.Makefile
	touch .network

down-network:
	${MAKE} -f tasks/network.Makefile down

