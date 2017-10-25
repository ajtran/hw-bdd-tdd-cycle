# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/movies'
      
    when /^the RottenPotatoes home page$/
      '/movies'
      
    when /^the edit page for "([^"]+)"$/
      edit_movie_path(Movie.find_by_title($1).id)
      
    when /^the details page for "([^"]+)"$/
      movie_path(Movie.find_by_title($1).id)
      
    when /^the Similar Movies page for "(.*)"$/
      m = Movie.find_by_title($1)
      same_director_path(m)
  end
end

World(NavigationHelpers)
