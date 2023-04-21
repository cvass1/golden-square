require 'menu'

RSpec.describe Menu do
  context "when no dishes have been added to the menu: " do
    it "returns an error for #display_menu" do
      menu = Menu.new
      expect{menu.display_menu}.to raise_error "No dishes have been added to the menu"
    end

    it "returns an error for #menu_item" do
      menu = Menu.new
      expect{menu.menu_item(1)}.to raise_error "No dishes have been added to the menu"
    end
  end

  
end