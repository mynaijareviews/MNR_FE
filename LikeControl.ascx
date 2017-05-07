<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LikeControl.ascx.cs" Inherits="RList.WebControls.LikeControl" %>
<%@ Register Src="ReviewCommentControl.ascx" TagName="ReviewCommentControl" TagPrefix="uc1" %>
<%@ Register Src="ReviewCommentControl_Sub.ascx" TagName="ReviewCommentControl_Sub" TagPrefix="uc2" %>
<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>
<div class="likeSection">
    <div style="padding-top: 10px; padding-bottom: 10px;">
        <asp:Panel ID="FirstLinePanel2" runat="server">
            <div class="ldc-wrapper">
                <div class="ldc-item">
                    <asp:Button ID="LikeButton1" runat="server" Text="Like" SkinID="lhb" OnClick="LikeButton1_Click1" Visible="False" />
                    <asp:Label ID="LikeButton" runat="server" SkinID="lhb-Likebutton" Text="Like" OnClick="processLikeButton(this)" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="ldc-item">
                    <asp:Button ID="DisLikeButton2" runat="server" Text="Dislike" SkinID="lhb" OnClick="DisLikeButton2_Click1" Visible="False" />
                    <asp:Label ID="DisLikeButton" runat="server" SkinID="lhb-Likebutton" Text="DisLike" OnClick="processDisLikeButton(this)" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="ldc-item">
                    <%--<asp:Button ID="CommentButton3" runat="server" Text="Comment" SkinID="lhb" OnClick="LinkButton1_Click" />--%>
                    <asp:Label ID="CommentButton3" runat="server" SkinID="lhb-Likebutton" Text="Comment" OnClick="showCommentBox(this)" />
                </div>
            </div>
            <div style="text-align: right;" class="clear-both">
                <asp:LinkButton ID="ViewCommentLinkButton2" runat="server" OnClick="ViewCommentLinkButton2_Click">View Comments</asp:LinkButton>
            </div>
        </asp:Panel>
    </div>
    <div class="CommentBox" style="display: none; width: 100%;">
        <asp:TextBox ID="CommentText1" runat="server" ClientIDMode="Static" Rows="2" TextMode="MultiLine" Width="100%"></asp:TextBox>
        <%--<input id="CommentText1" type="text" class="mybox" />--%>
        <div class="two-button-sides-mobile">
            <div class="two-button-sides-side-mobile">
                <asp:Label ID="CommentButton4" runat="server" SkinID="lhb-Likebutton" Text="Submit" onclick="addNewRow(this)" />
            </div>
            <div class="two-button-sides-side-mobile">
                <asp:Label ID="Label1" runat="server" SkinID="lhb-Likebutton" Text="Cancel" onclick="HideCommentBox(this)" />
            </div>
        </div>
    </div>
    <div class="lighterColor full-width" id="comments">

        <asp:DataList ID="DataList1" runat="server" CssClass="commentTable">
            <ItemTemplate>

                <table style="">
                    <tr>
                        <td style="vertical-align: top; width: 40px">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#getPhoto(Convert.ToInt32( Eval("UserID")),Convert.ToInt32( Eval("Status"))) %>'
                                PostBackUrl='<%#getProfileLink(Convert.ToInt32( Eval("UserID")),Convert.ToInt32( Eval("Status"))) %>' />
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton4" runat="server" Text='<%#LikeType== RList.MNR_Classes.ReviewType.Biz_Post?( Convert.ToInt32( Eval("Status"))==1? cu.getBusinessName(Convert.ToInt32(Eval("UserID"))): getUsername( Eval("UserID"))):getUsername( Eval("UserID")) %>' CommandArgument='<%# Eval("UserID") %>' CommandName='<%# Eval("Status") %>' OnCommand="LinkButton4_Command"></asp:LinkButton>
                            &nbsp;<asp:Label ID="dateRLabel" runat="server" CssClass="cdtime" Text='<%# RList.MNR_Classes.CUnit.getCustomDate(Eval("dateR")) %>'></asp:Label>
                            <br />
                            <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
                            <br />
                            <asp:Label ID="LikeButtonInner" runat="server" Visible='<%#IsVisible(Eval("ID")) %>' Text='<%#getCommentlikes(LikeType,Eval("ID")) %>' OnClick="processLikeComment(this)" CssClass='<%#getCommentLikeClass(LikeType,Eval("ID")) %>'></asp:Label>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton6" runat="server" CssClass="comment-button" Visible='<%#(LikeType!= RList.MNR_Classes.ReviewType.Biz_Post && LikeType!= RList.MNR_Classes.ReviewType.RSSFeed && LikeType!= RList.MNR_Classes.ReviewType.UploadImage) %>' CommandArgument='<%# Eval("UserID") %>' CommandName='<%#getCommandtext( Eval("dateR"), Eval("ID")) %>' OnCommand="LinkButton6_Command">Reply</asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="ResponseLinkButton7" Enabled='<%#(LikeType!= RList.MNR_Classes.ReviewType.Biz_Post && LikeType!= RList.MNR_Classes.ReviewType.Question) %>' runat="server" Text='<%# getResponseText( Eval("RUserID"), Eval("RdateR")) %>' Visible='<%# IsResponse(Eval("RUserID"), Eval("RdateR")) %>' CommandArgument='<%# Eval("UserID") %>' CommandName='<%# Eval("dateR") %>' OnCommand="ResponseLinkButton7_Command"></asp:LinkButton>
                            <asp:HiddenField ID="CommentTypeHiddenField1" runat="server" ClientIDMode="Static" Value='<%#getCommentType(LikeType) %>' />
                            <asp:HiddenField ID="CommentInitialStateHiddenField1" runat="server" ClientIDMode="Static" Value='<%#getCommentInitialState(LikeType,Eval("ID")) %>' />
                            <asp:HiddenField ID="CommentIDHiddenField1" runat="server" ClientIDMode="Static" Value='<%#Eval("ID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="vertical-align: top; padding-top: 5px;">
                            <asp:Button ID="EditButton1" runat="server" CssClass="Edit-Delete-Button float-left" Text="Edit" CommandArgument='<%#Eval("dateR") %>' CommandName='<%#Eval("ID") %>' Visible='<%#ShowEditDelete(LikeType,Convert.ToInt32( Eval("Status")),Convert.ToInt32( Eval("UserID"))) %>' OnCommand="EditButton1_Command" SkinID="Edit-Delete-Comment-l" />
                            <asp:Button ID="DeleteButton1" runat="server" CssClass="Edit-Delete-Button float-right" Text="Delete" CommandArgument='<%#Eval("dateR") %>' CommandName='<%#Eval("ID") %>' Visible='<%#ShowEditDelete(LikeType,Convert.ToInt32( Eval("Status")),Convert.ToInt32( Eval("UserID"))) %>' OnCommand="DeleteButton1_Command" SkinID="Edit-Delete-Comment-r" />
                        </td>
                    </tr>
                </table>

                <hr />
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div>
        <div style="display: none">
            <ajaxToolkit:ModalPopupExtender ID="CommentLinkButton1_ModalPopupExtender" runat="server" CancelControlID="LinkButton5" DynamicServicePath="" Enabled="True" PopupControlID="Panel1" TargetControlID="LinkButton3" BackgroundCssClass="modalBackground" DropShadow="true">
            </ajaxToolkit:ModalPopupExtender>
            <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
            <asp:LinkButton ID="LinkButton5" runat="server">LinkButton</asp:LinkButton>
        </div>

        <asp:Panel ID="Panel1" runat="server" BackColor="White" Style="max-width: 500px; max-height: 600px;" ScrollBars="Auto">
            <div style="padding: 10px">
                <uc2:ReviewCommentControl_Sub ID="ReviewCommentControl_Sub1" runat="server" EnableViewState="true" ViewStateMode="Enabled" />
            </div>
        </asp:Panel>
    </div>
    <asp:HiddenField ID="IsloggedInHiddenField1" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="ReviewIDHiddenField2" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="InitialStateHiddenField3" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="UserIDHiddenField4" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="likeControlTypeHiddenField6" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="businessIDHiddenField7" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="PreviewGuidHiddenField8" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="UserRoleHiddenField9" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="ImgSrcHiddenField1" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="UserNameHiddenField2" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="ParentIDHiddenField1" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="ParentDateHiddenField2" runat="server" ClientIDMode="Static" />
</div>
<%--    </ContentTemplate>
</asp:UpdatePanel>--%>