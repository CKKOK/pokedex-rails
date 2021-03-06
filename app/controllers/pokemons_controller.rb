class PokemonsController < ApplicationController
    def index
        @pokemons = Pokemon.all
    end

    def show
        @pokemon = Pokemon.find(params[:id])
    end

    def new
        @pokemon = Pokemon.new
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)

        if @pokemon.save
            redirect_to @pokemon
        else
            render 'new'
        end
    end

    def edit
        @pokemon = Pokemon.find(params[:id])
    end

    def update
        @pokemon = Pokemon.find(params[:id])

        if @pokemon.update(pokemon_params)
            redirect_to @pokemon
        else
            render 'edit'
        end
    end

    def destroy
        @pokemon = Pokemon.find(params[:id])
        @pokemon.destroy
        redirect_to '/'
    end

    private

    def pokemon_params
        params.require(:pokemon).permit(:num, :name, :img, :height, :weight, :candy, :candy_count, :egg, :avg_spawns, :spawn_time)
    end
end