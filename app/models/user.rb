class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,        presence: true

  validate :password_complexity

  private

  def password_complexity
    return if password.blank?

    # 半角英字と数字の両方が含まれているかをチェックする正規表現
    unless password.match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i)
      errors.add :password, 'は半角英数字を含めて設定してください'
    end
  end
end
