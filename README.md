# Docker Compose PHP + Nginx

Custom image PHP-NGINX `asapdotid/php-nginx:<version>` as `compose image`.
Base image from `Webdevops` **PHP** and **PHP-NGINX**

-   Docker image: [asapdotid/php-nginx](https://hub.docker.com/repository/docker/asapdotid/php-nginx/general)
-   Combine with Traefik custom setup: [asapdotid/traefik](https://github.com/asapdotid/dcc-traefik)

## Docker Compose environment variables

```
APPLICATION_HTTP_PORT=80
APPLICATION_HTTPS_PORT=43
APPLICATION_PHP_POST_MAX_SIZE=50M
APPLICATION_PHP_UPLOAD_MAX_FILESIZE=50M
APPLICATION_SERVICE_NGINX_CLIENT_MAX_BODY_SIZE=50M
APPLICATION_PROJECT_APP_DIR=/home/application/laravel
APPLICATION_SUPERVISOR_APP_DIR=${PWD}/docker/config/supervisor
APPLICATION_WEB_APP_DOCUMENT_ROOT=/app
APPLICATION_WEB_APP_ALIAS_DOMAIN=app.jogjascript.com
```

## Make sure docker network exist:

```bash
docker network create proxy
docker network create secure
```

## Web environment variables

| Variable                             | Description                                                 | Default                            |
| ------------------------------------ | ----------------------------------------------------------- | ---------------------------------- |
| `CLI_SCRIPT`                         | Predefined CLI script for service                           | -                                  |
| `APPLICATION_UID`                    | PHP-FPM UID (Effective user ID)                             | `1000`                             |
| `APPLICATION_GID`                    | PHP-FPM GID (Effective group ID)                            | `1000`                             |
| `WEB_DOCUMENT_ROOT`                  | Document root for Nginx                                     | `/app`                             |
| `WEB_DOCUMENT_INDEX`                 | Document index (eg. `index.php`) for Nginx                  | `index.php`                        |
| `WEB_ALIAS_DOMAIN`                   | Alias domains (eg. `*.vm`) for Nginx                        | `*.vm`                             |
| `WEB_PHP_SOCKET`                     | PHP-FPM socket address                                      | 127.0.0.1:9000 (for php-\* images) |
| `SERVICE_NGINX_CLIENT_MAX_BODY_SIZE` | Nginx `client_max_body_size`                                | `50m` (when nginx is used)         |
| `TIMEZONE`                           | Set `OS` and `PHP` timezone                                 | `Asia/Jakarta`                     |
| `APP_ENV`                            | Set for `composer` install on `development` or `production` | `production`                       |
| `SKIP_COMPOSER`                      | Skip action `composer install` = `true` or `false`          | `false`                            |

## PHP.ini variables

You can specify eg. `php.memory_limit=256M` as dynamic env variable which will set `memory_limit = 256M` as php setting.

| Environment variable                  | Description                             | Default   |
| ------------------------------------- | --------------------------------------- | --------- |
| `php.{setting-key}`                   | Sets the `{setting-key}` as php setting | -         |
| `PHP_DATE_TIMEZONE`                   | `date.timezone`                         | `UTC`     |
| `PHP_DISPLAY_ERRORS`                  | `display_errors`                        | `0`       |
| `PHP_MEMORY_LIMIT`                    | `memory_limit`                          | `512M`    |
| `PHP_MAX_EXECUTION_TIME`              | `max_execution_time`                    | `300`     |
| `PHP_POST_MAX_SIZE`                   | `post_max_size`                         | `50M`     |
| `PHP_UPLOAD_MAX_FILESIZE`             | `upload_max_filesize`                   | `50M`     |
| `PHP_OPCACHE_MEMORY_CONSUMPTION`      | `opcache.memory_consumption`            | `256`     |
| `PHP_OPCACHE_MAX_ACCELERATED_FILES`   | `opcache.max_accelerated_files`         | `7963`    |
| `PHP_OPCACHE_VALIDATE_TIMESTAMPS`     | `opcache.validate_timestamps`           | `default` |
| `PHP_OPCACHE_REVALIDATE_FREQ`         | `opcache.revalidate_freq`               | `default` |
| `PHP_OPCACHE_INTERNED_STRINGS_BUFFER` | `opcache.interned_strings_buffer`       | `16`      |

## PHP FPM variables

You can specify eg. `fpm.pool.pm.max_requests=1000` as dyanmic env variable which will sets `pm.max_requests = 1000` as fpm pool setting.
The prefix `fpm.pool` is for pool settings and `fpm.global` for global master process settings.

| Environment variable            | Description                                                   |
| ------------------------------- | ------------------------------------------------------------- |
| `fpm.global.{setting-key}`      | Sets the `{setting-key}` as fpm global setting for the master |
| `fpm.pool.{setting-key}`        | Sets the `{setting-key}` as fpm pool setting                  |
| `FPM_PROCESS_MAX`               | `process.max`                                                 |
| `FPM_PM_MAX_CHILDREN`           | `pm.max_children`                                             |
| `FPM_PM_START_SERVERS`          | `pm.start_servers`                                            |
| `FPM_PM_MIN_SPARE_SERVERS`      | `pm.min_spare_servers`                                        |
| `FPM_PM_MAX_SPARE_SERVERS`      | `pm.max_spare_servers`                                        |
| `FPM_PROCESS_IDLE_TIMEOUT`      | `pm.process_idle_timeout`                                     |
| `FPM_MAX_REQUESTS`              | `pm.max_requests`                                             |
| `FPM_REQUEST_TERMINATE_TIMEOUT` | `request_terminate_timeout`                                   |
| `FPM_RLIMIT_FILES`              | `rlimit_files`                                                |
| `FPM_RLIMIT_CORE`               | `rlimit_core`                                                 |

## Composer

Due to the incompatibilities between composer v1 and v2 we introduce a simple mechanism to switch between composer versions.

| Environment variable | Description                         | Default |
| -------------------- | ----------------------------------- | ------- |
| `COMPOSER_VERSION`   | Specify the composer version to use | `2`     |

## Additional custom environment

| Environment variable | Description                                               | Default        |
| -------------------- | --------------------------------------------------------- | -------------- |
| `APPLICATION_ENV`    | Specify the application env `development` or `production` | `production`   |
| `SKIP_COMPOSER`      | Installation in application                               | `false`        |
| `TIMEZONE`           | Timezone                                                  | `Asia/Jakarta` |

## License

MIT / BSD

## Author Information

This Code was created in 2022 by [Asapdotid](https://github.com/asapdotid).
