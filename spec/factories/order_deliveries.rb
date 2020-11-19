FactoryBot.define do
  factory :order_delivery do
    postal_code { '914-0141' }
    prefecture_id { 18 }
    city { '敦賀市' }
    addresses { '莇生野58-24-2' }
    building { '503' }
    phone_number { '08029563297' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
