# README

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
  | user         | references | null: false, foreign_key: true |

  ### Association
    belongs_to :user
    has_many :comments
    has_many :likes
    has_many :tags, through: :post_tag_relations
    has_many :post_tag_relations
    has_many :post_walkcycles
    has_many :walkcycles

  ## likes
  | Column  | Type       | Options           |
  |---------|------------|-------------------|
  | user    | references | foreign_key: true |
  | post    | references | foreign_key: true |

  ### Association
    belongs_to :user
    belongs_to :tweet


  ## comments
  | Column  | Type       | Options           |
  |---------|------------|-------------------|
  | user    | references | foreign_key: true |
  | post    | references | foreign_key: true |

  ### Association
    belongs_to :user
    belongs_to :tweet


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
  