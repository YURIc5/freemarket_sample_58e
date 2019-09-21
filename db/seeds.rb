# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 親
lady = Category.create(:name=>"レディース")
men = Category.create(:name=>"メンズ")
# baby = Category.create(:name=>"ベビー・キッズ")
# interior = Category.create(:name=>"インテリア")

# 子
lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")
# lady_pants = lady.children.create(:name=>"パンツ")
# lady_skirt = lady.children.create(:name=>"スカート")

men_tops = men.children.create(:name=>"トップス")
# men_jacket = men.children.create(:name=>"ジャケット/アウター")
# men_pants = men.children.create(:name=>"パンツ")
# men_shose = men.children.create(:name=>"靴")

# baby_girl = baby.children.create(:name=>"ベビー服(女の子用)")
# baby_boy = baby.children.create(:name=>"ベビー服/(男の子用)")
# baby_free = baby.children.create(:name=>"ベビー服/(男女兼用)")

# interior_kitchen = interior.children.create(:name=>"キッチン/食器")
# interior_bed = interior.children.create(:name=>"ベッド/マットレス")
# interior_sofa = interior.children.create(:name=>"ソファ/ソファベッド")

# 孫
lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
# lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])