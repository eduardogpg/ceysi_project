class ProductMailer < ApplicationMailer
    default from: ENV['gmail_username']

    def stock(user, product)
        @user = user
        @product = product
        mail(to: @user.email, subject: 'Producto bajo de inventario')
    end

end
