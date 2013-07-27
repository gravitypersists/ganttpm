define [], () ->
  tpl = """
  <% var fills = {"PersonA":"#E1004C", "PersonB":"#FF8C00", "PersonC":"#0969A2", "PersonD":"#70E500"}; %>
  <% var i = 0 %>
  <% var n = _.size(data) %>

  <div class="bar depth_<%=depth%> <% if (!expandable){ print('atomic-task') }%>">
    <div class="task">
      <span class="task-title task-title-<%=depth%>" style="margin-left:<%= depth*20 %>px;">
        <% if (expandable) { %>
          <span class="expand">[+]</span>
        <% } %>
        <%= name %>
      </span>
    </div>
    <svg width="1000px" height="62px">
      <% _.each(data, function(times, person){
        _.each(times, function(time) {
          var j = time[0];
          while (j<time[1]) {
            var j2 = Math.min(j+10-j%10, time[1]); %>
            <rect
              width="<%= (j2-j)*10 %>px"
              height="<%= 60/n %>px"
              x = "<%= j*10 %>px"
              y = "<%= 2+i*60/n %>px"
              rx = "2px" ry="2px"
              style="fill:<%= fills[person] %>;"
            />
            <% j=j2; %>
          <% } %>
        <% }); %>
        <% i++; %>
      <% }); %>
    </svg>
    <div class="children"></div>
  </div>
  """

  class Bar extends Backbone.View

    initialize: (data, el, taskname, @depth) ->
      @$el = $(el)
      @bars = []
      @data = data
      @taskname = taskname # also acts as identifier
      @render(data, taskname)

    render: (data, name) ->
      # aggregate people
      subbars = {}
      for k,v of data
        subbars[k] = v if v instanceof Array
      @$el.html _.template tpl,
        data: subbars, name: name, expandable: _.has(data, "tasks"), depth: @depth
      @$el.find('svg').first().click => @openLayer()
      @$el.find('.expand').first().click => @openLayer()

    collapse: () ->
      @showing = false
      @$el.find('.expand').first().text("[+]")
      for bar in @bars
        bar.$el.hide()

    show: () ->
      @showing = true
      @$el.find('.expand').first().text("[-]")
      for bar in @bars
        bar.$el.show()

    toggle: () ->
      if @showing then @collapse() else @show()

    openLayer: () ->
      return unless _.size(@data.tasks) > 0
      if @bars.length
        @toggle()
      else
        for task, data of @data.tasks
          @bars.push new Bar(data, $("<div>").appendTo(@$('.children').first()), task, @depth+1)
        @show()