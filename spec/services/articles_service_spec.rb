# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesService do
  describe 'self#all' do
    subject(:fetched_articles) { described_class.all }

    let(:expected_titles) do
      [
        'Ambipur air freshener plugin',
        'Epson Stylus Printer Cartridges'
      ]
    end

    let(:faraday_response_double) do
      instance_double('Faraday::Response', body: faraday_response_body)
    end

    let(:faraday_response_body) do
      <<~JSON
        [
          {
            "title": "Ambipur air freshener plugin"
          },
          {
            "title": "Epson Stylus Printer Cartridges"
          }
        ]
      JSON
    end

    before do
      allow(Faraday).to receive(:get).and_return(faraday_response_double)
      allow(faraday_response_double).to(
        receive(:body).and_return(faraday_response_body)
      )
    end

    it 'returns an array of articles' do
      expect(fetched_articles).to all(be_a(Article))
    end

    it 'fetches all of the articles from the API' do
      titles = fetched_articles.map(&:title)

      expect(expected_titles).to match_array(titles)
    end
  end
end
