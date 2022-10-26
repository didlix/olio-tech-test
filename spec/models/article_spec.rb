# frozen_string_literal: true

require 'rails_helper'

describe Article do
  subject(:article) { described_class.new(assigned_attributes) }

  let(:assigned_attributes) do
    { id: 42, title: 'Three little birds' }
  end

  describe '#title' do
    it 'assigns the title from a hash of attributes' do
      expect(article.title).to eq(assigned_attributes[:title])
    end
  end

  describe '#id' do
    it 'assigns the id from a hash of attributes' do
      expect(article.id).to eq(assigned_attributes[:id])
    end
  end
end
