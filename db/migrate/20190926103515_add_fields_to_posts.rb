# frozen_string_literal: true

class AddFieldsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string
    add_column :posts, :content, :text
  end
end
