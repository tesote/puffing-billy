describe Billy::Cache::RecoverPreviousCache do
  let(:base_key) { 'base_key' }
  let(:output_file_path) { './tmp/cache_output_file' }
  let(:input_file_path) { './tmp/cache_input_file' }
  let(:cache_body) do
    { key: 'current_cache_body' }
  end
  let(:previous_cache_body) do
    { key: 'previous_cache_body' }
  end

  let(:cache) do
    double('cache').tap do |cache|
      allow(cache).to receive(:cache_file).with("base_key_" + previous_cache_body[:key])
                                          .and_return(input_file_path)

      allow(cache).to receive(:cache_file).with("base_key_" + cache_body[:key])
                                          .and_return(output_file_path)
    end
  end

  subject do
    described_class.new(cache, base_key, cache_body, previous_cache_body)
  end

  context 'valid previous cache' do
    before do
      FileUtils.touch(input_file_path)
    end

    after do
      FileUtils.rm(output_file_path) if File.exist?(output_file_path)
      FileUtils.rm(input_file_path) if File.exist?(input_file_path)
    end

    it 'should recover previous cache' do
      expect(subject.recover!)

      expect(File.exist?(output_file_path)).to be_truthy
    end
  end

  context 'invalid previous cache' do
    it 'throw error' do
      expect do
        expect(subject.recover!)

      end.to raise_error(Billy::Cache::RecoverPreviousCache::FileNotFound)

      expect(File.exist?(output_file_path)).to be_falsey
    end
  end
end