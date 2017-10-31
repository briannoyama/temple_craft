
cdef class Cmpst(Updtbl):

    def __init__(self,
            list children = []
            int priority = 0):
        super().__init__(priority = priority)

        self.children = Updtbl()
        for child in reversed(children):
            self.children._set_next(child)

    cpdef void update(self):
        cdef Updtbl child, insert, next
        child = self.children._next
        while child is not self.children:
            next = child._next
            insert = child._prev
            if insert.priority > child.priority and \
                    insert is not self.children:
                insert = insert._prev
                while insert.priority > child.priority and \
                        insert is not self.children:
                    insert = insert._prev
                insert._set_next(child)

            child.update()
            child = next

    cpdef void put(self, Updtbl cmpnt):
        self.children._set_next(cmpnt)

