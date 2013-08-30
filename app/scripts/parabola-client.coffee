$(document).ready () ->
  choc = window.choc

  parabola = """
    var shift = 0;
    while (shift <= 200) {
      pad.makeLine(shift, 0, 200, shift);
      shift += 14;
    }
  """

  pad = new Two({
    width: 200
    height: 200
    type: Two.Types.canvas
    })
    .appendTo(document.getElementById('targetcanvas'))

  # enable retina
  if window.devicePixelRatio == 2
    canvas = pad.renderer.domElement
    canvas.setAttribute('width', canvas.width*2)
    canvas.setAttribute('height', canvas.height*2)
    pad.renderer.ctx.scale(2, 2)

  editor = new choc.Editor({
    $: $
    code: parabola
    beforeScrub: () -> pad.clear()
    afterScrub: () ->  pad.update()
    locals: { pad: pad }
    })

  editor.start()

