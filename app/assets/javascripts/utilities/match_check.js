document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('.password')
  var confirmation = document.querySelector('.confirmation')

  if (password && confirmation) {
  password.addEventListener('keyup', checkMatching)
  confirmation.addEventListener('keyup', checkMatching)
  }
})

function checkMatching() {
  if (document.getElementById('user_password').value ==
    document.getElementById('user_password_confirmation').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
    }
}

