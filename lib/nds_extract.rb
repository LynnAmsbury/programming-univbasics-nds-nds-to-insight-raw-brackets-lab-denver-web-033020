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
    # :name => total :worldwide_gross
  }
  directors_index = 0 # Counter for the indeces of the hashes containing directors information
  while directors_index < nds.length do # While loop: while the index for the directors is less than the number of items in the nds do...
    director_name = nds[directors_index][:name] # director_name = the value at the :name key of the director in the hash of the director
                                                # at the index of the nds director_index is currently at
    directors_totals[director_name] = 0 # Assign director_name as a key in directors_index and assign it to 0 for now
    # How long to loop
    movies_index = 0 # Counter for the index of the movies
    while movies_index < nds[directors_index][:movies].length do # While loop: while the index of the movies is less than the number of
                                                                # movies in the nds (accessed by nds[directors_index][:movies]) do...
    # Get to worldwide_gross
    directors_totals[director_name] += nds[directors_index][:movies][movies_index][:worldwide_gross] # Reassign director_name key in
                                    # directors_totals to the :worldwide_gross of the movie located at movies_index of :movies at
                                    # the director at director_name's location in the nds
    movies_index += 1 # Increment the movies_index counter
    end
    directors_index += 1 # Increment the directors_index counter
  end
# binding.pry
return directors_totals # Return all of the director's names with their totals
end
