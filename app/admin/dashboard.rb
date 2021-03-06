ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Un Remariage, ça ne se refuse pas !"
        small "Aujourd'hui, #{Guest.sum(:nb_people)} inscrits"
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
    columns do
      column do
        panel "DINER VENDREDI (#{Guest.where(friday_dinner: true).sum(:nb_people)} personnes)" do
          
          ul do
            Guest.where(friday_dinner: true).map do |guest|
              li link_to(guest.name, admin_guest_path(guest))
            end
          end
        end
      end
      column do
        panel "DEJEUNER SAMEDI (#{Guest.where(saturday_lunch: true).sum(:nb_people)} personnes)" do
          
          ul do
            Guest.where(saturday_lunch: true).map do |guest|
              li link_to(guest.name, admin_guest_path(guest))
            end
          end
        end
      end
      column do
        panel "DEJEUNER DIMANCHE (#{Guest.where(sunday_lunch: true).sum(:nb_people)} personnes)" do
          
          ul do
            Guest.where(sunday_lunch: true).map do |guest|
              li link_to(guest.name, admin_guest_path(guest))
            end
          end
        end
      end
      column do
        panel "DINER DIMANCHE (#{Guest.where(sunday_dinner: true).sum(:nb_people)} personnes)" do
          
          ul do
            Guest.where(sunday_dinner: true).map do |guest|
              li link_to(guest.name, admin_guest_path(guest))
            end
          end
        end
      end
    end
    columns do
      column do
        Guest::TRAIN_ARRIVALS.each do |train|
          guests = Guest.where(arriving: train[1])
          if guests.any? 
            panel "GARE DE MARMANDE : #{train[0]} (#{guests.sum(:nb_people)})" do
              guests.map do |guest|
                ul do
                  li link_to(guest.name, admin_guest_path(guest))
                end
              end
            end
          end
        end
      end
      Guest::CAR_ARRIVALS.each do |car|
        guests = Guest.where(arriving: car[1])
        if guests.any? 
          column do
            panel "EN VOITURE : #{car[0]} (#{guests.sum(:nb_people)})" do
              guests.map do |guest|
                ul do
                  li link_to(guest.name, admin_guest_path(guest))
                end
              end
            end
          end
        end
      end
    end
    columns do
      column do
        Guest::TRAIN_DEPARTURES.each do |train|
          guests = Guest.where(departing: train[1])
          if guests.any? 
            panel "GARE DE MARMANDE : #{train[0]} (#{guests.sum(:nb_people)})" do
              guests.map do |guest|
                ul do
                  li link_to(guest.name, admin_guest_path(guest))
                end
              end
            end
          end
        end
      end
      Guest::CAR_DEPARTURES.each do |car|
        guests = Guest.where(departing: car[1])
        if guests.any? 
          column do
            panel "EN VOITURE : #{car[0]} (#{guests.sum(:nb_people)})" do
              guests.map do |guest|
                ul do
                  li link_to(guest.name, admin_guest_path(guest))
                end
              end
            end
          end
        end
      end
    end
            
        
  end # content
end
