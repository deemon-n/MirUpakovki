//  [ plustop, pluscross, plusbottom ]
//  [ minustop, minuscross, minusbottom ]
//  [ end cross end ] 
var imgUrl = new Array(3);
//imgUrl[0] = new Array("img/plustop.gif", "img/pluscross.gif", "img/plusbottom.gif");
//imgUrl[1] = new Array("img/minustop.gif", "img/minuscross.gif", "img/minusbottom.gif");
//imgUrl[2] = new Array("img/end.gif", "img/cross.gif", "img/end.gif");
var imgUrlTop = "";
var imgUrlLine = "";
// DynaTreeView
function DynaTreeView(id)
{
    this.id = id;
    this.nodes = new DynaTreeNodesCollection();
    this.selectedNode = null;
    this.cssClass ="";
    this.cssClass_normal = "";
    this.cssClass_selected = "";
    this.cssClass_hover = "";
    this.activeNode = null;
    this.imageUrl_normal = "";
    this.imageUrl_selected = "";
    this.Select = null;

    this.nodeToManipulate = null;
    this.stack = new $A();
    this.selestStack = new $A();
    this.isValidating = false;
    this.isRefreshing = false;
    this.isReloading = false;
    this.isEditing = false;
}
DynaTreeView.prototype.OnSelect = function(node)
{
    if (this.Select != null)
        this.Select(node);
} 
DynaTreeView.prototype.SetCssClass = function(css_class, css_normal, css_selected, css_hover)    
{
    this.cssClass = css_class;
    this.cssClass_normal = css_normal;
    this.cssClass_selected = css_selected;
    this.cssClass_hover = css_hover;
}
DynaTreeView.prototype.AttachTo = function(id)    
{
    parentEl = $(id);
    parentEl.className = this.cssClass;
    parentEl.value = "null";
    this.activeNode = null;
    this.GetChildNodes(null, null);
}
//  Создание DOM-ветви в теле документа
DynaTreeView.prototype.createNode = function(node, ctx)
{
    var parentEl = null;
    var imgEl = null;
    var textEl = null;
    var item = null;
    if (node.parentNode == null)
        parentEl = $(this.id);
    else
    {
        node.parentNode.ToggleChilds("block", false);
        parentEl = node.parentNode.DOM.hidden;
    }
    node.DOM.row = item = $c("table", "", parentEl);
    item.cellPadding = "0px";
    item.cellSpacing = "0px";
    item.node = node;
    attachEcmaClass(item, this);
    item = $c("tr", "", $c("tbody", "", item));
    var levels = node.GetNodeLevels();
    for (var i = 0 ; i < levels.size() - 1; ++i)
    {
        imgEl = $c("td", "", item).setStyle({ width: "19px" });
        if (ctx.nodes.node[levels[i]].position != "bottom")
            $c("img", "", imgEl).src = imgUrlLine;
        ctx = ctx.nodes.node[levels[i]];                
    }
    imgEl = $c("td", "", item).setStyle({ width: "19px" });
    attachEcmaClass(imgEl, this);
     
    if (this.SetImage(imgEl, node))
    {
        Event.observe(node.DOM.img, "click", this.Toggle);
        node.DOM.img.setStyle({ cursor: "pointer" });
    }
    imgEl = $c("td", "", item).setStyle({ padding: "0px 5px 0px 5px" });
    node.DOM.ico = imgEl = $c("img", "", imgEl);
    imgEl.src = this.imageUrl_normal;
    imgEl.node = node;
    imgEl.setStyle({ cursor: "pointer" });
    Event.observe(imgEl, "click", selectNode);
    
    node.DOM.txt = textEl = $c("td", "", item);  
    textEl.className = (node.customCssClass != "") ? node.customCssClass : this.cssClass_normal;
    textEl.innerHTML = (node.text != "") ? node.text : "&nbsp;";
    textEl.title = node.hint;
    textEl.value = node.value;
    textEl.setStyle({ cursor: "pointer" });
    textEl.node = node;
    Event.observe(textEl, "click", selectNode);
    Event.observe(textEl, "mouseover", this.MouseOver);
    Event.observe(textEl, "mouseout", this.MouseOut);
    attachEcmaClass(textEl, this);
        
    node.DOM.hidden = $c("div", "", parentEl).setStyle({ display: "none" });
}
//  Создание и добавление в родительскую ветвь JS-объекта ветви
DynaTreeView.prototype.createObjectNode = function(params)
{
    var newNode = new DynaTreeNode();
    newNode.text = params.text;
    newNode.hint = params.hint;
    newNode.value = params.value;
    newNode.expanded = params.expanded;
    newNode.customCssClass = params.customCssClass;
    newNode.parentNode = this.activeNode;
    newNode.index = this.SetIndex(newNode.parentNode);
    newNode.nodes = (!params.hasChilds) ? null : new DynaTreeNodesCollection();
    if (this.activeNode == null)
    {
        this.nodes.Add(newNode); 
        this.isCashed = true;
    }    
    else
    {
        this.activeNode.nodes.Add(newNode); 
        this.activeNode.isCashed = true;
    }   
    newNode.position = params.position;
    
    return newNode;    
}
DynaTreeView.prototype.GetChildNodes = function(parent, node)
{
    this.activeNode = node;
    this.CallBackRequest("get", node, parent);
    if (this.stack.length > 0)
        this.stack.splice(0, 1);  
}
DynaTreeView.prototype.Validate = function(nodes)
{
    if (!this.isValidating && nodes == undefined)
    {
        nodes = this.nodes;
        this.isValidating = true;
    }
    if (nodes != null && nodes.count > 0)
        for (var i = 0; i < nodes.count; ++i)
        {
            nodes.node[i].Validate();
            this.Validate(nodes.node[i].nodes);
        }
     if (nodes == this.nodes)
        this.isValidating = false;
}    
DynaTreeView.prototype.Reload = function()
{
    if (this.isRefreshing)
    {
        var toutReload = setTimeout(this.id + ".Reload()", 100);
        return;
    }
    this.isReloading = true;
    var nodePath = $A();
    var node = this.selectedNode;
    while (node.parentNode != null)
    {
        nodePath[nodePath.size()] = node.index;
        node = node.parentNode;
    }
    nodePath.reverse();
    $(this.id).update("");
    this.nodeToManipulate = this.selectedNode;
    this.nodes.Clear();
    this.AttachTo(this.id);
} 
DynaTreeView.prototype.LoadComplete = function()
{
    if (this.isReloading)
    {
//        if (!this.isSelecting)
//        {
//            this.isSelecting = true;
//            this.selectStack = this.selectedNode.GetNodeLevels();
//        }
//        if (this.selectStack.length > 0)
//        {
//            while (this.nodeToManipulate.expanded)
//            {
//                this.nodeToManipulate = this.nodes.node[this.selectStack[0]];
//                this.selectStack = deleteFirstInArray(this.selectStack);
//            }
//            this.Toggle(this.nodeToManipulate);
//        }
//        else
            this.isReloading = false;
    }
}

