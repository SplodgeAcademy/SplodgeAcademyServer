class SearchController < ApplicationController
    def index
        @query = Writing.ransack(params[:q])
        @writings = @query.result(distinct: true)
    end
end
