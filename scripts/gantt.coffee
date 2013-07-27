define ["./bar", "../sample"], (Bar, data) ->
  class Gantt

    constructor: ->
      g = $("<div class=gantt></div>").appendTo($("body"))
      c = $("<div class=chart></div>").appendTo(g)
      for task, data of data.tasks
        new Bar(data, $("<div>").appendTo(c), task, 0)

  new Gantt()