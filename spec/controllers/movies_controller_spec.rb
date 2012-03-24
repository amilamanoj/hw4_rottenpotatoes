require 'spec_helper'

describe MoviesController do
  describe 'Looking for similar movies' do
   it 'should call the model method that performs similar movies search' do
      Movie.should_receive(:same_director).with('Amila')
      post :same_director, {:as => 'Amila'}
    end
    it 'should select the Search Results template for rendering' do
      Movie.stub(:find_in_tmdb)
      post :same_director, {:search_terms => 'Amila'}
      response.should render_template('same_director')
    end
  end
end
