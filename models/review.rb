def get_game(id)
    run_sql('SELECT * FROM games WHERE id = $1', [id])
end

def create_review(user_id, game_id, review_text)
    run_sql("INSERT INTO reviews(user_id, game_id, review) VALUES($1, $2, $3)", [user_id, game_id, review_text])
end

def get_reviews(id)
    run_sql("SELECT * FROM reviews WHERE game_id = $1", [id])
end