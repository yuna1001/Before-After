require 'rails_helper'

describe '投稿のテスト' do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:post2) { create(:post, user: user2) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe '詳細画面のテスト' do
    context '自分・他人共通の投稿詳細画面の表示を確認' do
      it 'プロフィール画像のリンク先が正しい' do
        visit post_path(post)
        expect(page).to have_link post.user.profile_image, href: user_path(post.user)
      end
      it '投稿の説明文が表示される' do
        visit post_path(post)
        expect(page).to have_content post.body
      end
      it '投稿のいいね数が表示される' do
        visit post_path(post)
        expect(page).to have_content post.favorites.count
      end
    end
  end

  describe '編集のテスト' do
    context '自分の投稿の編集画面への遷移' do
      it '遷移できる' do
        visit edit_post_path(post)
        expect(current_path).to eq('/posts/' + post.id.to_s + '/edit')
      end
    end
    context '他人の投稿の編集画面への遷移' do
      it '遷移できない' do
        visit edit_post_path(post2)
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
    end
  end

  describe ' 投稿のテスト' do
    context '表示の確認' do
      before do
      visit new_post_path 
      end
      it '新規投稿が表示される' do
        expect(page).to have_content '新規投稿'
      end
      it 'before画像フォームが表示される' do
        expect(page).to have_field 'post[before_image]'
      end
      it 'after画像フォームが表示される' do
        expect(page).to have_field 'post[after_image]'
      end
      it '説明フォームが表示される' do
        expect(page).to have_field 'post[body]'
      end
      it '新規投稿ボタンが表示される' do
        expect(page).to have_button '投稿'
      end
      it '投稿に成功する' do
        attach_file 'post[before_image]', Rails.root.join('spec/factories/images/logo.png') 
        attach_file 'post[after_image]', Rails.root.join('spec/factories/images/logo.png')      
        fill_in 'post[body]', with: Faker::Lorem.characters(number:5)
        click_button '投稿'
        expect(page).to have_current_path("/posts/3")
      end
      it '投稿に失敗する' do
        click_button '投稿'
        expect(page).to have_content '入力してください'
        expect(current_path).to eq('/posts')
      end
    end
  end

end
