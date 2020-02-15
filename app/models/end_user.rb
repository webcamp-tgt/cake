class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items,dependent: :destroy
  has_many :orders,dependent: :destroy
  has_many :shipping_addresses,dependent: :destroy

  def full_name
  	[first_name, last_name].join('')
  end

  acts_as_paranoid

  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  def active_for_authentication?
    super && !deleted_at
  end

  def inactive_massage
    !deleted_at ? super : deleted_account
  end
end