//  Функции для вызова запросов и обработки ответов
DynaTreeView.prototype.CallBackRequest = function(method, node, parent)
{
    $("imgLoader").setStyle({ display: "block" });
    var callbackParams = { type: method, id: "" };
    callbackParams.id = (node != null) ? node.GetNodeLevels().toJSON() : "null";
    $(this.id).value = Object.toJSON(callbackParams);
    this.DoCallBack(parent, this);
}
DynaTreeView.prototype.CallBackEvent = function(args, ctx)
{
    $("imgLoader").setStyle({ display: "none" });
    switch (args)
    {
        case "sucsessAdd":
        {
            ctx.AddNodeProccess();
            break;
        }
        case "failureAdd":
        {
            break;
        }
        case "sucsessDelete":
        {
            ctx.RemoveNodeProccess();
            break;
        }
        case "failureDelete":
        {
            break;
        } 
        case "acsessDenied":
        {
            alert("Редактирование невозможно!");
            break;
        } 
        default: 
        {
            if (ctx.isRefreshing)
            {
                ctx.isRefreshing = false;
                var node = args.evalJSON();
                ctx.selectedNode.text = node.text;
                ctx.selectedNode.hint = node.hint;
                ctx.selectedNode.value = node.value;
                ctx.selectedNode.customCssClass = node.customCssClass;
                ctx.selectedNode.Validate();
                
                if (ctx.isEditing)
                {
                    ctx.isEditing = false;
                    ctx.selectedNode.isCashed = false;
                    ctx.selectedNode.expanded = false;
                    if (ctx.selectedNode.nodes == null)
                        ctx.selectedNode.nodes = new DynaTreeNodesCollection();
                    else
                        ctx.selectedNode.nodes.Clear();
                    ctx.selectedNode.DOM.hidden.update("");
                    ctx.nodeToManipulate = ctx.selectedNode;
                    ttout = setTimeout(ctx.id + ".Toggle(" + ctx.id + ".nodeToManipulate)", 100);
                }    
                $("ifContent").src = appPath + "/admin/0A8963FE-59A3-4ade-8CF4-0483B49EF477.aspx" + "?catId=" + node.value;
                return;
            }
            var node = null;
            args.evalJSON().each(function(item){
                 node = ctx.createObjectNode(item);
                 if (node.expanded)
                    ctx.stack[ctx.stack.length] = node;    
                ctx.createNode(node, ctx);
            });
            
            if ((ctx.stack.length == 0 && node == null) || (ctx.stack.length == 0 && node.position == "bottom"))
                ctx.LoadComplete();
            
            if (ctx.stack.length > 0) 
                var tout = setTimeout(ctx.id + ".GetChildNodes(null, " + ctx.id + ".stack[0])", 50);
            break;        
        }
    }
}
DynaTreeView.prototype.CallBackError = function(args, ctx)
{
    window.alert(args);
}
//----------------------------------------------------------------
DynaTreeView.prototype.Toggle = function(ev)
{
    if (ev.type == "click")
    {
        var el = getParentNode(this, getEcmaClass(ev));
        var ctx = el._ecmaClass;
        var node = getElementNode(ev);
    }
    else
    {
        node = ev;
        ctx = node.DOM.txt._ecmaClass;
    }
    if (node.nodes == null)
        return;
    ctx.activeNode = node;
    
    if (!node.expanded)
    {
        node.expanded = true;
        ctx.SetImage(node.DOM.img, node);
        if (!node.isCashed)
        {
            node.isCashed = true;
            ctx.GetChildNodes(null, node);
        }    
        else
            node.ToggleChilds("block", false);
        
        tout = setTimeout(ctx.id + ".timeOutToToggle()", 100); 
    }
    else
    {
        node.expanded = false;
        ctx.SetImage(node.DOM.img, node);
        if (!node.isCashed)
            node.ToggleChilds("none", true);   
        else    
            node.ToggleChilds("none", false);   
    } 
}
DynaTreeView.prototype.MouseOver = function(ev)
{
    var el = getParentNode(this, getEcmaClass(ev));
    var ctx = el._ecmaClass;
    var node = getElementNode(ev);  
    if (ctx.selectedNode != node && node.customCssClass == "")
        node.DOM.txt.className = ctx.cssClass_hover;   
}
DynaTreeView.prototype.MouseOut = function(ev)
{
    var el = getParentNode(this, getEcmaClass(ev));
    var ctx = el._ecmaClass;
    var node = getElementNode(ev);  
    if (ctx.selectedNode != node)
        node.DOM.txt.className = (node.customCssClass != "") ? node.customCssClass : ctx.cssClass_normal;
}
DynaTreeView.prototype.selectNode = function(node)
{
    this.nodeToManipulate = node;
    tout = setTimeout(this.id + ".timeOutToSelect('" + node.toJSON() + "')", 500);
    $(this.id).value = node.GetNodeLevels().toJSON();
}
DynaTreeView.prototype.RefreshNode = function(node)
{
    this.isRefreshing = true;
    this.CallBackRequest("refresh", node, node);           
}
//  DynaTreeNodesCollection
function DynaTreeNodesCollection()
{
    this.node = new $A();
    this.count = 0;
}
DynaTreeNodesCollection.prototype.Add = function(node)    
{
    this.node[this.count] = new DynaTreeNode();
    this.node[this.count] = node;
    this.count = this.count + 1;
}
DynaTreeNodesCollection.prototype.Delete = function(index)    
{
    if (index > -1 && index < this.count)
    {
        this.node.splice(index,1);
        this.count--;
    }
}
DynaTreeNodesCollection.prototype.Clear = function()    
{
    this.node.clear();
    this.count = 0;
}
DynaTreeNodesCollection.prototype.Last = function()    
{
   return this.node[this.count - 1];
}

