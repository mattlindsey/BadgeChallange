class CompanyDecorator < RKit::Decorator::Base
  def infos
    "#{ self } - badges"
  end
end
