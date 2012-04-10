class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.same_director_movies(id)
#    puts "same director method in movies"
    if !id.nil?
      movie = self.find_by_id(id)
      if !movie.nil?
        direct = movie.director
        if !direct.nil? && !direct.empty?
#          sim_movies = self.find_all_by_director(direct)
#          if !sim_movies.nil?
              return self.find(:all, :conditions => ["director = ? AND title <> ? ", direct, movie.title ] ) #{ :director => direct, :title => !(movie.title)})
#          end
        end
      end
    end
#    puts "returning nil"
    return nil
  end
end
