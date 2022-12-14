def create_user(username, email, password)

    password_digest = BCrypt::Password.create(password)

    run_sql("INSERT INTO users(username, email, password_digest) VALUES($1, $2, $3)", [username, email, password_digest])
end