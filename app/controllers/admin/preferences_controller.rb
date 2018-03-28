require 'pry'
class Admin::PreferencesController < ApplicationController

  def index
    @preferences = Preference.all
  end

  def show
    @preference = Preference.find(params[:id])
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preference_params)
    if @preference.save
      redirect_to admin_preference_path(@preference), alert: "Preferences successfully saved."
    else
      redirect_to new_admin_preference_path, alert: "All fields must be completed."
    end
  end

  def edit
    @preference = Preference.find_by(id: params[:id])
  end

  def update
    @preference = Preference.find_by(id: params[:id])
    @preference.update(preference_params)
    if @preference.save
      redirect_to admin_preference_path(@preference), alert: "Succesfully updated."
    else
      redirect_to edit_admin_preference_path, alert: "All fields must be completed."
    end
  end

  def destroy
    @preference = Preference.find_by(id: params[:id])
    @preference.destroy
    flash[:notice] = "Preference deleted."
    redirect_to admin_preferences_path
  end

  private
    def preference_params
      params.require(:preference).permit(:artist_sort_order, :song_sort_order, :allow_create_artists, :allow_create_songs)
    end
end
