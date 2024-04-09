module Billy
  class Cache
    class CacheKeyBody
      attr_reader :body, :keys_to_ignore
      def initialize(body, keys_to_ignore)
        @body = body
        @keys_to_ignore = keys_to_ignore
      end

      def cache_body
        input_body = body.to_s

        if keys_to_ignore.any?
          input_body = extract_body_as_json(input_body, keys_to_ignore)
        end

        body_formatted = JSONUtils.json?(input_body) ? JSONUtils.sort_json(input_body) : input_body
        body_msg = " with body '#{body_formatted}'"
        {
          key: Digest::SHA1.hexdigest(body_formatted),
          body_msg: body_msg
        }
      end

      def extract_body_as_json(input_body, keys_to_ignore)
        body_hash = JSONUtils.json?(input_body) ? JSON.parse(input_body) : Rack::Utils.parse_query(input_body)
        body_hash = body_hash.reject { |k, _v| keys_to_ignore.include?(k) }
        JSONUtils.json?(input_body) ? JSONUtils.sort_json(body_hash.to_json) : Rack::Utils.build_query(body_hash)
      end
    end
  end
end