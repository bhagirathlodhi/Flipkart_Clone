class ToAddReferences < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :user, index: true

  end
end
