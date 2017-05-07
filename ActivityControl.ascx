<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ActivityControl.ascx.cs" Inherits="RList.WebControls.ActivityControl" %>
<%@ Register Src="~/POLLS/Controls/ViewPoll.ascx" TagPrefix="uc1" TagName="ViewPoll" %>

<asp:Panel runat="server" ID="viewControllerPanel">
    <asp:Panel ID="DesktopPanel1" runat="server" HorizontalAlign="Center" Style="padding-top: 10px;">
        <%--<strong>Show: </strong>--%>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" RepeatLayout="Flow" onchange="setControlmode(this)">
            <asp:ListItem Value="12">Home</asp:ListItem>
            <asp:ListItem Value="3">Friends</asp:ListItem>
            <asp:ListItem Value="4">Businesses</asp:ListItem>
            <asp:ListItem Value="5">Ask MNR</asp:ListItem>
            <asp:ListItem Value="6">Polls</asp:ListItem>
            <asp:ListItem Value="8">News Feed</asp:ListItem>
            <%--<asp:ListItem Value="9">My News Feed</asp:ListItem>--%>
            <asp:ListItem Value="13">Saved posts</asp:ListItem>
        </asp:RadioButtonList>
    </asp:Panel>
    <asp:Panel ID="MobilePanel2" runat="server" HorizontalAlign="Center">
        <%--<strong>Show:</strong><br />--%>
        <asp:DropDownList ID="DropDownList1" SkinID="Focus" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Width="100%" CssClass="DropBox" AutoPostBack="True">
            <asp:ListItem Value="12">Home</asp:ListItem>
            <asp:ListItem Value="3">Friends</asp:ListItem>
            <asp:ListItem Value="4">Businesses</asp:ListItem>
            <asp:ListItem Value="5">Ask MNR</asp:ListItem>
            <asp:ListItem Value="6">Polls</asp:ListItem>
            <asp:ListItem Value="8">News Feed</asp:ListItem>
            <asp:ListItem Value="9">My News Feed</asp:ListItem>
            <asp:ListItem Value="13">Saved posts</asp:ListItem>
        </asp:DropDownList>
    </asp:Panel>
    <asp:HiddenField ID="controlMode" runat="server" ClientIDMode="Static" />
