class Storytime.Dashboard.Blogs
  initNew: ()->
    $(document).on('ajax:success', '.new-blog-form', (e, data, status, xhr) ->
      unless $(e.target).hasClass("storytime-modal-trigger")
        $("#blogs").html(data.html)
        $("#storytime-modal").modal("hide")
    )

  initEdit: ()->

  initCreate: ()->

  initUpdate: ()->