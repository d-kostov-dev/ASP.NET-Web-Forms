<%@ Page Title="Image Slider"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="PhotoAlbum.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <h3>Image Slider</h3>

            <div id="imageSlider" class="bs-component well">
                <ajaxToolkit:ToolkitScriptManager ID="ScriptManager" runat="server" />

                <div class="Image">
                    <asp:Image
                        class="img-responsive"
                        ID="currentImage"
                        runat="server"
                        Height="400px"
                        Width="400px"
                        ImageUrl="~/content/images/1.jpg" />
                </div>

                <ajaxToolkit:SlideShowExtender
                    ID="SlideShow"
                    runat="server"
                    BehaviorID="SSBehaviorID"
                    TargetControlID="currentImage"
                    SlideShowServiceMethod="GetSlides"
                    AutoPlay="true"
                    ImageDescriptionLabelID="Description"
                    NextButtonID="btnNext"
                    PreviousButtonID="btnPrev"
                    PlayButtonID="btnPlay"
                    PlayButtonText="Slideshow"
                    StopButtonText="Stop Slideshow"
                    Loop="true" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <div class="bs-component well">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <asp:Label ID="Description" runat="server" Text="" />
                    </div>
                </div>
                <div class="text-center">
                    <asp:Button class="btn btn-primary" ID="btnPrev" runat="server" Text="<<" />
                    <asp:Button class="btn btn-default" ID="btnPlay" runat="server" Text="" />
                    <asp:Button class="btn btn-primary" ID="btnNext" runat="server" Text=">>" />
                </div>
            </div>

        </div>
    </div>

    <script src="content/scripts/script.js"></script>
</asp:Content>
