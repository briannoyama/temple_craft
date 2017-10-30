

cdef class Cmpst(Updtbl):

    def __cinit__(self):
        self.children = Updtbl()

    cpdef void update(self):
        cdef Updtbl child, insert
        child = self.children
        while child._next is not self.children:
            insert = child
            child = child._next
            if insert.priority > child.priority and \
                    insert is not self.children.priority:
                insert = insert._prev
                while insert.priority > child.priority and \
                        insert is not self.children.priority:
                    insert = insert._prev
                insert._set_next(child)

            child.update()

    cpdef void put(self, Updtbl cmpnt):
        self.children._set_next(cmpnt)
