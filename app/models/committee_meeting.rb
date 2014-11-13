# == Schema Information
#
# Table name: committee_meetings
#
#  id           :integer          not null, primary key
#  subject      :text
#  meeting_at   :datetime
#  committee_id :integer
#  where        :string(255)
#

class CommitteeMeeting < OpenCongressModel

  #========== VALIDATORS

  # TODO Since committee meeting times are all the same (a bug)
  # this was preventing any committee from having more than one meeting.
  # Once committee meeting times have been fixed, this should be re-enabled.
  # validates_uniqueness_of :meeting_at, :scope => :committee_id

  #========== RELATIONS

  #----- BELONGS_TO

  belongs_to :committee

  #----- HAS_MANY

  has_many :committee_meetings_bills 
  has_many :bills, :through => :committee_meetings_bills

  #========== METHODS

  #----- CLASS

  def self.after (date)
    where('meeting_at > ?', date)
  end

  def self.future
    after(Date.today)
  end

end