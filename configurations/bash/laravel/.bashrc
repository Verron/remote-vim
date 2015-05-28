#####################
# Laravel
#####################
alias art="php artisan"
alias tinker="clear; php artisan tinker"
alias fixperm="sudo chmod 775 ./ -R; sudo chmod 777 ./storage -R; sudo chown www-data:www-data . -R"
alias ltree="tree -a -I 'storage|public|.git|vendor'"

# Migrations
#####################
migration() {
    if [ $1 == "create" ]
    then
        php artisan make:migration --create="$2" create_${2}_table
    elif [ $1 == "edit" ]
    then
        php artisan make:migration --table="$2" edit_${2}_table_-_${3}
    fi
}

