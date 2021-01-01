PagesPolicy = Struct.new(:user, :pages) do
  # All users can visit /home
  def home?
    true
  end
end