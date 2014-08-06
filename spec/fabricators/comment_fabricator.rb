Fabricator(:comment) do
  body        "I love comments"
  user_id      { Fabricate(:user).id }
end
