# app/assets/javascripts/utils.coffee

@amountFormat = (amount) ->
  Number(amount).toLocaleString()

@toggleActiveTab = () ->
  $('.nav-link').toggleClass('active');

@getExpenseCategoryIcon = (categoryCode) ->
  icon_class = 'fa fa-fw '
  if categoryCode == 'bills'
    icon_class += 'fa-money'
  else if categoryCode == 'groceries'
    icon_class += 'fa-shopping-basket'
  else if categoryCode == 'clothesAndShoes'
    icon_class += 'fa-tags'
  else if categoryCode == 'gasAndTransportation'
    icon_class += 'fa-subway'
  else if categoryCode == 'restaurants'
    icon_class += 'fa-cutlery'
  else if categoryCode == 'health'
    icon_class += 'fa-medkit'
  else if categoryCode == 'travel'
    icon_class += 'fa-plane'
  else if categoryCode == 'other'
    icon_class += 'fa-cubes'

  return icon_class
