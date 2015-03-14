require 'rails_helper'

RSpec.describe EmailProcessor, type: :model do

  describe 'on inbound email' do
    it 'should be able to initialize an EmailProcessor' do
      email = FactoryGirl.build(:email)
      ep = EmailProcessor.new(email)
      ep.should_not be_nil
    end

    it 'prints things to screen when processing email' do
      pending('Need to better understand stream capture')
      email = FactoryGirl.build(:email)
      ep = EmailProcessor.new(email)
      ep.process.should output('Routing').to_stderr_from_any_process
    end

    it 'adds a row to the Post model after processing' do
      email = FactoryGirl.build(:email)
      posts = Post.count
      ep = EmailProcessor.new(email)
      ep.process
      Post.count.should be_equal posts+1
    end
  end

end
