module Requests
  module JsonHelpers

    def json
      JSON.parse(response.body)
    end

    def payload(record, attributes)
      hash = {}
      attributes.each do |attr|
        if attr.class == Hash
          hash.merge!(attr)
        else
          hash[attr] = record[attr]
        end
      end
      {"data":{"attributes":hash.as_json,"type":record.class.to_s.downcase.pluralize}}
    end
  end
end
