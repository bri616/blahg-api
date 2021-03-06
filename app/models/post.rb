class Post
  attr_accessor :tag_names

  include MongoMapper::Document

  key :title, String
  key :date, Time
  key :content, String
  key :tag_ids, Array
  many :tags, in: :tag_ids

  before_save :add_tags

  def add_tags
    if tag_names
      tags = tag_names.map do |tag|
        Tag.find_or_create(name: tag)
      end
      self.tag_names = nil
      self.tags << tags
    end
  end
end
