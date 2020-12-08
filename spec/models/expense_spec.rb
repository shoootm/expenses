require 'rails_helper'

RSpec.describe Expense, type: :model do
  before do
    @expense = FactoryBot.build(:expense)
  end

  describe '会計簿作成機能' do
    context '会計簿作成がうまくいくとき' do
      it '全てが正常である' do
        expect(@expense.valid?).to eq true
      end
      it 'food_expenseが空でも作成できること' do
        @expense.food_expense = nil
        expect(@expense).to be_valid
      end
      it 'necessitiesが空でも作成できること' do
        @expense.necessities = nil
        expect(@expense).to be_valid
      end
      it 'clothes_expenseが空でも作成できること' do
        @expense.clothes_expense = nil
        expect(@expense).to be_valid
      end
      it 'beauty_expenseが空でも作成できること' do
        @expense.beauty_expense = nil
        expect(@expense).to be_valid
      end
      it 'entertainment_expenseが空でも作成できること' do
        @expense.entertainment_expense = nil
        expect(@expense).to be_valid
      end
      it 'medical_billが空でも作成できること' do
        @expense.medical_bill = nil
        expect(@expense).to be_valid
      end
      it 'education_costが空でも作成できること' do
        @expense.education_cost = nil
        expect(@expense).to be_valid
      end
      it 'utility_costsが空でも作成できること' do
        @expense.utility_costs = nil
        expect(@expense).to be_valid
      end
      it 'traveling_expenseが空でも作成できること' do
        @expense.traveling_expense = nil
        expect(@expense).to be_valid
      end
      it 'otherが空でも作成できること' do
        @expense.other = nil
        expect(@expense).to be_valid
      end
      it 'memoが空でも作成できること' do
        @expense.memo = nil
        expect(@expense).to be_valid
      end
    end

    context '会計簿作成がうまくいかないとき' do
      it 'incomeが空だと作成できない' do
        @expense.income = nil
        @expense.valid?
        expect(@expense.errors.full_messages).to include("Income can't be blank")
      end
      it 'userが紐付いていない場合、作成できない' do
        @expense.user = nil
        @expense.valid?
        expect(@expense.errors.full_messages).to include('User must exist')
      end
    end
  end
end
