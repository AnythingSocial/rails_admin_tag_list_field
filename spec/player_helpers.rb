module PlayerHelpers
  def create_player_and_get_edit_page
    player = Player.create(:name => 'Pall')
    get edit_path(:model_name => 'players', :id => player.id)
  end
  
  def get_new_player_page
    get new_path(:model_name => 'players')
  end
  
end
