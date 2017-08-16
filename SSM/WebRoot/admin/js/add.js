	var url;
    function newUser(){
        $('#dlg').dialog('open').dialog('center').dialog('setTitle','添加信息');
    }
    function editUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','修改信息');
            $('#fm').form('load',row);
            url = '../admin/update.do?id='+row.admin_id;
        }
    }
    function saveUser(){
    	 $('#dlg').dialog('close');
    	 $('#dg').datagrid('reload');
    }
    function destroyUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $.messager.confirm('Confirm','确定删除?',function(r){
                if (r){
                    $.post('admin/delete.do',{id:row.id},function(result){
                        if (result.success){
                            $('#dg').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: 'Error',
                                msg: result.errorMsg
                            });
                        }
                    },'json');
                }
            });
        }
    }