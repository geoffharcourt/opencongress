# == Schema Information
#
# Table name: committees_people
#
#  id           :integer          not null, primary key
#  committee_id :integer
#  person_id    :integer
#  role         :string(255)
#  session      :integer
#

class CommitteePerson < OpenCongressModel

  #========== ATTRIBUTES

  self.table_name = 'committees_people'

  #========== VALIDATORS

  validates_uniqueness_of :person_id, :scope => [:committee_id, :session]
  validates_associated :person, :committee
  validates_presence_of :session

  #========== RELATIONS

  #----- BELONGS_TO

  belongs_to :committee
  belongs_to :person

end