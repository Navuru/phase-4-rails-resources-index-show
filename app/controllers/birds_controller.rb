class BirdsController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        birds = Bird.all
        render json: birds
    end

    def show
        bird =find_bird
        if bird
            render json: bird
        else
            render json: {error: "Bird not found"}, status: :not_found
        end
    end

    def create
        bird = Bird.create(bird_params)
        render json: bird, status: :created
    end

    def update
        bird = find_bird
            bird.update(bird_params)
            render json: bird
    end

    def increment_likes
        bird = find_bird
          bird.update(likes: bird.likes + 1)
          render json: bird
      end

      def destroy
        bird = find_bird
            bird.destroy
            # head :no_content
            render json: {}
      end

    private
    def bird_params
        params.permit(:name, :species, :likes)
    end

    def render_not_found_response
        render json: { error: "Bird not found" }, status: :not_found
    end
    
    def find_bird
        Bird.find_by(id: params[:id])
    end
end
