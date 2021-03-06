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

### 環境について

- 言語/フレームワーク
  - ruby-2.5.7
  - Rails 5.2.4.2
- インフラ
  - Web_server
    - EC2(AWS)
      - Nginx(Web用ミドルウェア)
      - EIP(固定IP設定)
  - DB_server
    - Route53(AWS)
      - MySQL(DB用ミドルウェア)
  - AP_server
    - Puma(Rails内)
      - Rack(Puma内、WebサーバとRails間のインターフェース)
- 開発環境
  - Vagrant
  - VirtualBox
    - CentOS
- CI環境
  - CircleCi（push後自動的にテスト実行）

### 使用技術一覧

- HTML/CSS
  - Bootstrap
  - Flexbox
  - SCSS
  - レスポンシブ対応
- Rails
  - CRUD処理
  - devise/gem(ユーザ認証)
  - refile/gem(画像アップロード)
  - adminフラグ
  - デバック
    - byebug
  - テスト
    - RSpec/gem(テスト全体のフレームワーク)
      - Capybara/gem(ブラウザ操作シミュレーション)
      - FactoryBot/gem(テストデータ生成)
      - Faker/gem(ダミーデータ生成)
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
- ログイン/ログアウト
- ユーザ登録/編集
- 投稿/編集
- 画像アップロード(非同期通信によるプレビュー機能)
- タイムライン機能
- ソート機能(人気投稿一覧/新規投稿一覧)
- いいね機能(非同期通信)
- フォロー機能
- ランキング機能(いいねの総数でユーザごとにランキング)
- 管理者機能(予期せぬ投稿があった際に使用。投稿画像の編集/削除のみ)

***

### 工夫点

#### 投稿の見せ方を工夫
画像投稿する事で、楽しく片付けをしていただきたいという考えがありました。
具体的に、投稿のBefore画像とAfter画像の比較をクリックやホバー動作で切り替えでき、楽しくなるような見せ方にしました。

#### 操作の説明方法を工夫
私自身が説明書を読むことが苦手だったりするので、
ターゲットユーザにとっても、説明はなるべくシンプルな方が嬉しいんじゃないかと思い考えました。
具体的にツールチップを使って操作のヒントを入れたり、
マウスカーソルを指マークにして直感的にクリックしてもらうようにしました。

***

### 反省点
- バックエンド
  - デプロイまでを効率的にしたい為、CircleCIなどを導入したい。
- フロントエンド
  - フロントにフレームワークを導入したい。
  
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
