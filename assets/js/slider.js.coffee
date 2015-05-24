min_panel_height = window.min_panel_height
footer_size = window.footer_size
resize_handle = null
max_panels = null
allow_scroll = true
height = ->
  $(window).height()
active_panel = 0
can_slide = ->
  height() > min_panel_height

num_scroll = 1
be = "/be/try_free/send_form.json"
#be = "http://127.0.0.1:3000/try_free/send_form.json"
getToken = '/be/get_token.json'
download = '/be/download.json'
signUp = "http://my.intouch-xpress.ru/users/sign_in?user[email]="
#signIn = "http://my.intouch-xpress.ru/users/sign_in"
#signIn = "http://127.0.0.1:3000/services/ajax_sign_in"
forgot = "http://my.intouch-xpress.ru/users/password/new?user[email]="
mailHash = {'0-mail.com': true, '0clickemail.com': true, '2prong.com': true, '3d-painting.com': true, '4warding.com': true, '4warding.net': true, '4warding.org': true, '10minutemail.com': true, '20minutemail.com': true, '30minutemail.com': true, '60minutemail.com': true, '0815.ru': true, 'amilegit.com': true, 'anonbox.net': true, 'anonymbox.com': true, 'antispam.de': true, 'beefmilk.com': true, 'binkmail.com': true, 'bio-muesli.net': true, 'bobmail.info': true, 'bofthew.com': true, 'brefmail.com': true, 'bsnow.net': true, 'bugmenot.com': true, 'bumpymail.com': true, 'cosmorph.com': true, 'courrieltemporaire.com': true, 'cubiclink.com': true, 'curryworld.de': true, 'cust.in': true, 'dacoolest.com': true, 'dandikmail.com': true, 'dayrep.com': true, 'deadaddress.com': true, 'despam.it': true, 'devnullmail.com': true, 'discardmail.com': true, 'discardmail.de': true, 'disposemail.com': true, 'dispostable.com': true, 'dodgeit.com': true, 'dodgit.com': true, 'dodgit.org': true, 'doiea.com': true, 'donemail.ru': true, 'dontreg.com': true, 'dontsendmespam.de': true, 'dump-email.info': true, 'dumpyemail.com': true, 'e4ward.com': true, 'email60.com': true, 'emailigo.de': true, 'emailinfive.com': true, 'emailmiser.com': true, 'emailsensei.com': true, 'emailtemporario.com.br': true, 'emailwarden.com': true, 'emailx.at.hm': true, 'evopo.com': true, 'fakeinbox.com': true, 'fakeinformation.com': true, 'fastacura.com': true, 'filzmail.com': true, 'fizmail.com': true, 'fr33mail.info': true, 'get1mail.com': true, 'get2mail.fr': true, 'getonemail.com': true, 'getonemail.net': true, 'gishpuppy.com': true, 'great-host.in': true, 'guerillamail.com': true, 'guerrillamail.com': true, 'guerrillamailblock.com': true, 'h.mintemail.com': true, 'haltospam.com': true, 'hochsitze.com': true, 'hotpop.com': true, 'hulapla.de': true, 'ieatspam.eu': true, 'ieatspam.info': true, 'ieh-mail.de': true, 'imails.info': true, 'incognitomail.com': true, 'incognitomail.net': true, 'incognitomail.org': true, 'insorg-mail.info': true, 'ipoo.org': true, 'jetable.com': true, 'jetable.net': true, 'jetable.org': true, 'jnxjn.com': true, 'junk1e.com': true, 'keepmymail.com': true, 'kir.ch.tc': true, 'klzlk.com': true, 'kulturbetrieb.info': true, 'lhsdv.com': true, 'litedrop.com': true, 'lol.ovpn.to': true, 'lookugly.com': true, 'lopl.co.cc': true, 'm4ilweb.info': true, 'mail4trash.com': true, 'mail-temporaire.fr': true, 'mail.by': true, 'mailcatch.com': true, 'maileater.com': true, 'mailexpire.com': true, 'mailin8r.com': true, 'mailinator2.com': true, 'mailinator.com': true, 'mailinator.net': true, 'mailismagic.com': true, 'mailme.ir': true, 'mailme.lv': true, 'mailmetrash.com': true, 'mailnator.com': true, 'mailnesia.com': true, 'mailnull.com': true, 'mailslite.com': true, 'mailtemp.info': true, 'mailzilla.org': true, 'mbx.cc': true, 'meltmail.com': true, 'messagebeamer.de': true, 'mierdamail.com': true, 'mintemail.com': true, 'moburl.com': true, 'monemail.fr.nf': true, 'msa.minsmail.com': true, 'mt2009.com': true, 'mypartyclip.de': true, 'myphantomemail.com': true, 'mytrashmail.com': true, 'nepwk.com': true, 'no-spam.ws': true, 'nobulk.com': true, 'noclickemail.com': true, 'nogmailspam.info': true, 'nomail2me.com': true, 'nomorespamemails.com': true, 'nospam4.us': true, 'nospamfor.us': true, 'nospamthanks.info': true, 'notmailinator.com': true, 'nowmymail.com': true, 'nus.edu.sg': true, 'nwldx.com': true, 'onewaymail.com': true, 'online.ms': true, 'opayq.com': true, 'ovpn.to': true, 'owlpic.com': true, 'pjjkp.com': true, 'politikerclub.de': true, 'pookmail.com': true, 'prtnx.com': true, 'qq.com': true, 'quickinbox.com': true, 'recode.me': true, 'regbypass.com': true, 'rmqkr.net': true, 'rppkn.com': true, 'rtrtr.com': true, 's0ny.net': true, 'safe-mail.net': true, 'safetymail.info': true, 'safetypost.de': true, 'sandelf.de': true, 'saynotospams.com': true, 'selfdestructingmail.com': true, 'sendspamhere.com': true, 'sharklasers.com': true, 'shitmail.me': true, 'skeefmail.com': true, 'slopsbox.com': true, 'smellfear.com': true, 'snakemail.com': true, 'sofimail.com': true, 'sofort-mail.de': true, 'sogetthis.com': true, 'spam.la': true, 'spam.su': true, 'spamavert.com': true, 'spambob.net': true, 'spambob.org': true, 'spambog.com': true, 'spambog.de': true, 'spambog.ru': true, 'spambox.info': true, 'spambox.irishspringrealty.com': true, 'spambox.us': true, 'spamcero.com': true, 'spamday.com': true, 'spamfree24.com': true, 'spamfree24.de': true, 'spamfree24.eu': true, 'spamfree24.info': true, 'spamfree24.net': true, 'spamfree24.org': true, 'spamgourmet.com': true, 'spamherelots.com': true, 'spamhole.com': true, 'spamify.com': true, 'spaminator.de': true, 'spamkill.info': true, 'spaml.com': true, 'spaml.de': true, 'spammotel.com': true, 'spamobox.com': true, 'spamspot.com': true, 'spamthis.co.uk': true, 'spamthisplease.com': true, 'supergreatmail.com': true, 'supermailer.jp': true, 'suremail.info': true, 'teewars.org': true, 'teleworm.com': true, 'teleworm.us': true, 'tempalias.com': true, 'tempe-mail.com': true, 'tempemail.biz': true, 'tempemail.com': true, 'tempemail.net': true, 'tempinbox.co.uk': true, 'tempinbox.com': true, 'tempmail2.com': true, 'tempmail.it': true, 'tempomail.fr': true, 'temporarioemail.com.br': true, 'temporaryemail.net': true, 'temporaryinbox.com': true, 'thanksnospam.info': true, 'thankyou2010.com': true, 'thisisnotmyrealemail.com': true, 'throwawayemailaddress.com': true, 'tmailinator.com': true, 'tradermail.info': true, 'trash2009.com': true, 'trash-amil.com': true, 'trash-mail.com': true, 'trash-mail.de': true, 'trashemail.de': true, 'trashmail.at': true, 'trashmail.com': true, 'trashmail.net': true, 'trashmail.ws': true, 'trashmailer.com': true, 'trashymail.com': true, 'trashymail.net': true, 'trillianpro.com': true, 'tyldd.com': true, 'uggsrock.com': true, 'veryrealemail.com': true, 'webm4il.info': true, 'wegwerfemail.de': true, 'wh4f.org': true, 'whyspam.me': true, 'willselfdestruct.com': true, 'wuzupmail.net': true, 'yopmail.com': true, 'yuurok.com': true, 'zehnminutenmail.de': true, 'zippymail.info': true, 'zoaxe.com': true}