//  DynaTreeNode
function DynaTreeNode()
{
    this.text = "";
    this.value = "";
    this.hint = "";
    this.customCssClass = "";
    this.selected = false;
    this.expanded = false;
    this.nodes = new DynaTreeNodesCollection();
    this.parentNode = null;
    this.position = "";
    this.index = 0;
    
    this.isCashed = false;
    this.DOM = new DynaDomStructure();
}
DynaTreeNode.prototype.GetNodeLevel = function()    
{
    var count = 0;
    var node = this;
    while (node.parentNode != null)
    {
        node = node.parentNode;
        count++;
    }
    return count;
}
DynaTreeNode.prototype.GetNodeLevels = function()    
{
    var levels = $A();
    var node = this;
    while (node.parentNode != null)
    {
        node.index = node.GetNodeIndex();
        levels.push(node.index);
        node = node.parentNode;
    }
    levels.push(node.index);
    
    return levels.reverse();
}
DynaTreeNode.prototype.GetNodeIndex = function() 
{
    ctx = this.DOM.row._ecmaClass;
    var nodes = (this.parentNode != null) ? this.parentNode.nodes : ctx.nodes;
    for (var i = 0; i < nodes.count; ++i)
        if (nodes.node[i] == this)
            return i;
    return -1;    
}
DynaTreeNode.prototype.GetNodeCount = function()
{
    var nodes = (this.parentNode != null) ? this.parentNode.nodes : this.DOM.row._ecmaClass.nodes;  
    return nodes.count;     
}
DynaTreeNode.prototype.Validate = function()    
{
    this.DOM.txt.update(this.text);
    if (this.DOM.row._ecmaClass.selectedNode == this)
    {
        this.DOM.txt.className = this.DOM.row._ecmaClass.cssClass_selected;
        return;
    }    
    if (this.customCssClass != "")
        this.DOM.txt.className = this.customCssClass;
    else
        this.DOM.txt.className = this.DOM.row._ecmaClass.cssClass_normal;
}
DynaTreeNode.prototype.ToggleChilds = function(state, toClear)
{
    var item = this.DOM.hidden;
    item.setStyle({ display: state });
    if (toClear)
    {
        item.update("");
        this.nodes.Clear();
    }    
}     
// DynaDomStructure
function DynaDomStructure()
{
    this.ico = null;
    this.img = null;
    this.row = null;
    this.txt = null;
}

