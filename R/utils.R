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
create_package_hex <- function(){
  hexSticker::sticker("inst/extdata/package.png",
                      package="",
                      p_size=12, s_x=1, s_y=.95, s_width=.6,
                      p_y=1,
                      h_color="#000000",
                      h_fill="#ef2b2d55",
                      filename = "inst/extdata/packagehex.png")
}

create_function_hex <- function(){
  hexSticker::sticker("inst/extdata/wheel.png",
                      package="function()",
                      p_size=8, s_x=1, s_y=.95, s_width=.6,
                      p_y=1,
                      h_color="#000000",
                      h_fill="#043e9b",
                      filename = "inst/extdata/functionhex.png")
}

create_note_hex <- function(){
  hexSticker::sticker("inst/extdata/empty.png",
                      package="!",
                      p_size=46, s_x=1, s_y=.95, s_width=.6,
                      p_y=1,
                      p_color="#0000aa",
                      h_color="#000000",
                      h_fill="#ffff6f",
                      filename = "inst/extdata/notehex.png")
}
