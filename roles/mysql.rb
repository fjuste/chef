name "mysql"
description "mysql server role"
run_list "role[base]","recipe[mysql]"
