class CreatePaymentIntents < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_intents do |t|
      t.string :payment_intent_id
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
