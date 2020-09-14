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

    it "emailの@が空では登録できないこと" do
      @user.email = "test.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
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

    it "passwordが6文字以上・半角英数字混合であれば登録できること" do
      @user.password = "1234ab"
      @user.password_confirmation = "1234ab"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "1234a"
      @user.password_confirmation = "1234a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "firstnameが全角（漢字・ひらがな・カタカナ）以外であれば登録できないこと" do
      @user.firstname = "ｔａｎａｋａ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname Full-width characters")
    end

    it "lastnameが全角（漢字・ひらがな・カタカナ）以外であれば登録できないこと" do
      @user.lastname = "ｔａｒｏｕ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname Full-width characters")
    end

    it "f_name_readが全角（カタカナ）以外であれば登録できないこと" do
      @user.f_name_read = "たなか"
      @user.valid?
      expect(@user.errors.full_messages).to include("F name read Full-width katakana characters")
    end

    it "l_name_readが全角（カタカナ）以外であれば登録できないこと" do
      @user.l_name_read = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("L name read Full-width katakana characters")
    end

  end
end
