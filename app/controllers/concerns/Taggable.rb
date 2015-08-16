module Taggable
  extend ActiveSupport::Concern

  included do
    
  end

  def tag_names
    tags.map(&:name)
  end
end