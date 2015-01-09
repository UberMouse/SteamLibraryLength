module Steam
  class Game < Struct.new(:appid, :name, :playtime_forever, :display_img_url)
  end 
end