current_panel_index = ->
  Math.min(Math.round($(window).scrollTop() / $(window).height()), max_panels - 1)

correct_panel_height = ->
  if can_slide()
    jQuery("body").css
      width: $(window).width()
      height: $(window).height()

#    $(".panel").not('#panel0').css(
#      height: $(window).height() #- footer_size # - ($(window).height() - min_panel_height) / 2
      #paddingTop: ($(window).height() - min_panel_height) / 2
      #paddingBottom: footer_size
#    ).find(".left-bg, .right-bg, .content").css height: $(window).height()

    $(".panel").css(
      height: $(window).height() # - ($(window).height() - min_panel_height) / 2
      #paddingTop: ($(window).height() - min_panel_height) / 2
    ).find(".left-bg, .right-bg, .content").css height: $(window).height()
    $(".jcarousel-wrapper").css width: $(window).width()
  else
    jQuery("body").css
      width: $(window).width()

toggle_transition = ($button, bottom1, duration, bottom2)->
  $button.toggleClass 'transition'
  $button.stop().animate
    bottom: bottom1
  , duration, 'easeInOutQuad', ->
    $button.toggleClass 'transition'
    $button.removeAttr 'style'
    $button.toggleClass 'active'
  $('.navigation-wrapper').stop().animate
    bottom: bottom2
  , 600, 'easeInOutQuad'
  return

