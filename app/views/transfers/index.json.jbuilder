json.array!(@transfers) do |transfer|
  json.extract! transfer, :id, :product_req_id, :product_offer_id, :active
  json.url transfer_url(transfer, format: :json)
end
