class User < ActiveRecord::Base

  validates :first_name, :last_name, presence: true # { :presence => true }

  def full_name
    first_name + ' ' + last_name
  end

  def fine_birthday
    if birthday
      birthday.strftime('%d.%m.%Y')
    end
  end

end
