require 'rails_helper'
TestKeys = YAML.load_file("#{Rails.root.to_s}/config/secrets.yml")

feature "translation" do  

  scenario "language with EN is English" do
    visit "/en"
    expect(page).to have_text("New report")
  end
  
  scenario "language with FR is French" do
    visit "/fr"
    expect(page).to have_text("Nouveau rapport")
  end

  scenario "form in English" do
    page.driver.browser.authorize TestKeys['username'], TestKeys['password']
    visit "/en/reports/new"
    expect(page).to have_text("User name")
  end

end
