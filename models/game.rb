def all_games
    games = run_sql('SELECT * FROM games ORDER BY id')
end

def create_game(name, image_url, game_description, genre, review_score)
    run_sql("INSERT INTO games(name, image_url, game_description, genre, review_score) VALUES($1, $2, $3, $4, $5)", [name, image_url, game_description, genre, review_score])
end

def get_game(id)
    run_sql('SELECT * FROM games WHERE id = $1', [id])[0]
end

def update_game(id, name, image_url, game_description, genre, review_score)
    run_sql('UPDATE games SET name = $2, image_url = $3, game_description = $4, genre = $5, review_score = $6 WHERE id = $1', [id, name, image_url, game_description, genre, review_score])
end

def delete_game(id)
    run_sql('DELETE FROM games WHERE id = $1', [id])
end