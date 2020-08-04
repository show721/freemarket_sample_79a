crumb :root do
  link "トップページ", root_path
end
# マイページ
crumb :mypage do
  link "マイページ", users_path
  parent :root
end

#クレジットカード登録情報
crumb :card do
  link "クレジットカード登録", new_user_path
  parent :mypage
end

# 商品出品ページ
crumb :products_new do
  link "商品出品", new_product_path
  parent :mypage
end

# 商品詳細ページ
crumb :products_show do
  link "商品詳細", new_product_path
  parent :root
end