</asp:Panel>
<asp:DataList ID="ContentDataList2" runat="server" CellSpacing="2">
    <FooterTemplate>
    </FooterTemplate>
    <ItemTemplate>
        <div id="post-container">
            <asp:Panel runat="server" ID="ContentHeadPanel1">
                <div style="position: relative;">
                    <table class="auto-style1">
                        <tr>
                            <td style="width: 40px; vertical-align: top;">
                                <asp:ImageButton ID="Image1" runat="server" ImageAlign="Top" ImageUrl='<%#Eval("OwnerImage") %>' PostBackUrl='<%#Eval("OwnerImageURL") %>' />
                                <asp:Panel ID="VerifyPanel1" runat="server" Font-Bold="True" Visible='<%#Eval("isVerififed") %>'>
                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/verified_icon.png" />
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="strong" Enabled='<%# Eval("OwnerURLEnabled") %>' NavigateUrl='<%# Eval("OwnerURL") %>' Text='<%# Eval("Owner") %>'></asp:HyperLink>
                                <br />
                                <asp:Label ID="Label2" runat="server" CssClass="cdtime" Text='<%# Eval("Date") %>'></asp:Label>
                            </td>
                            <td style="vertical-align: bottom; min-width: 40px;"><span class="clicker" style="float: right; cursor: pointer;">
                                <asp:Image ImageUrl="~/Images/expand.png" Width="16px" Height="16px" runat="server" Visible='<%#Eval("showPostOptions") %>' /></span></td>
                        </tr>
                    </table>
                    <div class="more-options">
                        <div value="1" class="post-options" data-alt-icon='<%#((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).Savealticon %>' runat="server" feed-value='<%#((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).ActivityFeedID %>' post-saved='<%#((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).PostSaved %>'
                            visible='<%#Eval("ShowSavePost") %>'>
                            <asp:Image ImageUrl='<%#((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).Saveicon %>' runat="server" CssClass="options-icon" />
                            <asp:Label Text='<%#((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).PostSaveText %>' ID="savedPostLabel" ClientIDMode="Static" runat="server" />
                        </div>
                        <div value="2" runat="server" visible='<%#Eval("ShowSharePost") %>' feed-value='<%#((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).ActivityFeedID %>' class="post-options">
                            <asp:Image ImageUrl="~/Images/side-options/share-post.jpg" runat="server" CssClass="options-icon" />
                            Share
                        </div>
                        <div value="3" class="post-options" runat="server" visible='<%#Eval("ShowShareExternalPost") %>'>
                            <asp:Image ImageUrl="~/Images/side-options/share-post-external.jpg" runat="server" CssClass="options-icon" />
                            Share external
                        </div>
                        <div value="4" data-alt-icon='<%#((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).FeedAlticon %>' data-switch='<%#((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).Feedstatus %>' runat="server" visible='<%# ((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).ShowFeedStatus%>'
                            class="post-options">
                            <asp:Image ImageUrl='<%#((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).Feedicon %>' runat="server" CssClass="options-icon" />
                            <asp:Label ID="feedStatus" ClientIDMode="Static" Text='<%#((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).FeedStatusText %>' runat="server"></asp:Label>
                        </div>
                        <asp:HiddenField ID="Urlpath" ClientIDMode="Static" runat="server" Value='<%#((RList.MNR_Classes.theWall.ActivityContainer) Eval("activityContainer")).ActivityUrl%>' />
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel runat="server" ID="ContentPanel1">
                <asp:MultiView runat="server" ID="contentViews" ActiveViewIndex="0">
                    <asp:View runat="server" ID="NonPollView">
                        <div style="padding: 5px">
                            <asp:Label ID="ReviewComment" runat="server" CssClass="content-section" Text='<%#((RList.Library.DataAccess.ActivityContent)Eval("Content")).Content %>'></asp:Label>
                            <asp:Panel ID="Panel2" runat="server" Visible='<%#Eval("CanEditDelete") %>' CssClass="two-button-sides-mobile">
                                <div class="two-button-sides-side-mobile">
                                    <asp:Button ID="EditButton1" runat="server" Text="Edit" />
                                </div>
                                <div class="two-button-sides-side-mobile">
                                    <asp:Button ID="deleteButton1" runat="server" Text="Delete" />
                                </div>
                            </asp:Panel>
                        </div>
                    </asp:View>
                    <asp:View runat="server" ID="PollView">
                        <uc1:ViewPoll runat="server" ID="ViewPoll" />
                    </asp:View>
                </asp:MultiView>
            </asp:Panel>
            <asp:Panel runat="server" ID="LikeSectionPanel2">
                <div style="padding-top: 10px; padding-bottom: 10px;">
                    <asp:Panel ID="FirstLinePanel2" runat="server">
                        <div class="ldc-wrapper">
                            <div class="ldc-item">
                                <asp:Label ID="LikeButton" runat="server" SkinID="lhb-Likebutton" Text='<%#((RList.Library.ActivityModel.LikeStats) Eval("LikeStat")).Likes %>' OnClick="processLikeButton(this)" ClientIDMode="Static"></asp:Label>
                            </div>
                            <div class="ldc-item">
                                <asp:Label ID="DisLikeButton" runat="server" SkinID="lhb-Likebutton" Text='<%#((RList.Library.ActivityModel.LikeStats) Eval("LikeStat")).Dislikes %>' OnClick="processDisLikeButton(this)" ClientIDMode="Static"></asp:Label>
                            </div>
                            <div class="ldc-item">
                                <asp:Label ID="CommentButton3" runat="server" SkinID="lhb-Likebutton" Text="Comment" OnClick="showCommentBox(this)" />
                            </div>
                        </div>
                        <%--<div style="text-align: right;" class="clear-both">
                            <asp:LinkButton ID="ViewCommentLinkButton2" runat="server" OnClick="ViewCommentLinkButton2_Click">View Comments</asp:LinkButton>
                        </div>--%>
                    </asp:Panel>
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="CommentSectionPanel1">
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

                    <asp:DataList ID="CommentDataList1" DataSource='<%#Eval("Comments") %>' runat="server" CssClass="commentTable">
                        <ItemTemplate>

                            <table style="">
                                <tr>
                                    <td style="vertical-align: top; width: 40px">
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("UserPhoto35x35") %>'
                                            PostBackUrl='<%#Eval("UserProfileLink") %>' />
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="CommentUserHyperLink" runat="server" Text='<%#Eval("Username") %>' NavigateUrl='<%# Eval("UserProfileLink") %>'></asp:HyperLink>
                                        &nbsp;<asp:Label ID="dateRLabel" runat="server" CssClass="cdtime" Text='<%# Eval("Date") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("ThisComment") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="LikeButtonInner" runat="server" Text='<%#Eval("Likes") %>' OnClick="processLikeComment(this)" CssClass='<%#Eval("commentClass") %>'></asp:Label>
                                        &nbsp;
                            <asp:LinkButton ID="LinkButton6" runat="server" CssClass="comment-button" Visible='<%#Eval("CanReply") %>' CommandArgument='<%# Eval("ID") %>'>Reply</asp:LinkButton>
                                        <%--&nbsp;<asp:LinkButton ID="ResponseLinkButton7" Enabled='<%#(LikeType!= RList.MNR_Classes.ReviewType.Biz_Post && LikeType!= RList.MNR_Classes.ReviewType.Question) %>' runat="server" Text='<%# getResponseText( Eval("RUserID"), Eval("RdateR")) %>' Visible='<%# IsResponse(Eval("RUserID"), Eval("RdateR")) %>' CommandArgument='<%# Eval("UserID") %>' CommandName='<%# Eval("dateR") %>' OnCommand="ResponseLinkButton7_Command"></asp:LinkButton>--%>
                                        <asp:HiddenField ID="CommentInitialLikeStateHiddenField1" runat="server" ClientIDMode="Static" Value='<%#Eval("userLikeStatus") %>' />
                                        <asp:HiddenField ID="CommentIDHiddenField1" runat="server" ClientIDMode="Static" Value='<%#Eval("ID") %>' />
                                    </td>
                                </tr>
                                <%--                                <tr>
                                    <td colspan="2" style="vertical-align: top; padding-top: 5px;">
                                        <asp:Button ID="EditButton1" runat="server" CssClass="Edit-Delete-Button float-left" Text="Edit" CommandArgument='<%#Eval("dateR") %>' CommandName='<%#Eval("ID") %>' Visible='<%#ShowEditDelete(LikeType,Convert.ToInt32( Eval("Status")),Convert.ToInt32( Eval("UserID"))) %>' OnCommand="EditButton1_Command" SkinID="Edit-Delete-Comment-l" />
                                        <asp:Button ID="DeleteButton1" runat="server" CssClass="Edit-Delete-Button float-right" Text="Delete" CommandArgument='<%#Eval("dateR") %>' CommandName='<%#Eval("ID") %>' Visible='<%#ShowEditDelete(LikeType,Convert.ToInt32( Eval("Status")),Convert.ToInt32( Eval("UserID"))) %>' OnCommand="DeleteButton1_Command" SkinID="Edit-Delete-Comment-r" />
                                    </td>
                                </tr>--%>
                            </table>

                            <hr />
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </asp:Panel>
            <div id="InputArea">
                <asp:HiddenField ID="IDHiddenField1" runat="server" Value='<%# Eval("ID")%>' />
                <asp:HiddenField ID="_IsloggedInHiddenField1" Value='<%#Page.User.Identity.IsAuthenticated %>' runat="server" ClientIDMode="Static" />
                <%--                <asp:HiddenField ID="_UserIDHiddenField4" runat="server" Value='<%#RList.MNR_Classes.CUnit.BID %>' ClientIDMode="Static" />
                <asp:HiddenField ID="_UserRoleHiddenField9" Value='<%#RList.MNR_Classes.CUnit.UserRole %>' runat="server" ClientIDMode="Static" />--%>
            </div>
            <hr />
        </div>
    </ItemTemplate>
</asp:DataList>