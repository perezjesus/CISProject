json.extract! author, :id, :average_rating, :text_reviews_count, :name, :ratings_count, :created_at, :updated_at
json.url author_url(author, format: :json)
