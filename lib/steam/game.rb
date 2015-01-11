module Steam
  class Game < Struct.new(:app_id, :name, :playtime_forever, :display_img_url)
  end 
end
