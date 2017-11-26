from engine import Cmpst, Pstn, Anmtn, Loop, ImgRndr
from sdl2 import View, Factory, Cntrl
from cmpnt.handler import Hndlr
import time

with View(800, 600, Pstn([0,0]), priority = 2) as view:
    factory = Factory(view)
    factory.load_all('res')

    pos = Pstn([300, 200, 0])
    rndr = factory.build_rndr(
            ImgRndr(pos,
                'res_img_character_3_4.png',
                priority = 1)
            )
    anmtn = Anmtn(rndr, [[0,0],[1,0],[2,0]])

    print('Building player')
    player1 = Cmpst(
        children = [rndr,
            anmtn
            ],
        priority = 1
        )


    control = Cntrl()

    world = Cmpst(
        children = [
            player1,
            view,
            control
            ]
        )

    print('World started!')
    loop = Loop(world)
    handler = Hndlr(control, loop)
    world.put(handler)

    loop.start()

