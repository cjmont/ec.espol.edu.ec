class DropCalendarioItems < ActiveRecord::Migration
  def change
  	drop_table :calendario_items do |t|
  end
end
