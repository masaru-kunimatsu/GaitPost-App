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

  ヘッダーの「投稿検索」ボタンから検索画面に遷移し、キーワード、タグ、歩行周期、関節の条件を絞り検索できます。  
  表示されている投稿を選択すると投稿の詳細を確認できます。  

  ## 新規投稿機能

  ヘッダーのボタンから新規投稿が行えます。  
  タイトル、内容、文献、歩行周期、関節、タグを指定して投稿できます。
  タグは「,」で区切ることで複数登録できます。

  ## ユーザー管理機能

  ログインすることで自身の投稿の編集、削除が行えます。

# アプリケーションを作成した背景

  私自身が理学療法士として勤務する中で歩行分析の難しさを感じており、新人や学生も歩行分析が上手くできずに苦労しているという話をよく聞いていました。特にトップダウン評価（目の前の患者さんの動きを分析し、そこから問題点を洗い出す）が難しいと感じたり聞いたりしたため、それらの問題を解決するために多くのユーザーの知識を主に歩行の相と対象の関節でフィルタリングして投稿、閲覧できるアプリを作成することにしました。

# 洗い出した要件

  [要件定義シートはこちらをご確認ください](https://docs.google.com/spreadsheets/d/1WydnLdXvzCwiEBvQNbAMNgGmGzCfmFZsYcYGu4hUM3I/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明

  投稿検索機能
  指定した条件に合致する投稿が表示されます。
  [![Image from Gyazo](https://i.gyazo.com/07ff4c846aeeab1a43fb26c5ba985d70.gif)](https://gyazo.com/07ff4c846aeeab1a43fb26c5ba985d70)

  新規投稿機能

  

# 実装予定の機能

  閲覧履歴の保存
  非同期通信によるフロントエンドデザインの改善  

# データベース設計

  [![Image from Gyazo](https://i.gyazo.com/8ec85e251cea46f96a2cfd0437340ca0.png)](https://gyazo.com/8ec85e251cea46f96a2cfd0437340ca0)

# 画面遷移図

  [![Image from Gyazo](https://i.gyazo.com/b8c24d733f45836fa269e44dde6ae112.png)](https://gyazo.com/b8c24d733f45836fa269e44dde6ae112)

# 開発環境

  Ruby
  Ruby on Rails
  JavaScript
  MySQL
  HTML
  CSS
  GitHub 
  Render
  Visual Studio Code 

# ローカルでの動作方法

  以下のコマンドを順に実行してください
  % git clone https://github.com/masaru-kunimatsu/GaitPost-App
  % cd GaitPost-App
  % bundle install
  % yarn install