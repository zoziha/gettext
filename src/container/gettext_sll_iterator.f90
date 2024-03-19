module gettext_sll_iterator

    use gettext_sll, only: sll_type, keyvalue_type
    use gettext_sll_node, only: node_type

    private
    public :: init_sll_iterator, sll_iterator_type, next_sll_iterator

    type sll_iterator_type
        type(node_type), pointer :: current => null()
    end type sll_iterator_type

contains

    function init_sll_iterator(sll)
        type(sll_type), intent(in), target :: sll
        type(sll_iterator_type) :: init_sll_iterator

        init_sll_iterator%current => sll%head

    end function init_sll_iterator

    logical function next_sll_iterator(iterator, item)
        type(sll_iterator_type), intent(inout) :: iterator
        type(keyvalue_type), intent(out), pointer :: item

        if (associated(iterator%current)) then
            next_sll_iterator = .true.
            item => iterator%current%item
            iterator%current => iterator%current%next
        else
            next_sll_iterator = .false.
        end if

    end function next_sll_iterator

end module gettext_sll_iterator
