require 'rails_helper'

RSpec.describe Detail, type: :model do
  before do
    @detail = FactoryBot.build(:detail)
  end

  it '正しく入力されていれば保存できること' do
    expect(@detail).to be_valid
  end

  it '詳細概要が空では保存できないこと' do
    @detail.title = ''
    @detail.valid?
    expect(@detail.errors.full_messages).to include("Title can't be blank")
  end

  it '詳細内容が空では保存できないこと' do
    @detail.text = ''
    @detail.valid?
    expect(@detail.errors.full_messages).to include("Text can't be blank")
  end

  it 'itemが存在しなければ保存できないこと' do
    @detail.item = nil
    @detail.valid?
    expect(@detail.errors.full_messages).to include("Item must exist")
  end
end
