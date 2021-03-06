require_relative '../../../spec/dependency_helper'

module ExpenseTracker
  RSpec.describe Ledger, :db do
    let(:ledger) { Ledger.new }
    let(:expense) do { 'payee'  => 'Coffee Tossy',
                       'amount' => 5.75,
                       'date'   => '2017-06-10' }
    end

    def confirm_failed_record(result)
      expect(result).not_to be_success
      expect(result.expense_id).to eq(nil)
      expect(result.error_message).to eq('Invalid expense: [payee, amount, date] are required')
      expect(DB[:expenses].count).to eq(0)
    end

    describe '#record' do
      context 'with a valid expense' do
        it 'successfully saves the expense in the DB' do
          result = ledger.record(expense)

          expect(result).to be_success
          expect(DB[:expenses].all).to match [a_hash_including(
            id: result.expense_id,
            payee: 'Coffee Tossy',
            amount: 5.75,
            date: Date.iso8601('2017-06-10')
          )]
        end
      end

      context 'when the expense lacks required keys' do
        it 'when payee is missing, rejects the expense as invalid' do
          expense.delete('payee')
          result = ledger.record(expense)
          confirm_failed_record(result)
        end

        it 'when amount is missing, rejects the expense' do
          expense.delete('amount')
          result = ledger.record(expense)
          confirm_failed_record(result)
        end

        it 'when date is missing, rejects the expense' do
          expense.delete('date')
          result = ledger.record(expense)
          confirm_failed_record(result)
        end
      end
    end

    describe '#expenses_on' do
      it 'returns all expenses for the provided date' do
        result_1 = ledger.record(expense.merge('date' => '2017-06-10'))
        result_2 = ledger.record(expense.merge('date' => '2017-06-10'))
        result_3 = ledger.record(expense.merge('date' => '2017-06-11'))

        expect(ledger.expenses_on('2017-06-10')).to contain_exactly(
          a_hash_including(id: result_1.expense_id),
          a_hash_including(id: result_2.expense_id)
          )
      end

      it 'returns a blank array when there are no matching expenses' do
        expect(ledger.expenses_on('1899-01-01')).to eq([])
      end
    end
  end
end