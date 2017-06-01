RailsAdmin.config do |config|
  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

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

  config.main_app_name = ["Administrador", ""]

  config.model User do
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

  # config.model UserCompanyType do

  #   object_label_method do
  #     :full_description
  #   end
  # end

  # config.model Company do
  #   object_label_method do
  #     :title
  #   end

  #   create do
  #     field :title
  #     field :description

  #     field :current_user, :hidden do
  #       default_value do
  #         bindings[:view]._current_user.id
  #       end
  #     end
  #   end
  # end

  config.model Company do
    weight -10
  end

  config.model User do
    weight -9
  end

  config.model UserCompanyType do
    weight -8
  end

  config.model UserType do
    weight -7
  end

  config.model Event do
    weight -6
  end

  config.model EventCategory do
    weight -5
  end

  config.model EventType do
    weight -4
  end

  config.model Invitation do
    weight -3
  end

  config.model InvitationType do
    weight -2
  end

  config.model Country do
    weight -1
  end

  config.model State do
    weight 0
  end

  config.model City do
    weight 0
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
