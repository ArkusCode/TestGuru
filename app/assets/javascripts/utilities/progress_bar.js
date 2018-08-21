document.addEventListener('turbolinks:load', function() {
  var progressbar = document.querySelector('.progress-bar')

  if (progressbar) {
    var width = progressbar.dataset.width
    moveProgressBar(width)
  }
})

function moveProgressBar(width) {
  document.querySelector('.progress-bar').style.width = width + '%'
}
