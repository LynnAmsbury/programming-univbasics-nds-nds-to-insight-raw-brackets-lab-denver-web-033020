$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'
require 'pp'
require 'pry'

pp directors_database

def directors_totals(nds)
  # Array (d_d) -> Hashes (directors) -> Array (:movies) -> Hashes (:title, :studio, :worldwide_gross, :release_year)
  # Find a way to accumulate the :worldwide_grosses per director and return that integer as the value for the director :name key in the
  # new hash using director_database as input
  directors_totals = {
    # :name => total worldwide_gross
  }
  directors_index = 0 # Counter for the indeces of the hashes containing directors information
  while directors_index < nds.length do # While loop: while the index for the directors is less than the length of the nds do...
    director_name = nds[directors_index][:name] # director_name = the value at the :name key of the director in the hash of the director
                                                # at the index of the nds director_index is currently at
    directors_totals[director_name] = 0 # Counter
    # how long to loop
    movies_index = 0
    while movies_index < nds[directors_index][:movies].length do
    # get to worldwide_gross
    directors_totals[director_name] += nds[directors_index][:movies][movies_index][:worldwide_gross]
    movies_index += 1
    end

    directors_index += 1
  end
# binding.pry
return directors_totals
end
