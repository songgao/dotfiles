ENTRIES=$(shell cat config.json | jq -r 'keys[]')
TARGETS=$(addprefix link_,$(ENTRIES))

.PHONY: all

all: $(TARGETS)

link_%: config.json gen_scripts confs
	bash gen_scripts $* > $@
	chmod a+x $@

clean:
	rm -f $(TARGETS)
