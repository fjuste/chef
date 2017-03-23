name "base"
description "receitas para todos os nodes"
run_list "recipe[chef-client::delete_validation]","recipe[chef-client::cron]","recipe[chef-client]","recipe[localusers]"