toggle_navigation = ->
  $button = $(".footer-container .btn-shownav")
  $(".navigation-wrapper").toggleClass "active"
  if $button.hasClass 'active'
    toggle_transition($button, '-0.3em', 520, -500)
    $("footer .footer-container .left-footer .icon").fadeIn(duration: 600, easing: "easeInOutQuad")
  else
    toggle_transition($button, 475, 600, 15)
    $('footer .footer-container .left-footer .icon').fadeOut(duration: 600, easing: 'easeInOutQuad')
  #$button.toggleClass "transition"
  #$button.toggleClass "active", 600 #, "easeInOutQuart"#,  () ->
  #  $button.toggleClass "transition"
  false

scroll_to_panel = (panel_no)->
  return unless panel_no >= 0 and panel_no < max_panels
  return unless allow_scroll
  allow_scroll = false
  resize_handle = setTimeout(->
    allow_scroll = true
  , 350)
  if $('body').hasClass 'transition'
    jQuery("html, body").stop(true, false)
  else
    $("body").addClass "transition"
  jQuery("html, body").stop().animate
    scrollTop: $(".panel").eq(panel_no).position().top
  ,
    duration: 900
    easing: "easeOutCirc"
    complete: ->
      $("body").removeClass "transition"
      if $('.footer-container h1').hasClass 'active'
        toggle_navigation()
      return
  return

$(document).bind "mousewheel", (e, delta) ->
  return true if $('.mfp-container').is(':visible')
  if can_slide()
    e.preventDefault()
    panel_no = current_panel_index()
    panel_delta = (if (delta < 0) then 1 else -1)
    scroll_to_panel(panel_no + panel_delta)

