# ルート
crumb :root do
  link "メルカリ", root_path
end
# マイページ
crumb :mypage do
  link "マイページ", user_path
end
# メルカリ＞マイページ＞プロフィール
crumb :profile do|profile|
  link 'プロフィール'
  parent :mypage
end
# メルカリ＞マイページ＞本人情報の登録
crumb :information do|information|
  link '本人情報の登録'
  parent :mypage
end
# メルカリ＞マイページ＞ログアウト
crumb :logout do|logout|
  link 'ログアウト'
  parent :mypage
end
