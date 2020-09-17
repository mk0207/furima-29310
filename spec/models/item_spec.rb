require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全てに値が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが選択されていないと登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it 'status_idが選択されていないと登録できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end

    it 'delfee_idが選択されていないと登録できないこと' do
      @item.delfee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delfee Select")
    end

    it 'ship_ori_idが選択されていないと登録できないこと' do
      @item.ship_ori_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship ori Select")
    end

    it 'ship_day_idが選択されていないと登録できないこと' do
      @item.ship_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day Select")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300~9999999以外では登録できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

  end
end