//  Служебные функции
DynaTreeView.prototype.SetIndex = function(parentNode)
{
    if (parentNode == null)
        return this.nodes.count;
    return parentNode.nodes.count;
}
//  Установка изображения для ветви
DynaTreeView.prototype.SetImage = function(el, node)
{
    var x = 0;
    var y = 0;
    var nodes = (node.parentNode == null) ? this.nodes : node.parentNode.nodes;
   
    if (node.nodes != null)    
        x = (node.expanded == true) ? 1 : 0; 
    else
        x = 2;
        
    if (node.position == "top")
        y = 0;
    else
        y = (node.position == "cross") ? y = 1 : y = 2;
    
    if (node.position == "top" && node.parentNode != null)
        y = 1;    
    
    var img = node.DOM.img;
    if (img == undefined)
    {
        node.DOM.img = img = $c("img", "", el);
        img.node = node;
        attachEcmaClass(node.DOM.img, this);
    }
    img.src = (x == 2 && y == 2 && node.position == "top") ? imgUrlTop : imgUrl[x][y]; 
    if (nodes.node[0].nodes == null && nodes.node[0].parentNode == null && node.index == 1)
        nodes.node[0].DOM.img.src = imgUrlTop;
    if (x == 2)
        return false;
    return true;    
}
//  Добавляет линии
DynaTreeView.prototype.DrawLines = function(node, nodes)
{
    if (nodes.count == 1)
        return;
    var level = getNodeLevel(node);
    var prevNode = null;
    for (var i = 0; i < nodes.count; ++i)
        if (nodes.node[i] == node)
        {
            prevNode = (i != 0) ? nodes.node[i - 1] : null; 
            break;
        }
    if (prevNode == null)
        return;
    if (prevNode.expanded == false || prevNode.nodes == null)
        return;
    if (prevNode.nodes.count == 0)    
        return;
    
    var itemEl = null;
    for (var i = 0; i < prevNode.nodes.count; ++i)
    {
         itemEl = prevNode.nodes.node[i].DOM.row.firstChild.firstChild;
         itemEl = itemEl.childnode[level];
         $c("img", "", itemEl).src = imgUrlLine;
    }    
}  
//  Удаляет линии
DynaTreeView.prototype.ClearLines = function(node)
{
    var nodes = node.nodes;
    var parentNode = null;
    var chNode = node;
    chNode = (node.parentNode != null) ? node.parentNode : this;
        
    var levels = node.GetNodeLevels();
    var islastNode = new $A(levels.length);
    for (var i = 0; i < levels.length; ++i)
    {
        if (chNode.nodes.node[chNode.nodes.count - 1] == node)
            islastNode[levels.length - 1 - i] = true;
        else
            islastNode[levels.length - 1 - i] = false;
        chNode = (chNode.parentNode != null) ? chNode.parentNode : this;      
    }
    if (node.nodes != null)
        for (var i = 0; i < node.nodes.count; ++i)
        {
            var el = node.nodes.node[i].DOM.row;
            var level = el.node.GetNodeLevel();
            var lineEl = el.firstChild.firstChild.firstChild;
            for (var j = 0; j < level; ++j)
            {   
                if (islastNode[j])
                    $(lineEl).update(""); 
                lineEl = lineEl.nextSibling;
            }
            
            if (node.nodes.node[i].nodes != null)
                this.ClearLines(node.nodes.node[i]);
        }
}
//  Выбор ветви
function selectNode(ev)
{
    if (ev.type == "click")
    {
        var el = getParentNode(this, getEcmaClass(ev));
        var ctx = el._ecmaClass; 
        var node = getElementNode(ev);  
    }
    else
    {
        var node = ev;
        var ctx = ev.DOM.txt._ecmaClass;
    }
    
    if (ctx.selectedNode != null)
    {
        el = ctx.selectedNode.DOM.txt;   
        if (el != null)
            el.className = (el.node.customCssClass != "") ? el.node.customCssClass : ctx.cssClass_normal;    
        ctx.selectedNode.DOM.ico.src = ctx.imageUrl_normal;
    }    
    if (node.customCssClass == "")
        node.DOM.txt.className = ctx.cssClass_selected;
        
    ctx.selectedNode = node; 
    node.DOM.ico.src = ctx.imageUrl_selected;
    $(ctx.id).value = node.GetNodeLevels().toJSON();
       
    ctx.OnSelect(node);
}
//  Получает ветвь при выборе элемента
function getElementNode(ev)
{
    if (ev.srcElement == undefined)
        return ev.currentTarget.node;
    if (ev.srcElement.parentElement.node != undefined)
        return ev.srcElement.parentElement.node;
    return ev.srcElement.node;
}

