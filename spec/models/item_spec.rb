require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it 'タイトルが入力されていれば保存できること' do
    expect(@item).to be_valid
  end

  it 'タイトルが空では保存できないこと' do
    @item.title = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Title can't be blank")
  end

  it 'planが存在しなければ保存できないこと' do
    @item.plan = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Plan must exist")
  end
end
