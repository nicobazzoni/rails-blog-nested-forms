class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}
  validates_presence_of :name, :content


  def tags_attributes=(tags_attributes)
    
    tags_attributes.values.each do |tags_attribute|
      if tags_attribute["name"].present?
        tag = Tag.find_or_create_by(tags_attribute)
        self.tags << tags
    
      end
    end
  end
end



