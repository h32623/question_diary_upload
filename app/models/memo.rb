class Memo < ActiveRecord::Base
    belongs_to :question
    has_many :likes
end
