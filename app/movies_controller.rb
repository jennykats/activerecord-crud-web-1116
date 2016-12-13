require 'pry'
# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

# change column (table_name, column name, type)


def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(attributes)
  # movie.title = "The Sting"
  # movie.release_date = 1973
  # movie.director "George Roy Hill"
  # movie.lead = "Paul Newman"

end

def can_be_created_in_a_block
  Movie.create do |m|
    m.title = "Home Alone"
    m.release_date = 1990
    m.director = "George Roy Hill"
    m.lead = "Paul Newman"
    m.in_theaters = false
  end
end

def can_get_the_first_item_in_the_database
  # movie.find_by(id == 1)
  Movie.first.title
end

def can_get_the_last_item_in_the_database
  Movie.last.title
end

def can_get_size_of_the_database
  Movie.ids.length
end

def can_find_the_first_item_from_the_database_using_id
  # binding.pry
  Movie.find_by(id: Movie.ids[0]).title
end

def can_find_by_multiple_attributes
  # title == "Title" AND release_date == 2000 AND director == "Me"
  Movie.where("title == 'Title' AND release_date == 2000 AND director == 'Me'")[0]
end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by
  # release date descending  sql = <<-SQL
   Movie.where("release_date > 2002").reorder('release_date').reverse_order
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick"
  Movie.create(title: "Awesome Flick")
  movie = Movie.find_by(title: "Awesome Flick")
  movie.title = "Even Awesomer Flick"
  movie.save
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  movie = Movie.find_by(title: "Wat?")
  movie.update(title: "Wat, huh?")
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
  movie =  Movie.create(title: "Movie_#{i}", release_date: 2000+i)
    movie.update(title: "A Movie")
  end
  # __
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  movie = Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once")
  movie.destroy
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  10.times do |i|
    movie = Movie.find_by(title: "Movie_#{i}")
    movie.destroy
  end
end
