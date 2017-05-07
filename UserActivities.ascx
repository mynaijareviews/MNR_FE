<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserActivities.ascx.cs" Inherits="RList.UserWebControls.UserActivities" %>
<%@ Register Src="UserReview.ascx" TagName="UserReview" TagPrefix="uc1" %>
<%@ Register Src="~/WebControls/Revenue/_advertiseControl.ascx" TagPrefix="uc1" TagName="_advertiseControl" %>

<style type="text/css">
    .auto-style1 {
        width: 100%;
    }

    .sideImage {
        float: left;
        padding-right: 10px;
    }

    .datalistClass {
        table-layout: fixed;
    }

    .more-options {
        clear: both;
        display: none;
        position: absolute;
        background-color: white;
        min-width: 100px;
        border: 1px solid #7FC451;
        right: 0;
    }

        .more-options div:hover {
            background: #7FC451;
            font-weight: bold;
            color: white;
        }

        .more-options div {
            padding: 5px;
            cursor: pointer;
        }

    .clicker {
        padding: 10px;
    }

    .options-icon {
        width: 25px;
        height: 25px;
        vertical-align: middle;
    }
</style>
<%--<script src="../Scripts/jquery-3.1.0.min.js"></script>--%>
<script>
    function closemodal() {
        $.modal.close();
    }

    function ResolveUrl(url) {
        if (url.indexOf("~/") == 0) {
            url = baseUrl + url.substring(2);
        }
        return url;
    }

    //function getHoverSrc(src) {
    //    return src.replace(".jpg", "-hover.jpg");
    //}

    function addHover(src) {
        return src.replace(".jpg", "-hover.jpg");
    }

    function removeHover(src) {
        return src.replace("-hover.jpg", ".jpg");
    }

    function ManageNewsFeed(val) {
        var sourceID = $(val).closest('td').find('input[name=mnr-source-id]').val();
        var IsloggedInHiddenField1 = $(val).closest('td').find('input[id=_IsloggedInHiddenField1]');
        var UserRoleHiddenField9 = $(val).closest('td').find('input[id=_UserRoleHiddenField9]').val();
        var UserIDHiddenField4 = $(val).closest('td').find('input[id=_UserIDHiddenField4]').val();
        if ($(IsloggedInHiddenField1).val() == "True") {
            // Run Web Service Here
            var service = new MNRService.MNR_Services();
            service.set_enableJsonp(true);

            var str = $(val).find('#feedStatus').text();
            if ($(val).attr("data-switch") == "add") {
                service.AddToNewsFeed(new Date().getTime(), sourceID, parseInt(UserIDHiddenField4), UserRoleHiddenField9);
                str = str.substring(str.indexOf('Add ') + 4, str.indexOf(' to'));
                $(val).find('#feedStatus').text("Remove " + str + " from my feed");
                $('#modalpop').html(str + " has been added to your feed");
                $(val).attr("data-switch", "remove");
            } else {
                service.RemoveFromNewsFeed(new Date().getTime(), sourceID, parseInt(UserIDHiddenField4), UserRoleHiddenField9);
                str = str.substring(str.indexOf('Remove ') + 7, str.indexOf(' from'));
                $(val).find('#feedStatus').text("Add " + str + " to my feed");
                $('#modalpop').html(str + " has been removed from your feed");
                $(val).attr("data-switch", "add");
            }
            var altIcon = ResolveUrl($(val).attr("data-alt-icon"));
            var currenticon = $(val).find('.options-icon').attr("src");
            $(val).find('.options-icon').attr("src", altIcon);
            $(val).attr("data-alt-icon", currenticon);
            //$(val).attr("data-hover-icon", getHoverSrc(altIcon));
        }
    }

    function managePostSaving(val) {
        var feedID = $(val).attr("feed-value");
        var postSave = $(val).attr("post-saved");
        var IsloggedInHiddenField1 = $(val).closest('td').find('input[id=_IsloggedInHiddenField1]');
        var UserRoleHiddenField9 = $(val).closest('td').find('input[id=_UserRoleHiddenField9]').val();
        var UserIDHiddenField4 = $(val).closest('td').find('input[id=_UserIDHiddenField4]').val();
        if ($(IsloggedInHiddenField1).val() == "True") {
            var service = new MNRService.MNR_Services();
            service.set_enableJsonp(true);
            if (postSave == "True") {
                // un save
                service.unsavePost(new Date().getTime(), feedID, parseInt(UserIDHiddenField4), UserRoleHiddenField9);
                $(val).find('#savedPostLabel').text("Save Post");
                $(val).attr("post-saved", "False");
                var cmode = $('#controlMode').val();
                if (cmode == "13") {
                    $(val).closest('#post-container').slideUp(200);
                }
                $('#modalpop').html("Unsaved Post");
            } else {
                // save
                service.savePost(new Date().getTime(), feedID, parseInt(UserIDHiddenField4), UserRoleHiddenField9);
                $(val).find('#savedPostLabel').text("Unsave Post");
                $(val).attr("post-saved", "True");
                $('#modalpop').html("Saved Post");
            }
            var altIcon = ResolveUrl($(val).attr("data-alt-icon"));
            var currenticon = $(val).find('.options-icon').attr("src");
            $(val).find('.options-icon').attr("src", altIcon);
            $(val).attr("data-alt-icon", currenticon);
            //$(val).attr("data-hover-icon", getHoverSrc(altIcon));
        }
    }

    function sharePost(val) {
        var feedID = $(val).attr("feed-value");
        var IsloggedInHiddenField1 = $(val).closest('td').find('input[id=_IsloggedInHiddenField1]');
        var UserRoleHiddenField9 = $(val).closest('td').find('input[id=_UserRoleHiddenField9]').val();
        var UserIDHiddenField4 = $(val).closest('td').find('input[id=_UserIDHiddenField4]').val();
        if ($(IsloggedInHiddenField1).val() == "True") {
            var service = new MNRService.MNR_Services();
            service.set_enableJsonp(true);
            service.sharePost(new Date().getTime(), feedID, parseInt(UserIDHiddenField4), UserRoleHiddenField9);
        }
    }
    $(function () {
        var clipboardDemos = new Clipboard('.copier');
        clipboardDemos.on('success', function (e) { $(e.trigger).val("Copied!"); });
        clipboardDemos.on('error', function (e) { console.error('Action:', e.action); console.error('Trigger:', e.trigger); });

        //$('.clicker').click(function (e) {
        //    e.stopImmediatePropagation();
        //    $(this).closest('div').find('.more-options').slideToggle(200);
        //});

        $(document).on("click", '.clicker', function (e) {
            e.stopImmediatePropagation();
            $(this).closest('div').find('.more-options').slideToggle(200);
        });

        $(document).on("change", '[id*=DropDownList1]', function (e) {
            e.stopImmediatePropagation();
            var selectedValue = $(this).val();
            $('#controlMode').val(selectedValue);
        });

        $(document).on("change", '[id*=RadioButtonList1] input', function (e) {
            e.stopImmediatePropagation();
            var selectedValue = $(this).val();
            $('#controlMode').val(selectedValue);
        });

        //$('.post-options').each(function () {
        //    var temphover = $(this).attr("data-hover-icon");
        //    $(this).attr("data-hover-icon", ResolveUrl(temphover));
        //});

        //function showMoreOptions(ele, e) {
        //    e.stopImmediatePropagation();
        //    $(ele).closest('div').find('.more-options').slideToggle(200);
        //}

        $(document).on("mouseover", '.post-options', function (e) {
            e.stopImmediatePropagation();
            var image = $(this).find('.options-icon');
            $(image).attr("src", addHover($(image).attr("src")));
        });

        $(document).on("mouseout", '.post-options', function (e) {
            e.stopImmediatePropagation();
            var image = $(this).find('.options-icon');
            $(image).attr("src", removeHover($(image).attr("src")));
        });

        $(document).on("click", '.more-options div', function (e) {
            e.stopImmediatePropagation();
            $(this).closest('.more-options').slideUp(200);
            var selected = $(this).attr("value");
            switch (selected) {
                default:
                    break;
                case "1":
                    managePostSaving(this);
                    $('#modalpop').modal({
                        escapeClose: false,
                        clickClose: false,
                        showClose: false,
                        fadeDuration: 300
                    });
                    break;
                case "2":
                    sharePost(this);
                    $('#modalpop').html("post shared!");
                    $('#modalpop').modal({
                        escapeClose: false,
                        clickClose: false,
                        showClose: false,
                        fadeDuration: 300
                    });
                    break;
                case "3":
                    var url = $(this).siblings('#Urlpath').val();
                    $('#modalpop2').find('#link').val(url);
                    $('#modalpop2').find('#link').attr('readonly', true);
                    $('#modalpop2').modal({
                        escapeClose: false,
                        clickClose: false,
                        showClose: false,
                        fadeDuration: 300
                    });
                    break;
                case "4":
                    ManageNewsFeed(this);
                    $('#modalpop').modal({
                        escapeClose: false,
                        clickClose: false,
                        showClose: false,
                        fadeDuration: 300
                    });
                    break;
            }
            if (selected != "3")
                setTimeout(function () { $.modal.close(); }, 1300);

        });
    });
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">

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
                <asp:Panel ID="PinnedPanel1" runat="server" Visible="false">
                    <asp:DataList ID="PinnedDataList1" runat="server" CellSpacing="2" OnItemDataBound="PinnedDataList1_ItemDataBound">
                        <FooterTemplate>
                        </FooterTemplate>
                        <ItemTemplate>
                            <table class="auto-style1">
                                <tr>
                                    <td style="width: 40px; vertical-align: top;">
                                        <asp:ImageButton ID="Image1" runat="server" ImageAlign="Top" ImageUrl='<%#Eval("ImageSrc") %>' PostBackUrl='<%#Eval("ImageLink") %>' />
                                        <asp:Panel ID="VerifyPanel1" runat="server" Font-Bold="True" Visible='<%#RList.Verification._verify.IsUserVerified(Convert.ToInt32(Eval("UserID"))) %>'>
                                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/verified_icon.png" />
                                        </asp:Panel>
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="PinnedHyperLink1" runat="server" CssClass="strong" Enabled='<%# Eval("isLinkEnabled") %>' NavigateUrl='<%# Eval("Link") %>' Text='<%# Eval("ActivityText") %>'></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <uc1:UserReview ID="UserReview1" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <table id="InputArea" class="auto-style1 strong">
                                <tr>
                                    <td>
                                        <div>
                                            <asp:HiddenField ID="PinnedHiddenField1" runat="server" Value='<%# Eval("ActivityID")%>' />
                                            <asp:HiddenField ID="PinnedHiddenField2" runat="server" Value='<%# Eval("ActivityType")%>' />
                                            <asp:HiddenField ID="PinnedHiddenField3" runat="server" Value='<%# Eval("LeadRole")%>' />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </asp:Panel>
                <br />
                <asp:DataList ID="DataList2" runat="server" CellSpacing="2" OnItemCreated="DataList2_ItemCreated" OnItemDataBound="DataList2_ItemDataBound">
                    <FooterTemplate>
                    </FooterTemplate>
                    <ItemTemplate>
                        <div id="post-container">
                            <div style="position: relative;">
                                <table class="auto-style1">
                                    <tr>
                                        <td style="width: 40px; vertical-align: top;">
                                            <asp:ImageButton ID="Image1" runat="server" ImageAlign="Top" ImageUrl='<%#Eval("ImageSrc") %>' PostBackUrl='<%#Eval("ImageLink") %>' />
                                            <asp:Panel ID="VerifyPanel1" runat="server" Font-Bold="True" Visible='<%#RList.Verification._verify.IsUserVerified(Convert.ToInt32(Eval("UserID"))) %>'>
                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/verified_icon.png" />
                                            </asp:Panel>
                                        </td>
                                        <td>
                                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="strong" Enabled='<%# Eval("isLinkEnabled") %>' NavigateUrl='<%# Eval("Link") %>' Text='<%# Eval("ActivityText") %>'></asp:HyperLink>
                                            <br />
                                            <asp:Label ID="Label2" runat="server" CssClass="cdtime" Text='<%# RList.MNR_Classes.CUnit.getCustomDate( Eval("ActivityDate")) %>'></asp:Label>
                                        </td>
                                        <td style="vertical-align: bottom; min-width: 40px;"><span class="clicker" style="float: right; cursor: pointer;">
                                            <asp:Image ImageUrl="~/Images/expand.png" Width="16px" Height="16px" runat="server" Visible='<%#Eval("ActivityGID")!=null %>' /></span></td>
                                    </tr>
                                </table>
                                <div class="more-options">
                                    <div value="1" class="post-options" data-alt-icon='<%#Eval("Savealticon") %>' runat="server" feed-value='<%#Eval("ActivityFeedID") %>' post-saved='<%#Eval("PostSaved") %>' visible='<%#Page.User.Identity.IsAuthenticated && Eval("ActivityFeedID")!=null %>'>
                                        <asp:Image ImageUrl='<%#Eval("Saveicon") %>' runat="server" CssClass="options-icon" />
                                        <asp:Label Text='<%#Eval("PostSaveText") %>' ID="savedPostLabel" ClientIDMode="Static" runat="server" />
                                    </div>
                                    <div value="2" runat="server" visible='<%#Page.User.Identity.IsAuthenticated && Eval("ActivityFeedID")!=null %>' feed-value='<%#Eval("ActivityFeedID") %>' class="post-options">
                                        <asp:Image ImageUrl="~/Images/side-options/share-post.jpg" runat="server" CssClass="options-icon" />
                                        Share
                                    </div>
                                    <div value="3" class="post-options" runat="server" visible='<%#Eval("ActivityUrl")!=null %>'>
                                        <asp:Image ImageUrl="~/Images/side-options/share-post-external.jpg" runat="server" CssClass="options-icon" />
                                        Share external
                                    </div>
                                    <div value="4" data-alt-icon='<%#Eval("FeedAlticon") %>' data-switch='<%#Eval("Feedstatus") %>' runat="server" visible='<%#Page.User.Identity.IsAuthenticated && doalib.EnumExtensions.ParseEnum<RList.MNR_Classes.Site_Activities.Activities>(Eval("ActivityType").ToString())== RList.MNR_Classes.Site_Activities.Activities.POSTS &&
                                    doalib.EnumExtensions.ParseEnum<RList.MNR_Classes.ReviewType>(Eval("Reviewtype").ToString())==RList.MNR_Classes.ReviewType.RSSFeed %>'
                                        class="post-options">
                                        <asp:Image ImageUrl='<%#Eval("Feedicon") %>' runat="server" CssClass="options-icon" />
                                        <asp:Label ID="feedStatus" ClientIDMode="Static" Text='<%#Eval("FeedStatusText") %>' runat="server"></asp:Label>
                                    </div>
                                    <asp:HiddenField ID="Urlpath" ClientIDMode="Static" runat="server" Value='<%# Eval("ActivityUrl")%>' />
                                </div>
                            </div>
                            <uc1:UserReview ID="UserReview1" runat="server" />
                            <div id="InputArea">
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("ActivityID")%>' />
                                <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("ActivityType")%>' />
                                <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("LeadRole")%>' />
                                <asp:HiddenField ID="_IsloggedInHiddenField1" Value='<%#Page.User.Identity.IsAuthenticated %>' runat="server" ClientIDMode="Static" />
                                <asp:HiddenField ID="_UserIDHiddenField4" runat="server" Value='<%#RList.MNR_Classes.CUnit.BID %>' ClientIDMode="Static" />
                                <asp:HiddenField ID="_UserRoleHiddenField9" Value='<%#RList.MNR_Classes.CUnit.UserRole %>' runat="server" ClientIDMode="Static" />
                            </div>
                            <hr />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:Panel ID="PinPanel2" runat="server">

                    <asp:RadioButtonList ID="PinnedSortRadioButtonList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PinnedSortRadioButtonList2_SelectedIndexChanged" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">Order by activity date</asp:ListItem>
                        <asp:ListItem>Order by pinned posts</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:Panel>
                <asp:DataList ID="DataList3" runat="server" CellSpacing="2" OnItemCreated="DataList3_ItemCreated" OnItemDataBound="DataList3_ItemDataBound">
                    <FooterTemplate>
                    </FooterTemplate>
                    <ItemTemplate>
                        <div style="position: relative;">
                            <table class="auto-style1" style="font-size: 14px">
                                <tr>
                                    <td style="width: 40px; vertical-align: top;">
                                        <asp:ImageButton ID="Image2" runat="server" ImageAlign="Top" ImageUrl='<%#Eval("ImageSrc") %>'
                                            PostBackUrl='<%#Eval("ImageLink") %>' />
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="HyperLink3" runat="server" CssClass="strong" Enabled='<%# Eval("isLinkEnabled") %>' NavigateUrl='<%# Eval("Link") %>' Text='<%# Eval("ActivityText") %>'></asp:HyperLink>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" CssClass="cdtime" Text='<%#RList.MNR_Classes.CUnit.getCustomDate( Eval("ActivityDate")) %>'></asp:Label>
                                        <asp:Panel ID="PinPanel1" runat="server" HorizontalAlign="Right" Visible='<%#(Convert.ToInt32(Eval("BusinessID"))==RList.MNR_Classes.CUnit.BID && cu.getUserRole()==RList.MNR_Classes.CUnit.BUSINESS
                                            && !RList.MNR_Classes.Revenue.Manager.IsAd(Guid.Parse(Eval("ActivityGID").ToString()), RList.MNR_Classes.Revenue.Types.Post,c)) %>'>
                                            <asp:UpdatePanel ID="PinUpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:LinkButton ID="PinLinkButton2" runat="server" CssClass="cdtime" Text='<%#PinPostText(Eval("ActivityGID")) %>' ToolTip='<%#PinPostInfo(Eval("ActivityGID")) %>' CommandArgument='<%#Eval("ActivityGID") %>' OnCommand="PinLinkButton2_Command"></asp:LinkButton>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </td>
                                    <td style="vertical-align: bottom; min-width: 40px;"><span class="clicker" style="float: right; cursor: pointer;">
                                        <asp:Image ImageUrl="~/Images/expand.png" Width="16px" Height="16px" runat="server" Visible='<%#Eval("ActivityGID")!=null %>' /></span></td>
                                </tr>
                            </table>
                            <div class="more-options">
                                <div value="1" class="post-options" data-alt-icon='<%#Eval("Savealticon") %>' runat="server" feed-value='<%#Eval("ActivityFeedID") %>' post-saved='<%#Eval("PostSaved") %>' visible='<%#Page.User.Identity.IsAuthenticated && Eval("ActivityFeedID")!=null %>'>
                                    <asp:Image ImageUrl='<%#Eval("Saveicon") %>' runat="server" CssClass="options-icon" />
                                    <asp:Label Text='<%#Eval("PostSaveText") %>' ID="savedPostLabel" ClientIDMode="Static" runat="server" />
                                </div>
                                <div value="2" runat="server" visible='<%#Page.User.Identity.IsAuthenticated && Eval("ActivityFeedID")!=null %>' feed-value='<%#Eval("ActivityFeedID") %>' class="post-options">
                                    <asp:Image ImageUrl="~/Images/side-options/share-post.jpg" runat="server" CssClass="options-icon" />
                                    Share
                                </div>
                                <div value="3" class="post-options">
                                    <asp:Image ImageUrl="~/Images/side-options/share-post-external.jpg" runat="server" CssClass="options-icon" />
                                    Share external
                                </div>
                                <div value="4" data-alt-icon='<%#Eval("FeedAlticon") %>' data-switch='<%#Eval("Feedstatus") %>' runat="server" visible='<%#Page.User.Identity.IsAuthenticated && doalib.EnumExtensions.ParseEnum<RList.MNR_Classes.Site_Activities.Activities>(Eval("ActivityType").ToString())== RList.MNR_Classes.Site_Activities.Activities.POSTS &&
                                    doalib.EnumExtensions.ParseEnum<RList.MNR_Classes.ReviewType>(Eval("Reviewtype").ToString())==RList.MNR_Classes.ReviewType.RSSFeed %>'
                                    class="post-options">
                                    <asp:Image ImageUrl='<%#Eval("Feedicon") %>' runat="server" CssClass="options-icon" />
                                    <asp:Label ID="feedStatus" ClientIDMode="Static" Text='<%#Eval("FeedStatusText") %>' runat="server"></asp:Label>
                                </div>
                                <asp:HiddenField ID="Urlpath" ClientIDMode="Static" runat="server" Value='<%# Eval("ActivityUrl")%>' />
                            </div>
                            <div runat="server" visible='<%#!RList.MNR_Classes.CUnit.IsMobileLink(Page) && (RList.MNR_Classes.CUnit.BID==RList.MNR_Classes.CUnit.MNR_BID || RList.MNR_Classes.CUnit.BID==RList.MNR_Classes.CUnit.COAJCORNER
                        || RList.MNR_Classes.CUnit.BID==RList.MNR_Classes.CUnit.ERENNYBEADS) &&  RList.MNR_Classes.BusinessProfile.IsUsersBusiness(cu) %>'>
                                <asp:Button SkinID="lhb" Text='<%#getAdText(Eval("ActivityID").ToString()) %>' ID="adbtn" CommandArgument='<%# Eval("ActivityID")%>' runat="server" OnCommand="adbtn_Command" />
                            </div>
                        </div>
                        <uc1:UserReview ID="UserReview2" runat="server" />
                        <table id="InputArea1" class="auto-style1 strong">
                            <tr>
                                <td>
                                    <div>
                                        <asp:HiddenField ID="HiddenField4" runat="server" Value='<%# Eval("ActivityID")%>' />
                                        <asp:HiddenField ID="HiddenField5" runat="server" Value='<%# Eval("ActivityType")%>' />
                                        <asp:HiddenField ID="HiddenField6" runat="server" Value='<%# Eval("LeadRole")%>' />
                                        <asp:HiddenField ID="_IsloggedInHiddenField1" Value='<%#Page.User.Identity.IsAuthenticated %>' runat="server" ClientIDMode="Static" />
                                        <asp:HiddenField ID="_UserIDHiddenField4" runat="server" Value='<%#RList.MNR_Classes.CUnit.BID %>' ClientIDMode="Static" />
                                        <asp:HiddenField ID="_UserRoleHiddenField9" Value='<%#RList.MNR_Classes.CUnit.UserRole %>' runat="server" ClientIDMode="Static" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>

                <div style="display: none">
                    <asp:LinkButton ID="AjaxModalPopUpLinkButton1" runat="server">LinkButton</asp:LinkButton>
                    <ajaxToolkit:ModalPopupExtender ID="MyButton5_ModalPopupExtender"
                        runat="server" DynamicServicePath="" Enabled="True"
                        TargetControlID="AjaxModalPopUpLinkButton1" PopupControlID="ModalPanel1"
                        CancelControlID="LinkBtn" BackgroundCssClass="modalBackground">
                    </ajaxToolkit:ModalPopupExtender>
                </div>
                <asp:Panel ID="ModalPanel1" runat="server" CssClass="ModalPopUp" BackColor="White" Style="max-width: 800px; min-width: 500px; min-height: 300px; max-height: 800px;" ScrollBars="Auto">
                    <div style="text-align: right; padding: 10px;">
                        <asp:LinkButton Text="&#x274E; Close" ID="LinkBtn" runat="server" />
                    </div>
                    <uc1:_advertiseControl runat="server" ID="_advertiseControl" />
                </asp:Panel>
                <div style="padding-right: 10px; text-align: right; width: 100%;" runat="server" id="Pager">
                    <div style="display: inline-block;">
                        <asp:Button ID="FirstButton1" runat="server" CssClass="button" OnClick="FirstButton1_Click" Text="First" />
                    </div>
                    <div style="display: inline-block;">
                        <asp:Button ID="PrevButton2" runat="server" CssClass="button" OnClick="PrevButton2_Click" Text="&lt;&lt; Previous" />
                    </div>
                    <div style="display: inline-block;">
                        <asp:Label ID="lblCurrentPage" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div style="display: inline-block;">
                        <asp:Button ID="NextButton3" runat="server" CssClass="button" OnClick="NextButton3_Click" Text="Next &gt;&gt;" />
                    </div>
                    <div style="display: inline-block;">
                        <asp:Button ID="LastButton1" runat="server" CssClass="button" OnClick="LastButton3_Click" Text="Last" />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:DataList ID="PublicDataList1" runat="server" CellSpacing="2" OnItemDataBound="PublicDataList1_ItemDataBound" Width="100%" CssClass="datalistClass">
                    <HeaderTemplate>
                        <h2>More news from

                            <asp:Label ID="PublicFeedNameLabel1" runat="server" Text='<%#RList.MNR_Classes.RSSConsumer.getFeedName(SingleRSSFeed,c) %>'></asp:Label></h2>
                    </HeaderTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                    <ItemTemplate>
                        <div>
                            <div>
                                <asp:Label ID="Label2" runat="server" CssClass="cdtime" Text='<%# RList.MNR_Classes.CUnit.getCustomDate( Eval("ActivityDate")) %>'></asp:Label>
                            </div>
                            <uc1:UserReview ID="PublicUserReview2" runat="server" />
                            <div>
                                <asp:HiddenField ID="PublicHiddenField4" runat="server" Value='<%# Eval("ActivityID")%>' />
                                <asp:HiddenField ID="PublicHiddenField5" runat="server" Value='<%# Eval("ActivityType")%>' />
                                <asp:HiddenField ID="PublicHiddenField6" runat="server" Value='<%# Eval("LeadRole")%>' />
                            </div>
                        </div>
                        <hr />
                    </ItemTemplate>
                </asp:DataList>
            </asp:View>
        </asp:MultiView>
        <div style="width: 100%;" class="align-right mobile-align-center">
            <asp:HyperLink ID="MoreNewsHyperLink2" CssClass="button" runat="server">View More News</asp:HyperLink>
            <asp:Button ID="LinkButton1" CssClass="button" runat="server" OnClick="LinkButton1_Click1" Text="Show More"></asp:Button>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>