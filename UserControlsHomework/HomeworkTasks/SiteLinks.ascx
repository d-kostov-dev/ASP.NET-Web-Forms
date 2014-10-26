<%@ Control 
    Language="C#" 
    AutoEventWireup="true" 
    CodeBehind="SiteLinks.ascx.cs" 
    Inherits="HomeworkTasks.SiteLinks" %>

<div class="col-md-3">
    <h3>Menu</h3>
    <div class="bs-component">
        <ul class="list-group">
            <asp:DataList ID="ListLinks" runat="server">
            <ItemTemplate>
                <li class="list-group-item">
                    <a href='<%# Eval("Url") %>' style='color:<%# Eval("FontColor")  %>'><%# Eval("Name") %></a>
                </li>
            </ItemTemplate>
        </asp:DataList>
        </ul>
    </div>
</div>

