json.array!(@votes) do |vote|
  json.extract! vote, :id, :user_id, :post_id, :vote
  json.url vote_url(vote, format: :json)
end
