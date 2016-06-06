# delay.coffee
window.delays = {}
window.delay = (key, callback, timeout = 1000)->
  if delays[key]
    clearTimeout(delays[key])
  delays[key] = setTimeout(callback, timeout)