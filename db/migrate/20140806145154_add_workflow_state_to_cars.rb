class AddWorkflowStateToCars < ActiveRecord::Migration
  def change
    add_column :cars, :workflow_state, :string
    # method name
    #   - add_column
    #   - remove_column :cars, :workflow_state
    #  http://edgeguides.rubyonrails.org/active_record_migrations.html
    # parameter 1: the table
    # parameter 2: the column name
    # parameter 3: the column type
  end
end
