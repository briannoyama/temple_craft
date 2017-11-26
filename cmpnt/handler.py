from engine.updatable import Updtbl
from engine.control import ESCAPE_K


#Exaple of how to handle and pass signals from a player.
class Hndlr(Updtbl):

    def __init__(self, cntrl, loop, priority = 0):
        self.cntrl = cntrl
        self.loop = loop
        super().__init__(priority)

    def update(self):
        if self.cntrl.signal[ESCAPE_K]:
            self.loop.running = False