//  Таймауты для срабатывания функций
//var context = "";
//  При открытии ветви - выделить выбранную ветвь 
DynaTreeView.prototype.timeOutToToggle = function()
{
    var el = null;
    if (this.selectedNode != null)
    {
        el = this.selectedNode.DOM.txt;
        if (el != null) 
            el.className = (this.selectedNode.customCssClass == "") ? this.cssClass_selected : this.selectedNode.customCssClass;
        el = this.selectedNode.DOM.ico;
        if (el != null) 
            el.src = this.imageUrl_selected;  
        
        if (el == null) 
            tout = setTimeout(this.id + ".timeOutToToggle()", 100);      
    }   
}   
//  --------------------
DynaTreeView.prototype.timeOutToSelect = function(nodeJSON)
{
    var node = nodeJSON.evalJSON();
    var el = $(this.id + "_" + node + "_txt");
    if (el != null)
    {
        el.className = this.cssClass_selected;
        el = $(this.id + "_" + node + "_ico");
        el.src = this.imageUrl_selected;
        el = $(this.id + "_" + node);
        this.selectedNode = el.node;
    }    
}
DynaTreeView.prototype.timeoutToExpand = function()
{   
    this.GetChildNodes(null, this.nodeTomanipulate);
    var tout = setTimeout(this.id + ".timeOutToToggle()", 100);  
}
//  --------------------
//  --------------------
//  --------------------

