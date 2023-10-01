class UsersController < ApplicationController
  before_action :set_user, only: [:likes]

  def show
    user = User.find(params[:id])
  end