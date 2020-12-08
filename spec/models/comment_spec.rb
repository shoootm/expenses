require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿機能' do
    context 'コメント投稿がうまくいくとき' do
      it '全てが正常である' do
        expect(@comment.valid?).to eq true
      end
    end
    context 'コメント投稿がうまくいかないとき' do
      it 'textが空だと作成できない' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐付いていない場合、作成できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'expenseが紐付いていない場合、作成できない' do
        @comment.expense = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Expense must exist')
      end
    end
  end
end
