# Before-After

### サイトURL
<a href="https://beforeafter.work/">Before-After</a>

### サイト概要
片付け前と後の画像を投稿し、共有し合うサイトです。

### サイトテーマ
「片付けのやる気をUpさせよう!!」

### テーマを選んだ理由
私自身片付けが苦手なのとズボラな性格なのでいつも片付けをやる気にならず、
部屋が散らかっていることに対して罪悪感を感じています。
そこで、写真を投稿して誰かに見せることでやる気をあげられたらと思い、
同じ悩みをもつ方に向けて、片付けのやる気を上げてくれるサイトを作ろうと考えました。

### ターゲットユーザ
部屋の片付けが苦手な一般ユーザ

### 主な利用シーン
片付けるモチベーションが欲しい時

***

### 構築環境について

- 言語/フレームワーク

  - ruby-2.5.7
  - javascript
  - Rails 5.2.4.2

- インフラ

  - Webサーバ
    - EC2(AWS)
      - Nginx(Webサーバ用ミドルウェア)
      - EIP(固定IP設定)
      - DNS登録

  - DBサーバ
    - Route53(AWS)
      - MySQL(DBサーバ用ミドルウェア)

  - APサーバ
    - Puma(railsに内蔵)
      - Rack(Pumaに内蔵、Webサーバとrails間のインターフェース)
  
- 開発環境

  - Vagrant(仮想環境)

  - VirtualBox(仮想マシン)
    - CentOS(仮想マシンの上のOS、Linuxディストリビューション)

### 使用技術一覧

- HTML/CSS
  - Bootstrap
  - Flexbox
  - SCSS
  - レスポンシブ対応

- Rails
  - CRUD処理
  - devise(ユーザ認証用gem)
  - refile(画像アップロード用gem)
  - adminフラグ
  - デバック
    - byebug

- SQL
  - テーブル結合

- javascript
  - 非同期通信
  - Onclick
  - Scroll
  - ライブラリ
    - tippy.js(ツールチップ)
    - drawer(レスポンシブ対応時のハンバーガーメニュー)

### 機能一覧
- ログイン
- 画像アップロード
- フォロー機能
- いいね機能(非同期通信)
- ソート機能(人気投稿一覧/新規投稿一覧)
- タイムライン機能(フォローしているユーザの投稿一覧)
- ランキング機能(いいねの総数でユーザごとにランキング)
- 管理者機能(予期せぬ投稿があった際に使用。投稿画像の編集/削除のみ)

***

### 工夫点

##### 投稿の見せ方
理由は、画像投稿することで楽しく片付けをしてもらいたいという気持ちがあったからです。
具体的に投稿のBefore画像とAfter画像の比較をクリックやホバー動作で切り替えでき、楽しくなるような見せ方にしました。

##### 操作の説明方法
理由は、私自身が説明書を読むことが苦手だったりするので、
ターゲットユーザにとっても、説明はなるべくシンプルな方が嬉しいんじゃないかと思い考えました。
具体的にツールチップを使って操作のヒントを入れたり、
マウスカーソルを指マークにして直感的にクリックしてもらうようにしました。

***

### 反省点
- バックエンド
  - 正確なアプリケーションにする為に、RSpecなどでテストを導入したい
  - テストからデプロイまでを効率的にしたい為、CircleCIなどを導入したい
  
***

## 設計書

### ER図
<https://drive.google.com/file/d/1BRaPq8mt4PY_Ie3Sc0P8aA_S50fSCYqb/view?usp=sharing>

### テーブル定義書
<https://docs.google.com/spreadsheets/d/13LnvFDdoLos1eXmgYgVxMWyIEpVEWikeYChMuf4CplQ/edit?usp=sharing>

### ワイヤーフレーム
<https://drive.google.com/file/d/1q57oK-bI3g_bC_JfprUmHbRFqhPwU72A/view?usp=sharing>

### アプリケーション詳細設計書
<https://docs.google.com/spreadsheets/d/1q1CaPOR39kzKRiNY1-yr9inrwQOOCUHnxhKWHDhmTIA/edit?usp=sharing>

### 機能一覧
<https://docs.google.com/spreadsheets/d/1I1M6kfyfu32btQkhNTg9Omfpyld7jX5szR7vsNUw-qY/edit?usp=sharing>


