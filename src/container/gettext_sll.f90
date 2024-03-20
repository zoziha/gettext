module gettext_sll

    use gettext_sll_node, only: init_node, node_type, keyvalue_type

    private
    public :: push_back, sll_type, keyvalue_type

    type sll_type
        type(node_type), pointer :: head => null()
        type(node_type), pointer :: tail => null()
    end type sll_type

contains

    pure subroutine push_back(sll, item)
        type(sll_type), intent(inout) :: sll
        type(keyvalue_type), intent(in) :: item

        if (associated(sll%tail)) then
            allocate (sll%tail%next, source=init_node(item))
            sll%tail => sll%tail%next
        else
            allocate (sll%head, source=init_node(item))
            sll%tail => sll%head
        end if

    end subroutine push_back

end module gettext_sll
