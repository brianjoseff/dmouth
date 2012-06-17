class Asset < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  
  has_attached_file :image, :styles => { :normal => "100%", :article => "960",:small => "100 x100>",:medium => "200x200>", :thumb => "50x50>" },
                            :storage => :s3, 
                            :s3_credentials => "#{Rails.root}/config/s3.yml", 
                            :path => "/:attachment/:id/:style/:filename"
                            
                         
  validates_attachment_presence :image
  # validates_attachment_size :image, :less_than => 5.megabytes
                    
end
