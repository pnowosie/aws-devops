# Don't fear the Makefile

# IaC deployment process for the Memes-Generator website
# AWS components that will be provisioned:
up: .network .application

down: down-network down-application

clean:
	rm .network

.network:
	${MAKE} -f tasks/network.Makefile up
	touch .network

.application:
	${MAKE} -f tasks/application.Makefile up
	touch .application

down-network:
	${MAKE} -f tasks/network.Makefile down
	rm .network

down-application:
	${MAKE} -f tasks/application.Makefile down
	rm .application

