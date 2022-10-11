class ListsController < ApplicationController

    #スケジュール一覧表示
    def index
        @lists = List.all
        @count = List.all.count
    end

    #スケジュール詳細表示
    def show
        @list = List.find(params[:id])
    end 

    #スケジュール新規作成
    def new
        @list = List.new
    end

    #スケジュール登録
    def create
        #listモデルを初期化
        #@list = List.new(list_params)
        @list = List.new(params.require(:list).permit(:title, :start_day, :end_day, :all_day, :memo))
        #listモデルをDBに保存#showへリダイレクト
        if @list.save
            flash[:notice] = "スケジュールを新規登録しました"
            redirect_to :lists
        else
            render"new"
        end
    end

    #スケジュール編集
    def edit
        @list = List.find(params[:id])
    end

    #スケジュール更新
    def update
        @list = List.find(params[:id])
        if @list.update(params.require(:list).permit(:title, :start_day, :end_day, :all_day, :memo))
            flash[:notice] = "ユーザーIDが「#{@list.id}」の情報を更新しました"
            redirect_to :lists
        else
            render "edit"
        end
    end

    #スケジュール削除
    def destroy
        @list = List.find(params[:id])
        @list.destroy
        flash[:notice] = "スケジュールを削除しました"
        redirect_to :lists
    end

    private
    def list_params
        params.require(:list).permit(:title, :start_day, :end_day, :all_day, :memo)
    end

end
