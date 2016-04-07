require "rails_helper"

RSpec.describe "CRUD-ing Teams", type: :feature, selenium: true  do
  
  let!(:secret)   { FactoryGirl.create :team }
  let!(:eg)       { FactoryGirl.create :team, name: "EG", country: "US" }

  before do
    visit teams_path
  end

  scenario "Editing of a team" do
    within "tbody tr:first-child" do
      click_link "Edit Team"
    end

    form_input("Update Team")

    within "table" do
      expect(page).to have_content "Vici Gaming" 
      expect(page).to have_no_content "Team Secret"
    end

    expect(page).to have_content "Yay! Successfully edited this team"
  end

  scenario "Deleting of a team" do
    within "tbody tr:first-child" do
      click_link "Delete Team"
    end

    within "table" do
      expect(page).to have_no_content "Team Secret"
    end

    expect(page).to have_content "Nooo! Successfully deleted this team"
  end
    
  scenario "Showing all of the teams" do
    within "table" do
      expect(page).to have_content secret.name
      expect(page).to have_content secret.country
    end

    click_link "New Team?"

    form_input

    within "table" do
      expect(page).to have_content "Vici Gaming"
    end
    expect(page).to have_content "Yay! Successfully created this team"
  end

  def form_input(button = "Create Team")
    within "form" do
      fill_in "team_name", with: "Vici Gaming"
      fill_in "team_description", with: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      fill_in "team_country", with: "China"
      attach_file("team_logo", Rails.root.to_s + "/spec/files/test.jpg")

      click_button button
    end
  end
end
