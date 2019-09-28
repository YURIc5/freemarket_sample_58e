# crumb :root do
#   link "Home", root_path
# end

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

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).