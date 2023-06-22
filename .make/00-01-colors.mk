# To see all colors, run
# bash -c 'for c in {0..255}; do tput setaf $c; tput setaf $c | cat -v; echo =$c; done'
# The first 15 entries are the 8-bit colors

# Define standard colors
ifneq (,$(findstring 256color, ${TERM}))
	BLACK       := $(shell tput setaf 0)
	RED         := $(shell tput setaf 1)
	GREEN       := $(shell tput setaf 2)
	YELLOW      := $(shell tput setaf 3)
	LIGHTPURPLE := $(shell tput setaf 4)
	PURPLE      := $(shell tput setaf 5)
	BLUE        := $(shell tput setaf 6)
	WHITE       := $(shell tput setaf 7)
	RESET 		:= $(shell tput sgr0)
else
	BLACK       := ""
	RED         := ""
	GREEN       := ""
	YELLOW      := ""
	LIGHTPURPLE := ""
	PURPLE      := ""
	BLUE        := ""
	WHITE       := ""
	RESET       := ""
endif

# Set target color
TARGET_COLOR := $(BLUE)

colors: ## Show all the colors
	@echo "${BLACK}BLACK${RESET}"
	@echo "${RED}RED${RESET}"
	@echo "${GREEN}GREEN${RESET}"
	@echo "${YELLOW}YELLOW${RESET}"
	@echo "${LIGHTPURPLE}LIGHTPURPLE${RESET}"
	@echo "${PURPLE}PURPLE${RESET}"
	@echo "${BLUE}BLUE${RESET}"
	@echo "${WHITE}WHITE${RESET}"