class Item < ActiveRecord::Base

  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true

  after_initialize { puts "Model Item has been initialized" } # Item.new; Item.first
  after_save       { puts "Model Item has been saved" } # item.save; Item.create; item.update_attributes()
  after_create     { puts "Model Item has been created" }
  after_update     { puts "Model Item has been updated" }
  after_destroy    { puts "Model Item has been destroyed" } # item.destroy

end
