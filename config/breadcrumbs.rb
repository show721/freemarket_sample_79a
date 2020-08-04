crumb :root do
  link "トップページ", root_path
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

# マイページ
crumb :mypage do
  link "マイページ", new_user_path
  parent :root
end

# ログインページ
crumb :login do
  link "ログイン", new_user_path
  parent :root
end

# ログアウトページ
crumb :logout do
  link "ログアウト", edit_user_path
  parent :mypage
end