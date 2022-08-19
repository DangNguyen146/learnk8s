### clean kong log
require "json"
def filter(tag, time, record)
    edit_json(record)
end
def edit_json(record)

    if record.has_key? "request"
        if record['request'].has_key? "headers"
          if record['request']['headers'].has_key? "x-forwarded-for"
              record['x-forwarded-for'] = record['request']['headers']['x-forwarded-for']
          end 
        end 
    end 

    record['status'] = record['status'].to_i
    record['lat_request'] = record['lat_request'].to_i
    record['lat_proxy'] = record['lat_proxy'].to_i
    record['size'] = record['size'].to_i
    record['request_size'] = record['request_size'].to_i
    
    record.delete('latencies')
    record.delete('service')
    record.delete('request')
    # record.delete('tries')
    record.delete('route')
    record.delete('response')
    record.delete('started_at')
    record.delete('upstream_uri')
    record.delete('time')

    record
end