//  Добавление ветви
DynaTreeView.prototype.AddNode = function(node, parentNode)
{
    this.nodeToManipulate = node;
    node.parentNode = parentNode;
    this.CallBackRequest("add", node, parentNode);
}  
DynaTreeView.prototype.AddNodeProccess = function()
{
    var node = this.nodeToManipulate;
    var parentNode = node.parentNode;
    parentNode.isCashed = false;
    if (parentNode.nodes != null && parentNode.nodes.count == 0 && parentNode.expanded)
        return;
    if (parentNode.nodes != null && !parentNode.expanded)
    {
        parentNode.ToggleChilds("none", true);
        parentNode.expanded = true;
        var imgEl = parentNode.DOM.img;
        this.SetImage(imgEl, parentNode);
        context = imgEl._ecmaClass;
        this.nodeToManipulate = parentNode;
        var tout = setTimeout(this.id + "timeoutToExpand()", 50);
        return;
    }    
    
    if (parentNode.nodes == null)
    {
        parentNode.nodes = new DynaTreeNodesCollection();
        parentNode.expanded = true;
        var imgEl = parentNode.DOM.img;
        if (parentNode.nodes == null)
            imgEl.src = imgUrl[2][1];
        else
        {
            if (parentNode.parentNode != null)
                imgEl.src = (parentNode.parentNode.nodes.Last() != parentNode) ? imgUrl[1][1] : imgUrl[1][2];
            Event.observe(parentNode.DOM.img, "click", this.Toggle);    
        }    
                 
        if (parentNode.parentNode != null)
            parentNode.parentNode.nodes.node[this.GetNodeIndex(parentNode)].expanded = true;  
        else
            parentNode.nodes.node[this.GetNodeIndex(parentNode)].expanded = true;       
    }    
    else
    {
        parentNode.nodes.Last().position = "cross";
        var prevNode = parentNode.nodes.Last();
        var imgEl = prevNode.DOM.img;
        if (prevNode.nodes == null)
            imgEl.src = imgUrl[2][1];
        else
            if (prevNode.position == "bottom")
                imgEl.src = (prevNode.expanded) ? imgUrl[1][2] : imgUrl[0][2];    
            else    
                imgEl.src = (prevNode.expanded) ? imgUrl[1][1] : imgUrl[0][1];    
    }    
    this.activeNode = parentNode;
    node.expanded = false;
    node.customCssClass = "";
    node.nodes = null;
    node.position = "bottom";
    node.isCashed = false;
    node.index = this.SetIndex(parentNode);
    parentNode.nodes.Add(node);
    imgEl.node = parentNode;
    this.createNode(parentNode.nodes.Last(), this);
    this.DrawLines(parentNode.nodes.Last(), parentNode.nodes);  
}
//  Удаление ветви из дерева
DynaTreeView.prototype.RemoveNode = function(node)
{
    this.nodeToManipulate = node;
    this.CallBackRequest("del", node, node);
}  
DynaTreeView.prototype.RemoveNodeProccess = function()
{
    var node = this.nodeToManipulate;
    
    var parentNode = node.parentNode;
    var index = node.GetNodeIndex();
    if (parentNode != null)
    {
        parentNode.nodes.Delete(index);
        if (parentNode.nodes.count == 0)
            parentNode.nodes = null;
        else   
            parentNode.nodes.Last().position = "bottom";
    }    
    else
    {
        this.nodes.Delete(index);   
        if (this.nodes.count == 0)
            this.nodes = null;
        else    
        if (this.nodes.count == index)
            this.nodes.Last().position = "bottom";
    }    
    
    var domParentNode = null;
    if (node.parentNode != null)
        domParentNode = $(node.parentNode.DOM.hidden);
    if (domParentNode == null)
        domParentNode = $(this.id);
        
    domParentNode.removeChild(node.DOM.row);
    domParentNode.removeChild(node.DOM.hidden);
    
    if (parentNode == null)
        parentNode = this;
        
    if (parentNode.nodes != null && index == parentNode.nodes.count)
    {
        var nextNode = parentNode.nodes.Last();
        var imgEl = nextNode.DOM.img;
        if (nextNode.nodes == null)
            imgEl.src = imgUrl[2][0];
        else
            imgEl.src = (nextNode.expanded) ? imgUrl[1][2] : imgUrl[0][2];
        if (nextNode.isCashed)
            this.ClearLines(nextNode);        
    }
    try
    {
        if (parentNode.nodes == null)
            parentNode.DOM.img.src = (parentNode.GetNodeIndex() == parentNode.GetNodeCount() - 1) ? imgUrl[2][2] : imgUrl[2][1];
        if (index == 0 && parentNode.index == undefined)
        {
            if (this.nodes.node[0].nodes == null)
                this.nodes.node[0].DOM.img.src = (parentNode.nodes.count > 1) ? imgUrlTop : this.nodes.node[0].DOM.img.src;
            else
                this.nodes.node[0].DOM.img.src = (this.nodes.node[0].expanded) ? imgUrl[1][0] : imgUrl[0][0];
        }    
     }
     catch(e) {}       
}

//  --------------------
//  --------------------
//  --------------------

function deleteFirstInArray(array)
{
    var result = new $A();
    if (array.length <= 1)
        return result;
    for (var i = 1; i < array.length; ++i)
        result[i - 1] = array[i];
    return array;        
}