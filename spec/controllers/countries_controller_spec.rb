require 'rails_helper'

RSpec.describe CountriesController, type: :controller do

  describe "GET #index" do
    let(:my_countries){ FactoryGirl.create_list(:country, 10) }

    before(:each) do
      get :index
    end

    it "assigns all countries as @countries" do
      expect(assigns(:countries)).to eq(my_countries)
    end

    it 'assigns countries list not be nil' do
      expect(assigns[:countries]).not_to be_nil
    end

    it 'assigns countries not be empty' do
      Country.create(name: 'Brasil', initials: 'BRA')
      expect(assigns[:countries]).not_to be_empty
    end
  end
end