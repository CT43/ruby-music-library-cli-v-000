require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      self.all.find{|songs| songs.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

    def all
      @@all
    end

    def destroy_all
      @@all.clear
    end

    def save
      @@all << self
      self
    end

    def create(name)
      self.new(name).save
    end
  end
end

require_all 'lib'
