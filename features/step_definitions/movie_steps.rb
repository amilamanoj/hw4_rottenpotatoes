# Add a declarative step here for populating the DB with movies.
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    #    puts movie
    Movie.create!(movie)
    # you should arrange to add that movie to the database here.
  end
  assert true, "Success"
end

Then /the director of "(.*)" should be "(.*)"/ do |e1, e2|
  direc=Movie.find_by_title(e1).director
  assert_equal(direc, e2, "Did not match movie with director")  
end  
