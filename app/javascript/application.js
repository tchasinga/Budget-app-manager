// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", (event) => {

    try {
        let secondButton = document.getElementById('backe')

        secondButton.addEventListener('click' , () => {
            window.history.back()
       })
    } catch (error) {
        console.log()
    }
  });
