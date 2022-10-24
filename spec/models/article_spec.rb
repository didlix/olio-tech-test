# frozen_string_literal: true

require 'rails_helper'

describe Article do
  describe '#title' do
    subject(:article) { described_class.new(assigned_attributes) }

    let(:assigned_attributes) do
      { title: 'Three little birds' }
    end

    it 'assigns the title from a hash' do
      expect(article.title).to eq(assigned_attributes[:title])
    end
  end
end
