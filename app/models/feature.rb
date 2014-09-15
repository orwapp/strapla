class Feature < ActiveRecord::Base
  attr_accessor :form_id
  attr_accessor :return_to_page
  attr_accessor :current_user

  belongs_to :request
  belongs_to :price_quote

  has_many :estimated_hours, dependent: :destroy
  has_many :attachments

  validates_presence_of :title
  validates :status, inclusion: %w(not_started started completed accepted), allow_nil: true

  validates_each :status do |record, attr, value|
    if value == 'accepted' and !(record.current_user == record.request.user)
      record.errors.add(attr, 'Only request owner can set accepted status') # move to I18n eventually
    end
  end

end
