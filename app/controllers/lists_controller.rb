class ListsController < ApplicationController

    def index
        @lists = List.all
    end

    def show
        @list = List.find(params[:id])
    end

    def new
        @list = List.new
        @list.gifts.build
    end

    def edit
        @list = List.find(params[:id])
    end

    def create
        @list = List.new(list_params)
 
        if @list.save
            redirect_to @list
        else
            render 'new'
        end
    end

    def update
        @list = List.find(params[:id])
       
        if @list.update(list_params)
          redirect_to @list
        else
          render 'edit'
        end
    end

    def destroy
        @list = List.find(params[:id])
        @list.destroy
       
        redirect_to lists_path
    end

    def available_gifts
        @pagy, @available_gifts = pagy(Gift.all, page: params[:page], items: 1)
    end

    private
        def list_params
            params.require(:list).permit(:title, :text, gift_ids: [])
        end
end
