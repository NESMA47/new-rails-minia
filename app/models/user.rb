class User < ApplicationRecord
  # 1. التحقق من وجود جميع الحقول (Presence)
  validates :name, :DOB, :email, :phone_number, presence: true

  # 2. التحقق من عدم تكرار الإيميل على مستوى الـ Model (مع تجاهل حالة الأحرف الكبير/الصغيرة)
  validates :email, uniqueness: { case_sensitive: false }

  # 3. التحقق من صيغة الإيميل (Email Structure) باستخدام الـ Regular Expression (Regex)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address" }
end