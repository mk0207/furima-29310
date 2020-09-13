require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
#空白では保存できないテスト
    it "全てに値が存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "firstnameが空では登録できないこと" do
      @user.firstname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it "lastnameが空では登録できないこと" do
      @user.lastname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it "f_name_readが空では登録できないこと" do
      @user.f_name_read = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("F name read can't be blank")
    end

    it "l_name_readが空では登録できないこと" do
      @user.l_name_read = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("L name read can't be blank")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
