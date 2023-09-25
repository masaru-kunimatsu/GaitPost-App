# アプリケーション名

  Gait-Post

# アプリケーション概要

  歩行の各相、関節ごとにどのような問題が起きている場合どのような原因や治療方法が考えられるか調べて選び取ることができます。

# URL

  https://gaitpost-app.onrender.com/

# テスト用アカウント

  Basic認証ユーザー名：admin  
  Basic認証パスワード：pass39324  
  テスト用アカウントemail：taro@test  
  テスト用アカウントpassword：test39324  

# 利用方法

  ## 投稿検索機能

  トップページ左側の検索欄からキーワード、タグ、歩行周期、関節の条件を絞り検索できます。  
  表示されている投稿を選択すると投稿の詳細を確認できます。  

  ## 新規投稿機能

  ヘッダーのボタンから新規投稿が行えます。  
  歩行周期、関節、タグを指定して投稿できます。

  ## ユーザー管理機能

  ログインすることで自身の投稿の編集、削除が行えます。

# アプリケーションを作成した背景

  私自身が理学療法士として勤務する中で歩行分析の難しさを感じており、新人や学生も歩行分析が上手くできずに苦労しているという話をよく聞いていました。特にトップダウン評価（目の前の患者さんの動きを分析し、そこから問題点を洗い出す）が難しいと感じたり聞いたりしたため、それらの問題を解決するために多くのユーザーの知識を主に歩行の相と対象の関節でフィルタリングして投稿、閲覧できるアプリを作成することにしました。

# 洗い出した要件

  要件定義シート(https://docs.google.com/document/d/1iN7nWHGShPTzZ-B-sR-lh-HP3I00FMOA/edit#heading=h.gjdgxs)

# 実装した機能についての画像やGIFおよびその説明

  今後追加予定です。

# 実装予定の機能

  検索機能の充実。  
  コメント投稿機能。  
  いいね機能。  

# データベース設計

  [![Image from Gyazo](https://i.gyazo.com/2e504b0b789406a8964989cb760da38e.png)](https://gyazo.com/2e504b0b789406a8964989cb760da38e)




# データベース設計

  ## users
  | Column             | Type   | Options                   |
  |--------------------|--------|---------------------------|
  | user_name          | string | null: false               |
  | email              | string | null: false, unique: true |
  | encrypted_password | string | null: false               |

  ### Association
    has_many :posts
    has_many :comments
    has_many :likes


  ## posts
  | Column       | Type       | Options                        |
  |--------------|------------|--------------------------------|
  | title        | string     | null: false                    |
  | detail       | text       | null: false                    |
  | literature   | text       | null: false                    |
  | walkcycle_id | integer    | null: false                    |
  | joint_id     | integer    | null: false                    |
  | user         | references | null: false, foreign_key: true |

  ### Association
    belongs_to :user
    has_many :comments
    has_many :likes
    has_many :tags, through: :post_tag_relations
    has_many :post_tag_relations
    belongs_to :walkcycle
    belongs_to :joint

  ## likes
  | Column  | Type       | Options           |
  |---------|------------|-------------------|
  | user    | references | foreign_key: true |
  | post    | references | foreign_key: true |

  ### Association
    belongs_to :user
    belongs_to :post


  ## comments
  | Column  | Type       | Options           |
  |---------|------------|-------------------|
  | user    | references | foreign_key: true |
  | post    | references | foreign_key: true |

  ### Association
    belongs_to :user
    belongs_to :post


  ## tags
  | Column   | Type   | Options                      |
  |----------|--------|------------------------------|
  | tag_name | string | null:false, uniqueness: true |

  ### Association
    has_many :post_tag_relations
    has_many :posts, through: :post_tag_relations


  ## post_tag_relations
  | Column  | Type       | Options           |
  |---------|------------|-------------------|
  | post    | references | foreign_key: true |
  | tag     | references | foreign_key: true |

  ### Association
  belongs_to :post
  belongs_to :tag
  