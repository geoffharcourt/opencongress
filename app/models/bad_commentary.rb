# == Schema Information
#
# Table name: bad_commentaries
#
#  url                 :text
#  commentariable_id   :integer
#  commentariable_type :string(255)
#  date                :datetime
#  id                  :integer          not null
#

class BadCommentary < ActiveRecord::Base
end
