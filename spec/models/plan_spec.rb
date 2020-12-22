require 'rails_helper'

RSpec.describe Plan, type: :model do
  before do
    @plan = FactoryBot.build(:plan)
  end

  it 'タイトルが入力されていれば保存できること' do
    expect(@plan).to be_valid
  end

  it 'タイトルが空では保存できないこと' do
    @plan.title = ''
    @plan.valid?
    expect(@plan.errors.full_messages).to include("Title can't be blank")
  end

  it 'userが存在しなければ保存できないこと' do
    @plan.user = nil
    @plan.valid?
    expect(@plan.errors.full_messages).to include("User must exist")
  end
end