$(document).ready ->
  correct_panel_height()
  max_panels = $(".panel").length
  $('footer').css(display: 'none')
  if current_panel_index() > 0
    $('footer').css(display: 'block')
  $(window).resize ->
    clearTimeout resize_handle
    resize_handle = setTimeout(->
      allow_scroll = true
      return unless can_slide()
      correct_panel_height()
      scroll_to_panel active_panel
    , 300)

  $('#city').plaxify
    xRange: 20
    yRange: 20
    invert: true

  $('#clouds').plaxify
    xRange: 20
    yRange: 20

  $('#man').plaxify
    xRange: 40
    yRange: 40

  $.plax.enable()

  $('.down-btn').on 'click', (e)->
    scroll_to_panel current_panel_index() + 1

  $(".footer-container .btn-shownav, .footer-container .btn-shownav-fake").on "click", (e)->
    e.preventDefault()
    toggle_navigation()
    return false

  $("footer .footer-container .left-footer .icon").on "click", ->
    unless $(".footer-container .btn-shownav").hasClass 'active'
      toggle_navigation()
    return false

  $(".top-container").on "click", ->
    if $(".footer-container .btn-shownav").hasClass 'active'
      toggle_navigation()
    return true

  $('.navigation-center a').on 'click', (e) ->
    e.preventDefault()
    toggle_navigation()
    scroll_to_panel $(this).data 'panel'
    return

  # page 2
  jcarousel = $(".jcarousel")
  jcarousel.on("jcarousel:reload jcarousel:create", ->
    min_width = 180
#    max_width = 300
    width = jcarousel.innerWidth()
    num_scroll = Math.max(width/300, 1)
    width = width / num_scroll
    if height()*0.30 < $(window).width()
      console.log width
      width = Math.max(height()*0.3, min_width)

    jcarousel.jcarousel("items").css "width", (width/16) + "em"
    return
  ).jcarousel wrap: "circular", animation:
    duration: 900
    easing: "easeOutCirc"

  $(".jcarousel-control-prev").jcarouselControl target: "-=" + num_scroll/2 + 1
  $(".jcarousel-control-next").jcarouselControl target: "+=" + num_scroll/2 + 1
  $(".jcarousel-pagination").on("jcarouselpagination:active", "a", ->
    $(this).addClass "active"
    return
  ).on("jcarouselpagination:inactive", "a", ->
    $(this).removeClass "active"
    return
  ).on "click", (e) ->
    e.preventDefault()
    return

  $('#try-free .submit').click (e) ->
    e.preventDefault()
    isFieldEmpty = false
    $form = $(this).closest 'form'
    $form.find('input').each ->
      if $(this).val() is ''
        isFieldEmpty = true
        $(this).addClass 'has-error'
      return
    if isFieldEmpty
      return false
      #return alert 'Все поля должны быть заполнены!'
    regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    email = $('#e-mail').val().trim()
    domain = email.replace(/.*@/, '');
    unless regex.test(email)
      unless $('#e-mail').hasClass 'has-error'
        $('#e-mail').addClass 'has-error'
      return false
    if mailHash[domain]
      invalidEmailPopup()
      setPopupCloseCallbacks()
      return false
    $.magnificPopup.open
      items:
        src: '<div class="white-popup-block">Обрабатываем...</div>'
        type: 'inline'
      modal: true
      fixedContentPos: false
      fixedBgPos: false
      prependTo: $(".null")[0]

    $.post(be, $form.serialize(), (msg) ->
      if msg.error
        if msg.error == 'invalid_email'
          invalidEmailPopup()
        else
          $("#try-free-fail .links").hide()
          $('#try-free-fail .error_desc').html 'Произошла ошибка, попробуйте повторить позже!'
          openPopup 'fail'
        setPopupCloseCallbacks()
        return
      if msg.status == 'exists'
        $("#try-free-fail .links").show()
        $("#try-free-fail .forgot").attr("href", forgot + msg.email)
        $("#try-free-fail .login").attr("href", signUp + msg.email)
        $('#try-free-fail .error_desc').html 'Похоже, данный email уже используется в inTouch'
        openPopup 'fail'
        return

      $('#try-free-success .email').html msg.email
      openPopup 'success'
      return
    ).fail(->
      $("#try-free-fail .links").hide()
      $('#try-free-fail .error_desc').html 'Произошла ошибка, попробуйте повторить позже!'
      openPopup 'fail'
      setPopupCloseCallbacks()
      return
    )
    return false

  $('.inbtn.orange, .try').magnificPopup
    type: 'inline'
    preloader: false
    focus: '#e-mail'
    fixedContentPos: false
    fixedBgPos: false
    prependTo: $(".null")[0]
    closeMarkup: '<button class="mfp-close">Закрыть</button>'
    callbacks:
      beforeOpen: ->
        if $(window).width() < 700
          this.st.focus = false
        else
          this.st.focus = '#e-mail'
        return

  $('.jcarousel ul').magnificPopup
    delegate: 'a'
    type: 'image'
    fixedContentPos: false
    fixedBgPos: false
    prependTo: $('.null')[0]
    gallery:
      enabled: true
      preload: [1,2]
      navigateByImgClick: true

  $('.signin').on 'click', (e)->
    e.preventDefault()
    $.magnificPopup.instance.close()
    $.magnificPopup.open
      items:
        src: '<div class="white-popup-block signin">' + $("#signin-form").html() + '</div>'
        type: 'inline'
      closeBtnInside: true
      fixedContentPos: false
      fixedBgPos: false
      prependTo: $('.null')[0]
      closeMarkup: '<button class="mfp-close">Закрыть</button>'

    return false

  $('#panel-1 .row.choose-image').hover ->
    item = $(this).data 'image'
    $('#panel-1 img.fade').each ->
      $(this).removeClass('in')
      return
    $("#panel-1 img.item-#{item}.fade").addClass 'in'
    return

  $('.ball.poll').click ->
    $.magnificPopup.open
      items:
        src: '#step-2'
        type: 'inline'
      closeBtnInside: true
      prependTo: $('.null')[0]
      closeMarkup: '<button class="mfp-close">Закрыть</button>'
    return

  $('.download-btn').click (e) ->
    e.preventDefault()
    $.magnificPopup.open
      showCloseBtn: false
      prependTo: $('.null')[0]
      items:
        src: '<div class="white-popup-block">До начала загрузки осталось примерно <span id="countdown">10</span> секунд</div>'
    startCountdown()
    $.get(getToken, (msg) ->
      $.magnificPopup.open
        showCloseBtn: false
        prependTo: $('.null')[0]
        items:
          src: '<div class="white-popup-block">Начинается загрузка. Пожалуйста, подождите.</div>'
      $.fileDownload download,
        httpMethod: "POST"
        data:
          token: msg['token']
        failCallback: ->
          $.magnificPopup.close()
          $.magnificPopup.open
            items:
              src: '<div class="white-popup-block">К сожалению, файл в данный момент недоступен. Попробуйте повторить попытку позже.</div>'
              type: 'inline'
            closeBtnInside: true
            fixedContentPos: false
            fixedBgPos: false
            prependTo: $('.null')[0]
            closeMarkup: '<button class="mfp-close">Закрыть</button>'
          return
      $.magnificPopup.close()
      return
    ).fail ->
      $.magnificPopup.close()
      $.magnificPopup.open
        items:
          src: '<div class="white-popup-block">Скачивание в данный момент недоступно. Попробуйте повторить попытку позже.</div>'
          type: 'inline'
        closeBtnInside: true
        fixedContentPos: false
        fixedBgPos: false
        prependTo: $('.null')[0]
        closeMarkup: '<button class="mfp-close">Закрыть</button>'
      return
    return

