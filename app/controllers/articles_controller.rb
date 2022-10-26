# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = ArticlesService.all
  end
end
