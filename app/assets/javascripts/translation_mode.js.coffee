getSelected = () ->
  range = window.getSelection()
  range.toString()

jQuery( () ->

  $(".translatable").contextMenu(
    {menu: "selectableMenu"}, 
    (action, el, pos) ->
      selected = getSelected()
      if action == "google"
        window.open("http://google.com/search?btnG=1&pws=0&q=" + selected)
      if action == "wadoku"
        window.open("http://wadoku.eu/search/index?search=" + selected)
      if action == "edit"
        window.location = "http://#{window.location.host}/translations/new?source_lang=#{selected}"
    ,
    (menu) ->
      header = "[" + getSelected() + "]"
      menu.find(".header").text(header)
      menu.find(".edit").text("Add #{getSelected()}")
  )

  $(".translated").contextMenu(
    {menu: "selectableMenu"}, 
    (action, el, pos) ->
      translation = el.data("translation")
      selected = el.text()
      if action == "google"
        window.open("http://google.com/search?btnG=1&pws=0&q=" + selected)
      if action == "wadoku"
        window.open("http://wadoku.eu/search/index?search=" + selected)
      if action == "edit"
        new_text = $("#comment_body").text() + translation
        $("#comment_body").text(new_text)
    ,
    (menu, el) ->
      selected = el.text()
      translation = el.data("translation")
      header = "[#{selected}]"
      menu.find(".header").text(header)
      menu.find(".edit").text("D: #{translation}")
  )


)
