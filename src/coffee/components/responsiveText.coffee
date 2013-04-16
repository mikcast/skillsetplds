###
 * Requires jquery.responsiveText.js
###
$ ->
  # responsive text
  $('.responsive').not('table').each (index, object) ->
    compression = 10
    min = 10
    max = 200
    scrollTime = 650
    scrollReset = 200

    compression = parseFloat $(this).attr('data-compression') || compression
    min = parseFloat $(this).attr('data-min') || min
    max = parseFloat $(this).attr('data-max') || max

    $(object).responsiveText
      compressor: compression,
      minSize: min,
      maxSize: max

    $this = $(this)
    $(this).hover (->
      difference = $this.get(0).scrollWidth - $this.width()
      console.log difference
      if difference > 0
        $this.stop().animate
          "text-indent": -difference
        , scrollTime
    ), ->
      $this.stop().animate
        "text-indent": 0
      , scrollReset