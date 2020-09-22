require 'rails_helper'

RSpec.describe OrdersManageForm, type: :model do
  describe '#create' do
    before do
      @orders_manage = FactoryBot.build(:orders_manage_form)
    end

    it 'build以外に値が存在すれば登録できること' do
      expect(@orders_manage).to be_valid
    end

    it "postalが空では登録できないこと" do
      @orders_manage.postal = nil
      @orders_manage.valid?
      expect(@orders_manage.errors.full_messages).to include("Postal can't be blank")
    end

    it "prefecture_idが選択されていないと登録できないこと" do
      @orders_manage.prefecture_id = 1
      @orders_manage.valid?
      expect(@orders_manage.errors.full_messages).to include("Prefecture Select")
    end

    it "cityが空では登録できないこと" do
      @orders_manage.city = nil
      @orders_manage.valid?
      expect(@orders_manage.errors.full_messages).to include("City can't be blank")
    end

    it "ad_numが空では登録できないこと" do
      @orders_manage.ad_num = nil
      @orders_manage.valid?
      expect(@orders_manage.errors.full_messages).to include("Ad num can't be blank")
    end

    it "tellが空では登録できないこと" do
      @orders_manage.tell = nil
      @orders_manage.valid?
      expect(@orders_manage.errors.full_messages).to include("Tell can't be blank")
    end


    it "postalがハイフン無しでは登録できないこと" do
      @orders_manage.postal = '1231234'
      @orders_manage.valid?
      expect(@orders_manage.errors.full_messages).to include("Postal code Input correctly")
    end

    it "postalがハイフン有りでも、前３桁後４桁でなければ登録できないこと" do
      @orders_manage.postal = '123-123'
      @orders_manage.valid?
      expect(@orders_manage.errors.full_messages).to include("Postal code Input correctly")
    end

    it "tellがハイフン無しで11桁以外では登録できないこと" do
      @orders_manage.tell = '1234567890'
      @orders_manage.valid?
      expect(@orders_manage.errors.full_messages).to include("Tell is invalid")
    end

  end
end
