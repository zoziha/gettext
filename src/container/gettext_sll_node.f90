module gettext_sll_node

    type keyvalue_type
        character(:), allocatable :: key
        character(:), allocatable :: value
    end type keyvalue_type

    type node_type
        type(keyvalue_type) :: item
        type(node_type), pointer :: next => null()
    end type node_type

contains

    pure function init_node(item)
        type(keyvalue_type), intent(in) :: item
        type(node_type) :: init_node

        init_node%item%key = item%key
        init_node%item%value = item%value

    end function init_node

end module gettext_sll_node
