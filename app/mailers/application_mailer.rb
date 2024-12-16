class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
