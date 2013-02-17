ifneq (,)
This makefile requires GNU Make.
endif

project_name = Quaker Attack
project_url = github.com/aderosier/quaker-attack
project_output = quaker-attack

src_dir = src/
js_dir = js/

modules = \
	$(src_dir)header.coffee \
	$(src_dir)init.coffee

output = $(js_dir)$(project_output).js

.PHONY : main
main : $(output)

.PHONY : help
help :
	@echo GNUmakefile for $(project_name)
	@echo ------------------------------
	@echo $(project_url)
	@echo
	@echo \* Available build options:
	@echo \*---\> main
	@echo \* Remove generated javascript:
	@echo \*---\> clean
	@echo \* View this help:
	@echo \*---\> help
	@echo
	@echo Example: make

.PHONY : clean
clean :
	@echo Cleaning..
	rm -rf $(js_dir)

$(output) : $(modules)
	@echo Building..
	coffee -cj $(output) $(modules)
