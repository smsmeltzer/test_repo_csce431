class AuthorController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]

    def index
        @author = Author.all
      end
    
      def show
      end
    
      def new
        @author = Author.new
      end
    
      def edit
      end
    
      def create
        @author = Author.new(auth_params)
    
        respond_to do |format|
          if @author.save
            format.html { redirect_to author_url(@author), notice: "Author was successfully created." }
            format.json { render :show, status: :created, location: @author }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @author.errors, status: :unprocessable_entity }
          end
        end
      end
    
      def update
        respond_to do |format|
          if @author.update(auth_params)
            format.html { redirect_to author_url(@author), notice: "Author was successfully updated." }
            format.json { render :show, status: :ok, location: @author }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @author.errors, status: :unprocessable_entity }
          end
        end
      end
    
      def destroy
        @author.destroy
    
        respond_to do |format|
          format.html { redirect_to author_url, notice: "Author was successfully destroyed." }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_author
          @author = Author.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def author_params
          params.require(:author).permit(:name)
        end
    end