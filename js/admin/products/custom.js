var action = "";
var params = "";
function clientSelectNode(node)
{
    $("dtvCategories").value = node.value;
    $("ifContent").src = appPath + "/admin/0A8963FE-59A3-4ade-8CF4-0483B49EF477.aspx" + "?catId=" + node.value;
    
    $("btnIndexUp").disabled = (node.index == 0);
    if (node.parentNode == null)
        $("btnIndexDown").disabled = true;
    else
        $("btnIndexDown").disabled = (node.index + 1 == node.parentNode.nodes.count);
}
function addCategory()
{
    if (dtvCategories.selectedNode == null) 
    {
        alert("Не выбрана родительская категория!");
        return;
    }
    $("ifContent").src = appPath + "/admin/F276793B-762E-42b0-997F-974D5907BC34.aspx?f=a&id=" + dtvCategories.selectedNode.value;
}
function deleteCategory()
{
    if (dtvCategories.selectedNode == null) 
    {
        alert("Не выбрана категория!");
        return;
    }
    if (dtvCategories.selectedNode.value == "0") 
    {
        alert("Выбрана корневая категория!");
        return;
    }
    if (confirm("Удалить категорию?")) 
    {
        $("imgLoader").setStyle({ display: "block" });
        action = "delete";
        selectedNode = dtvCategories.selectedNode;
        params = Object.toJSON({ Action: action, ID: selectedNode.value });
        CallbackRequest(params, selectedNode);
    }
}
function processCallbackRequest(args, ctx)
{
    $("imgLoader").setStyle({ display: "none" });
    if (args == "Ok")
    { 
        if (action == "delete")
        {
            dtvCategories.nodeToManipulate = ctx;
            dtvCategories.RemoveNodeProccess();
            selectNode(ctx.parentNode);
            dtvCategories.selectedNode = ctx.parentNode;
            $("ifContent").src = appPath + "/admin/0A8963FE-59A3-4ade-8CF4-0483B49EF477.aspx" + "?catId=" + ctx.parentNode.value;
        }
        if (action == "up")
        {
            dtvCategories.selectedNode = ctx;
            nodeUp = ctx;
            nodeDown = nodeUp.parentNode.nodes.node[nodeUp.index - 1];
            var node = nodeUp.parentNode.nodes.node[nodeUp.index];
            nodeUp.parentNode.nodes.node[nodeUp.index] = nodeUp.parentNode.nodes.node[nodeDown.index];
            nodeUp.parentNode.nodes.node[nodeDown.index] = node;
            nodeUp.index--;
            nodeDown.index++;
            
            var row = nodeDown.DOM.row.remove();
            var hidden = nodeDown.DOM.hidden.remove();
            
            new Insertion.After(nodeUp.DOM.hidden, row);
            new Insertion.After(row, hidden);
            
            if (nodeUp.position == "bottom")
            {
                nodeUp.position = "cross";
                if (nodeUp.nodes == null)
                    nodeUp.DOM.img.src = imgUrl[2][1];
                else
                    nodeUp.DOM.img.src = (nodeUp.expanded) ? imgUrl[1][1] : imgUrl[1][0];
            }
            if (nodeDown.index == nodeDown.parentNode.nodes.count - 1)
            {
                nodeDown.position = "bottom";
                if (nodeDown.nodes == null)
                    nodeDown.DOM.img.src = imgUrl[2][0];
                else
                    nodeDown.DOM.img.src = (nodeDown.expanded) ? imgUrl[1][2] : imgUrl[0][2];
            }
        }
        if (action == "down")
        {
            dtvCategories.selectedNode = ctx.parentNode;
            dtvCategories.selectedNode = ctx;
            nodeDown = ctx;
            nodeUp = nodeDown.parentNode.nodes.node[nodeDown.index + 1];
            var node = nodeUp.parentNode.nodes.node[nodeUp.index];
            nodeUp.parentNode.nodes.node[nodeUp.index] = nodeUp.parentNode.nodes.node[nodeDown.index];
            nodeUp.parentNode.nodes.node[nodeDown.index] = node;
            nodeUp.index--;
            nodeDown.index++;
            
            var row = nodeDown.DOM.row.remove();
            var hidden = nodeDown.DOM.hidden.remove();
            
            new Insertion.After(nodeUp.DOM.hidden, row);
            new Insertion.After(row, hidden);
            
            if (nodeUp.position == "bottom")
            {
                nodeUp.position = "cross";
                if (nodeUp.nodes == null)
                    nodeUp.DOM.img.src = imgUrl[2][1];
                else
                    nodeUp.DOM.img.src = (nodeUp.expanded) ? imgUrl[1][1] : imgUrl[1][0];
            }
            if (nodeDown.index == nodeDown.parentNode.nodes.count - 1)
            {
                nodeDown.position = "bottom";
                if (nodeDown.nodes == null)
                    nodeDown.DOM.img.src = imgUrl[2][0];
                else
                    nodeDown.DOM.img.src = (nodeDown.expanded) ? imgUrl[1][2] : imgUrl[0][2];
            }
        }
        
        $("btnIndexUp").disabled = (ctx.index == 0);
        if (ctx.parentNode == null)
            $("btnIndexDown").disabled = true;
        else
        {
            if (ctx.parentNode.nodes)
                $("btnIndexDown").disabled = (ctx.index + 1 == ctx.parentNode.nodes.count);
            else    
                $("btnIndexDown").disabled = false;
        }    
    }
    else
        alert(args); 
}
function processCallbackError(args, ctx)
{
    alert(args); 
}

