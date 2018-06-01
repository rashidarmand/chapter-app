class ReadController < ApplicationController
    def index
        @chapters = Chapter.paginate(:page => params[:page], :per_page => 1)
    end

end
