module Billy
  class Cache
    class RecoverPreviousCache
      class FileNotFound < StandardError; end
      attr_reader :cache, :base_key, :cache_body, :previous_cache_body
      def initialize(cache, base_key, cache_body, previous_cache_body)
        @cache = cache
        @cache_body = cache_body
        @base_key = base_key
        @previous_cache_body = previous_cache_body
      end

      def recover!
        previous_key = [base_key, previous_cache_body[:key]].join('_')
        current_key = [base_key, cache_body[:key]].join('_')

        previous_file_path = cache.cache_file(previous_key)
        current_file_path = cache.cache_file(current_key)

        raise FileNotFound, "Previous cache file not found: #{previous_file_path}" unless File.exist?(previous_file_path)

        FileUtils.mv(previous_file_path, current_file_path)
      end
    end
  end
end