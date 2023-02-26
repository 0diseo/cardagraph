class AddTypeToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations , :app_type, :string
    add_column :organizations , :access_user, :string
    add_column :organizations , :access_token, :string
  end
end
