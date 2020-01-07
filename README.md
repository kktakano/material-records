# README


# Material Records

URL:http://54.65.170.125/

<dl>
  <dt>テストアカウント </dt>
  <dd>メールアドレス:hoge@hoge.com</dd>
  <dd>パスワード:1234abcd</dd>
</dl> 

モノづくりをされる方へ向けた材料コスト管理アプリです。  
あらかじめ材料の総量を登録する事で、作るものを登録する際に材料の使用量を入力すると総コストを計算し登録します。  
コスト計算や確認のお手伝いをします。  

動作確認方法  
Chromeの最新版を利用してアクセスしてください。  
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。  
接続先およびログイン情報については、上記の通りです。  
同時に複数の方がログインしている場合に、ログインできない可能性がございます。  
確認後、ログアウト処理をお願いします。  

# 機能一覧

- 材料・商品一覧表示機能  
- 材料・商品登録編集機能  
- 画像ファイルのアップロード機能  
- ユーザー登録機能  
- ユーザーログイン機能  
- DBテーブルのリレーション機能  
- ページネーション機能  
- 単体テスト機能  
- 統合テスト機能  

# DEMO

"hoge"の魅力が直感的に伝えわるデモ動画や図解を載せる
 
# 使用技術(開発環境)
 
- ruby 2.5.1  
- Ruby on Rails 5.2.3  
- JavaScript  
- jQuery  
- MySQL  
- Github  
- AWS  
- Visual Studio Code  

# Database設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|e_mail|string|null: false, add_index|
|password|string|null: false|

### Association
- has_many :items
- has_many :materials



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer||
|cost|decimal(6,1)|null: false|
|image|string||
|user_id|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- has_many :use_materials


## materialsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|value|integer|null: false|
|unit|string|null: false|
|image|string||
|supplier|string||
|user_id|references|null: false,foreign_key: true|


### Association
- belongs_to :user
- has_many :use_materials


## use_materialsテーブル

|Column|Type|Options|
|------|----|-------|
|material_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|price|decimal(6,1)|null: false|

### Association
- belongs_to :item
- belongs_to :material
