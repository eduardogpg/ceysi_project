class MainController < ApplicationController
    before_action :authorized, only: [:home]

    def home
    end
    
end
  