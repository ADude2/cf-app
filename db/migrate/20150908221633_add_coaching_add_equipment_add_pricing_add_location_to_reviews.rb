class AddCoachingAddEquipmentAddPricingAddLocationToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :score, :float, default: 0
    add_column :reviews, :coaching, :float, default: 0
    add_column :reviews, :equipment, :float, default: 0
    add_column :reviews, :pricing, :float, default: 0
    add_column :reviews, :location, :float, default: 0
  end
end
