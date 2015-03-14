require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe 'index' do
    #let!(:email) { build(:email) }
    it 'renders successfully' do
      #email = build(:email)
      get :index
      response.should be_success
    end

  end
end
