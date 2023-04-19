class HomesController < ApplicationController
  # ゲストログインのためのメソッド
def guest_sign_in
  # ゲストユーザーのメールアドレスとパスワードを設定
  email = 'guest@example.com'
  password = SecureRandom.urlsafe_base64

  # ゲストユーザーが存在する場合はそのユーザーでログインし、存在しない場合は作成する
  user = User.find_or_create_by(email: email) do |u|
    u.name = 'Guest'
    u.password = password
  end

  # ログインする
  sign_in user

  # ログイン後にリダイレクトする先を設定する
  redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
end

  def top
    @beans = Bean.order(created_at: :desc).limit(4)
  end
end
