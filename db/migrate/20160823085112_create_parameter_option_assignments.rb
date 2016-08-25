class CreateParameterOptionAssignments < ActiveRecord::Migration
  def change
    create_table :parameter_option_assignments do |t|
      t.belongs_to :parameter_option
      t.belongs_to :resource, polymorphic: true
    end
  end
end
