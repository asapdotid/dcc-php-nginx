##@ [Laravel: Setup]

.PHONY: set-setup
set-setup: ## Setup Larvel application
	"$(MAKE)" set-init
	"$(MAKE)" composer ARGS="install"
	"$(MAKE)" artisan-key

## Usage:
## set-init
##
## setup-init ENVS="KEY_1=value1 KEY_2=value2"
.PHONY: set-init
set-init: ENVS= ## Initializes the .env file with ENV variables for laravel
set-init:
	@$(EXECUTE_IN_APPLICATION_CONTAINER) cp .env.example .env
	@for variable in $(ENVS); do \
	    $(EXECUTE_IN_APPLICATION_CONTAINER) echo $$variable | tee -a .env; \
	    done
	@echo "${YELLOW}Please update your${RESET} ${GREEN}.env${RESET} ${YELLOW}file before running Laravel application${RESET}"

##@ [Laravel: Artisan]

.PHONY: artisan
artisan: ## Run Artisan commands. Specify the command e.g. via ARGS="migrate --see
	@echo "${LIGHTPURPLE}❭❭${RESET} ${GREEN}PHP ARTISAN${RESET} ${YELLOW}[${RESET}${WHITE}▶${RESET} ${RED}$(ARGS)${RESET}${YELLOW}]${RESET}${LIGHTPURPLE}∶${RESET}"
	@$(EXECUTE_IN_APPLICATION_CONTAINER) php artisan $(ARGS)

.PHONY: artisan-key
artisan-key: ## Regenerating the Application K
	@echo "${LIGHTPURPLE}❭❭${RESET} ${GREEN}PHP ARTISAN${RESET} ${YELLOW}[${RESET}${WHITE}▶${RESET} ${RED}key:generate${RESET}${YELLOW}]${RESET}${LIGHTPURPLE}∶${RESET}"
	@$(EXECUTE_IN_APPLICATION_CONTAINER) php artisan key:generate

.PHONY: artisan-migrate
artisan-migrate: ## Artisan migrate database with arguments ARGS="--see
	@echo "${LIGHTPURPLE}❭❭${RESET} ${GREEN}PHP ARTISAN${RESET} ${YELLOW}[${RESET}${WHITE}▶${RESET} ${RED}migrate${RESET} ${YELLOW}$(ARGS)]${RESET}${LIGHTPURPLE}∶${RESET}"
	@$(EXECUTE_IN_APPLICATION_CONTAINER) php artisan migrate $(ARGS)

.PHONY: artisan-seed
artisan-seed: ## Artisan Seeder with arguments ARGS="--class=User
	@echo "${LIGHTPURPLE}❭❭${RESET} ${GREEN}PHP ARTISAN${RESET} ${YELLOW}[${RESET}${WHITE}▶${RESET} ${RED}db:seed${RESET} ${YELLOW}$(ARGS)]${RESET}${LIGHTPURPLE}∶${RESET}"
	@$(EXECUTE_IN_APPLICATION_CONTAINER) php artisan db:seed $(ARGS)
