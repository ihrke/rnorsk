is.installed <- function(mypkg) is.element(mypkg, installed.packages()[,1])

create_rnorsk_hex <- function(){
  hexSticker::sticker("inst/extdata/troll.png",
          package="rnorsk",
          p_size=12, s_x=1, s_y=.95, s_width=.6,
          p_y=1,
          h_color="#002868",
          h_fill="#ef2b2d",
          filename = "inst/extdata/rnorskhex.png")
}
