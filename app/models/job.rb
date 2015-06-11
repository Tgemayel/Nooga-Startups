class Job < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search,
                :against => [:title, :location, :description, :company, :url,:email, :category_id],
                :using => {
                  :tsearch => {:dictionary => "english"}
                }

  belongs_to :category
  belongs_to :user
end
