class ProductMailer < ApplicationMailer
    default from: ENV['gmail_username']

    def stock(user, product)
        @user = user

        puts "\n\n\n"
        puts "El correo del usuario es:"
        puts user.email
        puts "\n\n\n"

        @product = product
        mail(to: @user.email, subject: 'Producto bajo de inventario')
    end

end
