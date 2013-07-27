Fabricator(:price_quote) do
  #user            { Fabricate(:user) } 
  request         { Fabricate(:request) } 
  price           1.5
  hours_estimated 1.5
end
