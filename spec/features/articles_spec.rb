# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Articles', type: :feature do
  describe 'Viewing Articles' do
    subject(:visit_articles_page) do
      visit(articles_path)
    end

    let(:existing_articles) do
      [
        instance_double('Article', title: 'hello world'),
        instance_double('Article', title: 'hello sky')
      ]
    end

    before do
      allow(ArticlesService).to receive(:all).and_return(existing_articles)
      visit_articles_page
    end

    it 'displays all articles on the articles page' do
      expect(page).to have_content('hello world')
    end

    context 'when no articles are returned from the ArticlesService' do
      let(:existing_articles) { [] }

      it 'tells the user that no articles were found' do
        expect(page).to have_content('No articles were found')
      end
    end
  end
end
