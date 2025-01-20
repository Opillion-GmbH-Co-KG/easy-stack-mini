.PHONY: server

OUTPUT := $(or $(strip $(value OUTPUT)),@)

server:
	$(OUTPUT)bw config server http://bitwarden:$(ROCKET_PORT)

