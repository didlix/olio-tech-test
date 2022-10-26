# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Articles', type: :feature do
  let(:existing_articles) do
    [
      instance_double('Article', title: 'hello world', id: 42),
      instance_double('Article', title: 'hello sky', id: 1337)
    ]
  end

  before do
    allow(ArticlesService).to receive(:all).and_return(existing_articles)
  end

  describe 'Viewing Articles' do
    subject(:visit_articles_page) do
      visit(articles_path)
    end

    before { visit_articles_page }

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
