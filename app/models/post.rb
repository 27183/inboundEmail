class Post < ActiveRecord::Base
  serialize :to
  serialize :from
  serialize :cc
  serialize :attachments
  serialize :headers
end
