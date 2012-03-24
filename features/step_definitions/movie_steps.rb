# Add a declarative step here for populating the DB with movies.
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    #    puts movie
    Movie.create!(movie)
    # you should arrange to add that movie to the database here.
  end
  assert true, "Success"
end
