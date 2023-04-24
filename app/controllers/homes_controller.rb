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
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def top
    # new topicで公開設定されている新規投稿4件を表示する
   @beans = Bean.where(publish_status: "released")
               .order(created_at: :desc)
               .limit(4)
  end
  
end
