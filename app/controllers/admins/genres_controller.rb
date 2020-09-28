class Admins::GenresController < Admins::Base
	def create
		@genre = Genre.new(genre_params)
		@genres = Genre.all
		if @genre.save
			redirect_to admins_genres_path, notice: 'ジャンルを追加しました'
		else
			render "index"
		end
	end

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			redirect_to admins_genres_path, notice: 'ジャンルを修正しました'
		else
			render "edit"
		end
	end

	private
	def genre_params
		 params.require(:genre).permit(:name, :is_active)
		end
end
