module gettext_sll_node

    type keyvalue_type
        character(len=100) :: key
        character(len=100) :: value
    end type keyvalue_type

    type node_type
        type(keyvalue_type) :: item
        type(node_type), pointer :: next => null()
    end type node_type

contains

    function init_node(item)
        type(keyvalue_type), intent(in) :: item
        type(node_type) :: init_node

        init_node%item = item

    end function init_node

end module gettext_sll_node
