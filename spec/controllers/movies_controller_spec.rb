require 'spec_helper'

describe MoviesController do
  describe 'Looking for similar movies' do
    it 'should call the control method that performs similar movies search' do
      controller.should_receive(:same_director)
      post :same_director, {:id => '1'} #in routes.rb, routing is done naming that rule as ":same_director" therefore we can call post on :same_director
    end
    it 'should call the model method that performs similar movies search' do
      Movie.stub(:same_director_movies)
      Movie.should_receive(:same_director_movies).with('1')
      post :same_director, {:id => '1'}
    end
    it 'should select the same director template for rendering for happy path' do
      fake_results = [mock('Movie'), mock('Movie')]
      Movie.stub(:same_director_movies).and_return(fake_results)
      post :same_director, {:id => '1'}
      response.should render_template('same_director')
    end
    it 'should make the similar director search results available to that template' do
      fake_results = [mock('Movie'), mock('Movie')]
      Movie.stub(:same_director_movies).and_return(fake_results)
      post :same_director, {:id => '1'}
      # look for controller method to assign @movies
      assigns(:movies).should == fake_results
    end
    it 'should not select the same director template for rendering for sad path' do
      post :same_director, {:id => '1'}
      response.should_not render_template('same_director')
    end
  end
  
end
