class AddAddressToUsers < ActiveRecord::Migration[8.1]
  def change
    # إضافة الحقل مع إجبار قاعدة البيانات ألا تقبل قيم فارغة (NOT NULL)
    add_column :users, :address, :string, null: false
  end
end