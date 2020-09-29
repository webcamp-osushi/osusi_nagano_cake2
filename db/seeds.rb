# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@test.com',
   password: 'admintest',
)

Genre.create([
  {name:"ケーキ", is_active:true},
  {name:"ホールケーキ", is_active:true},
  {name:"タルト", is_active:true},
  {name:"プリン", is_active:true},
  {name:"シュークリーム", is_active:true}
  ])

Product.create([
  {genre_id:1, name:"ショートケーキ", 
  introduction:"甘さ控えめのクリームにイチゴの甘さと酸味が絶妙に合わさった当店の1番人気商品です。", 
  image_id: "", 
  price:331, is_active: true},

  {genre_id:1, name:"抹茶ケーキ", 
  introduction:"宇治の抹茶をふんだんに使い、風味豊かな一品に仕上げました。", 
  image_id: "", 
  price:368, is_active: true},

  {genre_id:3, name:"イチゴタルト", 
  introduction:"サクッと仕上げたパイ生地にイチゴをふんだんに盛り付けたこだわりの一品です。", 
  image_id: "", 
  price:368, is_active: true},

   {genre_id:4, name:"ナガノ特製プリン", 
  introduction:"創業時から親しまれている当店の売れ筋商品です。贈答用にもどうぞ。", 
  image_id: "", 
  price:183, is_active: true},

   {genre_id:2, name:"ショコラケーキ ホール", 
  introduction:"ベルギー産ガトーショコラを贅沢に使った商品。", 
  image_id: "", 
  price:2759, is_active: true}
])

Customer.create([
  {last_name:"田中", first_name:"太郎", last_name_kana:"タナカ", first_name_kana:"タロウ",
   postal_cord:"1234567", address:"大阪府東大阪市稲田新町1-12-39", telephone_number:"09076503150",
   email: "tanaka@gmail.com", password:"123456"},

   {last_name:"佐藤", first_name:"次郎", last_name_kana:"サトウ", first_name_kana:"ジロウ",
   postal_cord:"9876543", address:"大阪府枚方市宮之阪3-8-55", telephone_number:"09087602830",
   email: "satou@gmail.com", password:"123456"},

   {last_name:"鈴木", first_name:"三郎", last_name_kana:"スズキ", first_name_kana:"サブロウ",
   postal_cord:"5678901", address:"埼玉県大宮市3-4-7", telephone_number:"08096107650",
   email: "suzuki@gmail.com", password:"123456"}
])

Address.create([
{customer_id:1, name:"斎藤 孝司", 
postal_code:"4567890", address:"東京都江東区門前仲町5-1-3"
}
])




