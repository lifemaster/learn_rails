class User < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  def fullname
    first_name + ' ' + last_name
  end

  def fine_birthday
    birthday.strftime('%d.%m.%Y') if birthday
  end

  def get_age
    Time.now.year - birthday.year if birthday
  end
end