#  $('.background.open-popup').click ->
#    item = $(this).data 'target'
#    items = [
#      {
#        src: '#story-0'
#      }
#      {
#        src: '#story-1'
#      }
#      {
#        src: '#story-2'
#      }
#      {
#        src: '#story-3'
#      }
#    ]
#    $.magnificPopup.open
#      items: items
#      gallery:
#        enabled: true
#      type: 'inline'
#    , item
#    return

  invalidEmailPopup = ->
    unless $('#e-mail').hasClass 'has-error'
      $('#e-mail').addClass 'has-error'

    $('#try-free-fail .links').hide()
    $('#try-free-fail .error_desc').html 'На такие домены мы писем не шлем...'
    openPopup 'fail'
    return

  openPopup = (src) ->
    $.magnificPopup.open
      items:
        src: '<div class="white-popup-block">' + $("#try-free-#{src}").html() + '</div>'
        type: 'inline'
      closeBtnInside: true
      fixedContentPos: false
      fixedBgPos: false
      prependTo: $('.null')[0]
      closeMarkup: '<button class="mfp-close">Закрыть</button>'
    return

  startCountdown = ->
    elapsedSeconds = 0
    countdown = $('#countdown')
    while elapsedSeconds <= 10
      ((elapsedSeconds) ->
        setTimeout (->
          countdown.html 10 - elapsedSeconds
          return
        ), elapsedSeconds * 1000
        return
      ) elapsedSeconds
      elapsedSeconds++
    return

  setPopupCloseCallbacks = ->
    $.magnificPopup.instance.close = ->
      $('.try').magnificPopup('open')
      $.magnificPopup.instance.close = ->
        $.magnificPopup.proto.close.call(this)
    return

  $('body').on 'click', 'a.google', (e) ->
    e.preventDefault()
    currentPage = window.location.href
    w = 480
    h = 380
    x = Number((window.screen.width - w) / 2)
    y = Number((window.screen.height - h) / 2)
    window.open "https://plusone.google.com/_/+1/confirm?hl=en&url=#{currentPage}&title=#{encodeURIComponent(document.title)}", '', "width=#{w},height=#{h},left=#{x},top=#{y},scrollbars=yes,menubar=no,toolbar=no"
    return

  $('body').on 'click', 'a.twitter-share-button', (e) ->
    e.preventDefault()
    currentPage = window.location.href
    url = "https://twitter.com/intent/tweet?original_referer=#{encodeURIComponent(currentPage)}&text=inTouch%20Xpress%20-%20%D0%BF%D0%BB%D0%B0%D1%82%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%D0%B4%D0%BB%D1%8F%20%D1%81%D0%B1%D0%BE%D1%80%D0%B0%20%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D0%BE%D0%B9%20%D1%81%D0%B2%D1%8F%D0%B7%D0%B8%20%D0%BA%D0%BB%D0%B8%D0%B5%D0%BD%D1%82%D0%BE%D0%B2.%20%D0%9E%D0%BF%D1%80%D0%BE%D1%81%D1%8B%20%D0%BD%D0%B0%20%D0%BF%D0%BB%D0%B0%D0%BD%D1%88%D0%B5%D1%82%D0%B0%D1%85%2C%20%D0%B0%D0%BD%D0%BA%D0%B5%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%2C%20%D0%B8%D1%81%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B4%D0%BE%D0%B2%D0%BB%D0%B5%D1%82%D0%B2%D0%BE%D1%80%D0%B5%D0%BD%D0%BD%D0%BE%D1%81%D1%82%D0%B8.&tw_p=tweetbutton&url=#{encodeURIComponent(currentPage)}"
    openTwitter url
    return

  openTwitter = (e) ->
    t = 'scrollbars=yes,resizable=yes,toolbar=no,menubar=no,location=yes'
    n = 550
    r = 420
    i = screen.height
    s = screen.width
    o = Math.round(s / 2 - n / 2)
    u = 0
    i > r and (u = Math.round(i / 2 - r / 2))
    window.open(e, null, "#{t},width=#{n},height=#{r},left=#{o},top=#{u}")

  return

$(document).keydown (e) ->
  if can_slide()
    switch e.which
      when 38
      #up
        return true if $(".mfp-container").is(":visible")
        e.preventDefault();
        scroll_to_panel current_panel_index() - 1
        return false
      when 32, 40
      #down
        return true if $(".mfp-container").is(":visible")
        e.preventDefault();
        scroll_to_panel current_panel_index() + 1
        return false
      else
        return true

$(window).scroll (e) ->
  if can_slide()
    e.preventDefault()
    scroll_top = $(window).scrollTop()
#    active_panel = current_panel_index()
#    inner_scroll = scroll_top - active_panel * $(window).height()
    unless $(".footer-container .btn-shownav").hasClass('active')
      if scroll_top > 10
        $('footer').css(display: 'block')
        $('footer').css(opacity: Math.min((scroll_top - 10) / 600, 1) )
      else
        $('footer').css(display: 'none')
  return
