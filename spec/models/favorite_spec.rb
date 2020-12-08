require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  describe 'お気に入り機能' do
    context 'お気に入りがうまくいくとき' do
      it '全てが正常である' do
        expect(@favorite.valid?).to eq true
      end
    end
    context 'お気に入りがうまくいかないとき' do
      it 'userが紐付いていない場合、作成できない' do
        @favorite.user = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include('User must exist')
      end
      it 'expenseが紐付いていない場合、作成できない' do
        @favorite.expense = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include('Expense must exist')
      end
    end
  end
end
