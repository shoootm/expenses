require 'rails_helper'

RSpec.describe FavoriteCount, type: :model do
  before do
    @favorite_count = FactoryBot.build(:favorite_count)
  end

  describe 'お気に入り機能' do
    context 'お気に入りがうまくいくとき' do
      it '全てが正常である' do
        expect(@favorite_count.valid?).to eq true
      end
    end
    context 'お気に入りがうまくいかないとき' do
      it 'expenseが紐付いていない場合、作成できない' do
        @favorite_count.expense = nil
        @favorite_count.valid?
        expect(@favorite_count.errors.full_messages).to include('Expense must exist')
      end
    end
  end
end
