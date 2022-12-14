def create_user(username, email)
    run_sql("INSERT INTO users(username, email) VALUES($1, $2)", [username, email])
end