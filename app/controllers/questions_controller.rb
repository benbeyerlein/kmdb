class QuestionsController < ApplicationController
  def question_1
    # How many movies are in the database?

    # Your Ruby goes here.

    @number_of_movies = Movie.count
  end

  def question_2
    # In what year was the oldest movie on the list released?

    # Your Ruby goes here.
    @year_of_oldest_movie = Movie.order("year ASC").first.year
  end

  def question_3
    # How many movies does the director of the first movie have on the list?

    # Your Ruby goes here.
    fst_mov_dr = Movie.first.director_id

    num_mov_by_dr = Movie.where({:director_id => fst_mov_dr}).count

    @number_of_movies_directed_by_first_movie_director = num_mov_by_dr
  end

  def question_4
    # What is the most number of movies any single director has on the list?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.

    cnt_by_dir = Movie.group(:director_id).count

    max_cnt_by_dir = cnt_by_dir.values.max

    @most_number_of_movies_by_a_single_director = max_cnt_by_dir
  end

  def question_5
    # What is the most recent movie on the list that the first actor appeared in?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.

    # Create a hash of all the movies actor 1 has been in
    first_actor = Actor.first.id

    fist_actors_movies = Role.where({:actor_id => first_actor}).pluck(:movie_id)

    # Subset the movie table by the list from actor 1
    list_of_movies = Movie.find(fist_actors_movies)

    # Get the max year value
    sorted_list = list_of_movies.sort_by { |k| k["year"]}


    @most_recent_movie_for_first_actor = sorted_list.last.title
  end
end