function editCategory()
{
    dtvCategories = this.parent.dtvCategories;
    appPath = this.parent.appPath;
    if (dtvCategories.selectedNode == null) 
    {
        alert("Не выбрана категория!");
        return;
    }
    if (dtvCategories.selectedNode.value == "0") 
    {
        alert("Выбрана корневая категория!");
        return;
    }
    this.location.href = appPath + "/admin/F276793B-762E-42b0-997F-974D5907BC34.aspx?f=e&id=" + dtvCategories.selectedNode.value;
}
function updateWindow(addCategory)
{
    if (addCategory == undefined)
    {
        window.parent.window.location.href = window.parent.window.location.href;
        return;
    } 
    
    this.parent.dtvCategories.isEditing = addCategory;
    this.parent.dtvCategories.RefreshNode(this.parent.dtvCategories.selectedNode);
}

function upCategory()
{
    if (dtvCategories.selectedNode == null) 
    {
        alert("Не выбрана категория!");
        return;
    }
    if (dtvCategories.selectedNode.value == "0") 
    {
        alert("Выбрана корневая категория!");
        return;
    }
    $("imgLoader").setStyle({ display: "block" });
    action = "up";
    selectedNode = dtvCategories.selectedNode;
    params = Object.toJSON({ Action: action, ID: selectedNode.value });
    CallbackRequest(params, selectedNode);
}

function downCategory()
{
    if (dtvCategories.selectedNode == null) 
    {
        alert("Не выбрана категория!");
        return;
    }
    if (dtvCategories.selectedNode.value == "0") 
    {
        alert("Выбрана корневая категория!");
        return;
    }
    $("imgLoader").setStyle({ display: "block" });
    action = "down";
    selectedNode = dtvCategories.selectedNode;
    params = Object.toJSON({ Action: action, ID: selectedNode.value });
    CallbackRequest(params, selectedNode);
}

function selectAll()
{
    $$("input.checkbox").each(function(item)
    {
        item.checked = true;
    });
}

function deselectAll()
{
    $$("input.checkbox").each(function(item)
    {
        item.checked = false;
    });
}

function moveProducts()
{
    var params = { 
        method: "move",
        category: $("ProductsManager_ddlCategoriesToProducts").value,
        values: $A()
    }; 
    
    $$("input.checkbox").each(function(item)
    {
        if (item.checked)
        params.values[params.values.size()] = item.id;
    });
    
    if (params.values.size() == 0)
    {
        alert("Не выбрано ни одного товара для переноса!");
        return;
    }
      
    code = Object.toJSON(params);
    callback();    
}

function callBackEvent()
{
    window.location.href = window.location.href;
}

function callBackError()
{
    window.location.href = window.location.href;
}