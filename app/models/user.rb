# class User < ActiveRecord::Base
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :trackable, :validatable
# end
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
         
         # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
           # attr_accessible :title, :body
end
# class DeviseCreateUsers < ActiveRecord::Migration
#   def change
#     create_table(:users) do |t|
#       ## Database authenticatable
#       t.string :email,              :null => false, :default => ""
#       t.string :encrypted_password, :null => false, :default => ""
# 
#       ## Recoverable
#       # t.string   :reset_password_token
#       # t.datetime :reset_password_sent_at
# 
#       # Some fields not listed here for brevity
# 
#       t.boolean :is_blogger
# 
#       t.timestamps
#     end
# 
#     add_index :users, :email,                :unique => true
#     # add_index :users, :reset_password_token, :unique => true
#     # add_index :users, :confirmation_token,   :unique => true
#     # add_index :users, :unlock_token,         :unique => true
#     # add_index :users, :authentication_token, :unique => true
#   end
# end
