class CreateEnumTransitions < ActiveRecord::Migration[7.1]
  def change
    create_table :enum_transitions do |t|
      t.string :name
      t.integer :status, default: 0
      t.integer :source, default: 0
      t.timestamps
    end
  end
end
