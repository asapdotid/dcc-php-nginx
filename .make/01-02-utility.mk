##@ [Utility: Commands]

.PHONY: shell
shell: ## Running shell scriptcontainer with ARGS="ls -al"
	@echo ""
	@echo "${LIGHTPURPLE}❭❭${RESET} ${GREEN}EXECUTE COMMAND${RESET} ${YELLOW}[${RESET}${WHITE}▶${RESET} ${RED}$(ARGS)${RESET}${YELLOW}]${RESET}${LIGHTPURPLE}∶${RESET}"
	@$(EXECUTE_IN_APPLICATION_CONTAINER) $(ARGS)

.PHONY: composer
composer: ## Run Composer commands. Specify the command e.g. via ARGS="install"
	@echo ""
	@echo "${LIGHTPURPLE}❭❭${RESET} ${GREEN}EXECUTE COMMAND${RESET} ${YELLOW}[${RESET}${WHITE}▶${RESET} ${RED}composer $(ARGS)${RESET} in ${YELLOW}]${RESET}${LIGHTPURPLE}∶${RESET}"
	@$(EXECUTE_IN_APPLICATION_CONTAINER) composer $(ARGS);

.PHONY: restart-workers
restart-workers: ## Restart all workers
	@echo ""
	@echo "${LIGHTPURPLE}❭❭${RESET} ${GREEN}EXECUTE COMMAND${RESET} ${YELLOW}[${RESET}${WHITE}▶${RESET} ${RED}supervisorctl restart all${RESET}${YELLOW}]${RESET}${LIGHTPURPLE}∶${RESET}"
	@$(EXECUTE_IN_APPLICATION_CONTAINER) supervisorctl restart all

.PHONY: stop-workers
stop-workers: ## Stop all workers
	@echo ""
	@echo "${LIGHTPURPLE}❭❭${RESET} ${GREEN}EXECUTE COMMAND${RESET} ${YELLOW}[${RESET}${WHITE}▶${RESET} ${RED}supervisorctl stop worker${RESET}${YELLOW}]${RESET}${LIGHTPURPLE}∶${RESET}"
	@$(EXECUTE_IN_APPLICATION_CONTAINER) supervisorctl stop worker:*

.PHONY: start-workers
start-workers: ## Start all workers
	@echo ""
	@echo "${LIGHTPURPLE}❭❭${RESET} ${GREEN}EXECUTE COMMAND${RESET} ${YELLOW}[${RESET}${WHITE}▶${RESET} ${RED}supervisorctl start all${RESET}${YELLOW}]${RESET}${LIGHTPURPLE}∶${RESET}"
	@$(EXECUTE_IN_APPLICATION_CONTAINER) supervisorctl start worker:*
