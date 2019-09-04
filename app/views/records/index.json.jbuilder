# json.array! @records, partial: "records/record", as: :record

json.array!(@records) do |record|
  json.extract! record, :id, :title, :description   
  json.start record.start_date   
  json.end record.end_date   
  json.url record_url(record, format: :html) 
end