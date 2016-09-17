class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  def index
    @pages = Page.all
    render json: @pages
  end

  def show
    render json: @page
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      render json: @page, status: :created, location: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:url, :content)
    end
end
