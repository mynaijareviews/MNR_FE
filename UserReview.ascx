<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserReview.ascx.cs" Inherits="RList.UserWebControls.UserReview" %>
<%@ Register Src="~/WebControls/LikeControl.ascx" TagName="LikeControl" TagPrefix="uc1" %>
<%@ Register Src="~/POLLS/Controls/ViewPoll.ascx" TagPrefix="uc1" TagName="ViewPoll" %>
<%@ Register Src="~/WebControls/Revenue/_advertiseControl.ascx" TagPrefix="uc1" TagName="_advertiseControl" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:MultiView ID="lMultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div style="padding: 5px">
                    <asp:Label ID="ReviewComment" runat="server" CssClass="content-section"></asp:Label>
                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                        <asp:ImageButton ID="ImageButton1" runat="server" /><asp:Literal ID="VideoLiteral1" runat="server"></asp:Literal>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible="false" CssClass="two-button-sides-mobile">
                        <div class="two-button-sides-side-mobile">
                            <asp:Button ID="EditButton1" runat="server" Text="Edit" OnCommand="EditButton1_Command" />
                        </div>
                        <div class="two-button-sides-side-mobile">
                            <asp:Button ID="deleteButton1" runat="server" OnClick="deleteButton1_Click" Text="Delete" />
                        </div>
                    </asp:Panel>
                    <div class="clear-both">
                        <uc1:LikeControl ID="LikeControl1" runat="server" EnableViewState="true" ViewStateMode="Enabled" />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <uc1:ViewPoll runat="server" ID="ViewPoll" />
            </asp:View>
        </asp:MultiView>
    </ContentTemplate>
</asp:UpdatePanel>