require_relative "../../app.rb"

feature 'displaying hit points' do
  scenario "Opponent hit point" do
    sign_in_and_play
      expect(page).to have_content "100 HP"
  end
end

feature 'attack reduces hit points' do
  scenario "attacking player reduces the hit points by ten" do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "Lewis was attacked!"
  end

  scenario "attacking player switches turns" do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Attack'
    expect(page).to have_content "Gabriela was attacked!"
  end

  scenario "player two loses" do
    sign_in_and_play
    19.times { click_button 'Attack' }
    expect(page).to have_content "Lewis died!"
  end
end
