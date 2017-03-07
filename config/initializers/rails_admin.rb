RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
# 
  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.main_app_name = ["Admin", "Gerenciamento de Eventos"]

  config.model User do
    navigation_icon 'fa fa-user'
    edit do
      field :name
      field :email

      field :token, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end

  config.model UserCompanyType do

    object_label_method do
      :full_description
    end
  end

  config.model Company do

    navigation_icon 'fa fa-users'
    
    object_label_method do
      :title
    end
   
    create do
      field :title
      field :description
      
      field :current_user, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end

  config.model Company do
    weight -8
  end

  config.model User do
    parent Company
    weight -9
  end

  config.model UserCompanyType do
    parent User
    weight -7
  end

  config.model UserType do
    parent User
    weight -6
  end

  config.model Event do
    navigation_icon "fa fa-calendar-o"
    parent Company
    weight -5
  end

  config.model EventCategory do
    parent Event
    weight -6
  end

  config.model EventType do
    parent Event
    weight -5
  end

  config.model Invitation do
    navigation_icon "fa fa-ticket"
    parent Event
    weight -4
  end

  config.model InvitationType do
    parent Invitation
    weight -4
  end

  config.model Country do
    navigation_icon "fa fa-map"
    parent Event
    weight -2
  end

  config.model State do
    parent Country
    weight -3
  end

  config.model City do
    parent Country
    weight -2
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end
end
