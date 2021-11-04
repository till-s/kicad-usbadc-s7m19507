HEREDIR:=$(dir $(lastword $(MAKEFILE_LIST)))

git:
	make -C $(HEREDIR)/hdl -f usbadc-support/hdl/makefile git
