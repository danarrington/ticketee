require 'spec_helper'

feature "Creating Tickets" do
   before do
      FactoryGirl.create(:project, name: "Internet Explorer")

      visit "/"
      click_link "Internet Explorer"
      click_link "New Ticket"
   end

   scenario "Creating a ticket" do
      fill_in "Title", with: "Auto Updating"
      fill_in "Description", with: "It doesn't work"
      click_button "Create Ticket"

      expect(page).to have_content("Ticket has been created.")
   end
   
   scenario "Creating a ticket without valid attributes fails" do
      click_button "Create Ticket"
      expect(page).to have_content("Ticket has not been created.")
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Description can't be blank")
   end

   scenario "Description must be longer than 10 characters" do
      fill_in "Title", with: "A Title"
      fill_in "Description", with: "Too Short"
      click_button "Create Ticket"

      expect(page).to have_content("Ticket has not been created.")
      expect(page).to have_content("Description is too short")
   end
end


