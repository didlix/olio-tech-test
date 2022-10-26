# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ArticleLikes', type: :request do
  describe 'POST' do
    subject(:create_article_like) do
      post(article_likes_path, params: { article_id: article_id })
    end

    let(:article_id) { 42 }

    it 'creates an ArticleLike record' do
      expect {
        create_article_like
      }.to(
        change { ArticleLike.where(article_id: article_id).count }.by(1)
      )
    end

    it 'redirects the user back to the articles page' do
      expect(
        create_article_like
      ).to(
        redirect_to(articles_path)
      )
    end
  end
end
