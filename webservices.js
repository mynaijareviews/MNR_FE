/// <reference path="jquery-3.1.0.intellisense.js" />
/// <reference path="jquery-3.1.0.min.js" />

var NONE = "-1";
var LIKE = "0";
var DISLIKE = "1";
function processLikeComment(val) {
    var IsloggedInHiddenField1 = $(val).closest('div.likeSection').find('input[id=IsloggedInHiddenField1]');
    var ReviewIDHiddenField2 = $(val).closest('div.likeSection').find('input[id=ReviewIDHiddenField2]');
    var businessIDHiddenField7 = $(val).closest('div.likeSection').find('input[id=businessIDHiddenField7]');
    var InitialStateHiddenField3 = $(val).closest('td').find('input[id=CommentInitialStateHiddenField1]');
    var PreviewGuidHiddenField8 = $(val).closest('td').find('input[id=CommentIDHiddenField1]');
    var UserRoleHiddenField9 = $(val).closest('div.likeSection').find('input[id=UserRoleHiddenField9]');
    var UserIDHiddenField4 = $(val).closest('div.likeSection').find('input[id=UserIDHiddenField4]');
    var CommentTypeHiddenField1 = $(val).closest('td').find('input[id=CommentTypeHiddenField1]');

    if ($(IsloggedInHiddenField1).val() == "True") {
        // Run Web Service Here
        var service = new MNRService.MNR_Services();
        service.set_enableJsonp(true);
        service.WebLikeService(new Date().getTime(), $(IsloggedInHiddenField1).val(), parseInt($(ReviewIDHiddenField2).val()), parseInt($(businessIDHiddenField7).val()), parseInt($(InitialStateHiddenField3).val()), parseInt($(CommentTypeHiddenField1).val()), $(PreviewGuidHiddenField8).val(), $(UserRoleHiddenField9).val(), parseInt($(UserIDHiddenField4).val()));

        var initialState = $(InitialStateHiddenField3).val();
        if (initialState == NONE) {// Neutral
            processButtonDisplay(val, true, true);
            $(InitialStateHiddenField3).val(LIKE);// Change to like
        }
            //else if (initialState == DISLIKE)// Originally Dislike Change to Like
            //{
            //    processButtonDisplay(val, true, true);
            //    var dislikeButton = $(val).closest('div.likeSection').find('span[id=DisLikeButton]');
            //    processButtonDisplay(dislikeButton, true, false);
            //    $(InitialStateHiddenField3).val(LIKE);// Change to like
            //}
        else if (initialState == LIKE)// Originally Like just remove
        {
            processButtonDisplay(val, true, false);
            $(InitialStateHiddenField3).val(NONE);// Change to neutral
        }
    }
}

function verifyPayment(val) {
    var service = new MNRService.MNR_Services();
    service.set_enableJsonp(true);
    var status = service.verifyTransaction(new Date().getTime(), val);
    if (status) {
        window.location = window.location.href.split("?")[0];
    }
}

function processLikeButton(val) {
    var IsloggedInHiddenField1 = $(val).closest('div.likeSection').find('input[id=IsloggedInHiddenField1]');
    var ReviewIDHiddenField2 = $(val).closest('div.likeSection').find('input[id=ReviewIDHiddenField2]');
    var businessIDHiddenField7 = $(val).closest('div.likeSection').find('input[id=businessIDHiddenField7]');
    var likeControlTypeHiddenField6 = $(val).closest('div.likeSection').find('input[id=likeControlTypeHiddenField6]');
    var InitialStateHiddenField3 = $(val).closest('div.likeSection').find('input[id=InitialStateHiddenField3]');
    var PreviewGuidHiddenField8 = $(val).closest('div.likeSection').find('input[id=PreviewGuidHiddenField8]');
    var UserRoleHiddenField9 = $(val).closest('div.likeSection').find('input[id=UserRoleHiddenField9]');
    var UserIDHiddenField4 = $(val).closest('div.likeSection').find('input[id=UserIDHiddenField4]');

    if ($(IsloggedInHiddenField1).val() == "True") {
        // Run Web Service Here
        var service = new MNRService.MNR_Services();
        service.set_enableJsonp(true);
        service.WebLikeService(new Date().getTime(), $(IsloggedInHiddenField1).val(), parseInt($(ReviewIDHiddenField2).val()), parseInt($(businessIDHiddenField7).val()), parseInt($(InitialStateHiddenField3).val()), parseInt($(likeControlTypeHiddenField6).val()), $(PreviewGuidHiddenField8).val(), $(UserRoleHiddenField9).val(), parseInt($(UserIDHiddenField4).val()));

        var initialState = $(InitialStateHiddenField3).val();
        if (initialState == NONE) {// Neutral
            processButtonDisplay(val, true, true);
            $(InitialStateHiddenField3).val(LIKE);// Change to like
        }
        else if (initialState == DISLIKE)// Originally Dislike Change to Like
        {
            processButtonDisplay(val, true, true);
            var dislikeButton = $(val).closest('div.likeSection').find('span[id=DisLikeButton]');
            processButtonDisplay(dislikeButton, true, false);
            $(InitialStateHiddenField3).val(LIKE);// Change to like
        }
        else if (initialState == LIKE)// Originally Like just remove
        {
            processButtonDisplay(val, true, false);
            $(InitialStateHiddenField3).val(NONE);// Change to neutral
        }
    }
}

function processDisLikeButton(val) {
    var IsloggedInHiddenField1 = $(val).closest('div.likeSection').find('input[id=IsloggedInHiddenField1]');
    var ReviewIDHiddenField2 = $(val).closest('div.likeSection').find('input[id=ReviewIDHiddenField2]');
    var businessIDHiddenField7 = $(val).closest('div.likeSection').find('input[id=businessIDHiddenField7]');
    var likeControlTypeHiddenField6 = $(val).closest('div.likeSection').find('input[id=likeControlTypeHiddenField6]');
    var InitialStateHiddenField3 = $(val).closest('div.likeSection').find('input[id=InitialStateHiddenField3]');
    var PreviewGuidHiddenField8 = $(val).closest('div.likeSection').find('input[id=PreviewGuidHiddenField8]');
    var UserRoleHiddenField9 = $(val).closest('div.likeSection').find('input[id=UserRoleHiddenField9]');
    var UserIDHiddenField4 = $(val).closest('div.likeSection').find('input[id=UserIDHiddenField4]');

    if ($(IsloggedInHiddenField1).val() == "True") {
        // Run Web Service Here
        var service = new MNRService.MNR_Services();
        service.set_enableJsonp(true);
        service.WebDisLikeService(new Date().getTime(), $(IsloggedInHiddenField1).val(), parseInt($(ReviewIDHiddenField2).val()), parseInt($(businessIDHiddenField7).val()), parseInt($(InitialStateHiddenField3).val()), parseInt($(likeControlTypeHiddenField6).val()), $(PreviewGuidHiddenField8).val(), $(UserRoleHiddenField9).val(), parseInt($(UserIDHiddenField4).val()));

        var initialState = $(InitialStateHiddenField3).val();
        if (initialState == NONE) {// Neutral
            processButtonDisplay(val, true, true);
            $(InitialStateHiddenField3).val(DISLIKE);// Change to dislike
        }
        else if (initialState == LIKE)// Originally like Change to DisLike
        {
            processButtonDisplay(val, true, true);
            var dislikeButton = $(val).closest('div.likeSection').find('span[id=LikeButton]');
            processButtonDisplay(dislikeButton, true, false);
            $(InitialStateHiddenField3).val(DISLIKE);// Change to dislike
        }
        else if (initialState == DISLIKE)// Originally DisLike just remove
        {
            processButtonDisplay(val, true, false);
            $(InitialStateHiddenField3).val(NONE);// Change to neutral
        }
    }
}

function processButtonDisplay(button, AlterValue, addValue) {
    $(button).toggleClass('bold-text');
    if (AlterValue) {
        var currentText = $(button).text();
        if (currentText.indexOf('.') >= 0) {
            var getNumber = currentText.split('.');
            var number = parseInt(getNumber[1]);
            if (addValue)
                number = number + 1;
            else
                number = number - 1;
            if (number > 0)
                currentText = getNumber[0].concat(". ").concat(number);
            else
                currentText = getNumber[0];
            $(button).text(currentText);
        } else {
            if (addValue) {
                $(button).text(currentText.concat(" . 1"));
            }
        }
    }
}

function makeProfilePic(radio) {
    $(radio).closest('.ImagesContainer').find(':radio').prop('checked', false);
    var id = $(radio).closest('td').find('#HiddenID').val();
    // do WebService
    var service = new MNRService.MNR_Services();
    service.set_enableJsonp(true);
    service.SetProfileImage(new Date().getTime(), id);
    $(radio).prop('checked', true);
}

function stopNotification(ele, id) {
    var userid = $('#NotificationUserIDHiddenField1').val();
    var usertype = $('#NotificationuserTypeHiddenField2').val();
    // do WebService
    var service = new MNRService.MNR_Services();
    service.set_enableJsonp(true);
    service.StopAskMNRNotifications(new Date().getTime(), id, parseInt(userid), usertype);

    $(ele).closest('.canRemove').toggle(300);
    var count = $('#NotificationCounterHiddenField1').val();
    count--;
    $('#NotificationCounterHiddenField1').val(count);
    if ($('#NotificationPanel3').text().indexOf('Collapse') > -1) {
        $('#NotificationPanel3').html('<span style="float:left">&#9660;</span> Collapse Ask MNR Notifications' + ' (<span id="CounterLabel1">' + count + '</span>)');
    } else {
        $('#NotificationPanel3').html('<span style="float:left">&#9658;</span> Expand Ask MNR Notifications' + ' (<span id="CounterLabel1">' + count + '</span>)');
    }
}

function stopNotificationSingle(ele, id) {
    if ($(ele).val() != 'Ok') {
        var userid = $('#UserIDHiddenField1').val();
        var usertype = $('#userTypeHiddenField2').val();
        // do WebService
        var service = new MNRService.MNR_Services();
        service.set_enableJsonp(true);
        service.StopAskMNRNotifications(new Date().getTime(), id, parseInt(userid), usertype);
        $(ele).text("Ok");
        $(ele).css("text-decoration", "none");
        $(ele).css("cursor", "none");
    }
}

function FollowBusiness(ele) {
    var userid = $('#UserIDHiddenField1').val();
    var bid = $('#BIDHiddenField2').val();
    // do WebService
    var service = new MNRService.MNR_Services();
    service.set_enableJsonp(true);
    service.FollowBusiness(new Date().getTime(), parseInt(bid), userid);
    $(ele).toggle(false);
    var followers = $('#FollowersHiddenField2').val();
    if (parseInt(followers) >= 1)
        $('#Followlbl').text((parseInt(followers) + 1) + ' Followers');
    else
        $('#Followlbl').text('1 Follower');
}

function AddToNewsFeed(val) {
    var sourceID = $(val).closest('td').find('input[name=mnr-source-id]').val();
    var IsloggedInHiddenField1 = $(val).closest('td').find('div.likeSection').find('input[id=IsloggedInHiddenField1]');
    var UserRoleHiddenField9 = $(val).closest('td').find('div.likeSection').find('input[id=UserRoleHiddenField9]').val();
    var UserIDHiddenField4 = $(val).closest('td').find('div.likeSection').find('input[id=UserIDHiddenField4]').val();

    if ($(IsloggedInHiddenField1).val() == "True") {
        // Run Web Service Here
        var service = new MNRService.MNR_Services();
        service.set_enableJsonp(true);
        service.AddToNewsFeed(new Date().getTime(), sourceID, parseInt(UserIDHiddenField4), UserRoleHiddenField9);
        $(val).text("Ok");
        $(val).css("text-decoration", "none");
        $(val).css("cursor", "none");
    }
}

function RemoveFromNewsFeed(val) {
    var sourceID = $(val).closest('td').find('input[name=mnr-source-id]').val();
    var IsloggedInHiddenField1 = $(val).closest('td').find('div.likeSection').find('input[id=IsloggedInHiddenField1]');
    var UserRoleHiddenField9 = $(val).closest('td').find('div.likeSection').find('input[id=UserRoleHiddenField9]').val();
    var UserIDHiddenField4 = $(val).closest('td').find('div.likeSection').find('input[id=UserIDHiddenField4]').val();

    if ($(IsloggedInHiddenField1).val() == "True") {
        // Run Web Service Here
        var service = new MNRService.MNR_Services();
        service.set_enableJsonp(true);
        service.RemoveFromNewsFeed(new Date().getTime(), sourceID, parseInt(UserIDHiddenField4), UserRoleHiddenField9);
        $(val).text("Ok");
        $(val).css("text-decoration", "none");
        $(val).css("cursor", "none");
    }
}

/// Script for Comments
function addNewRow(startObj) {
    var ImageSrcHiddenField1 = $(startObj).closest('div.likeSection').find('input[id=ImgSrcHiddenField1]');
    var UserNameHiddenField1 = $(startObj).closest('div.likeSection').find('input[id=UserNameHiddenField2]');
    var likeControlTypeHiddenField6 = $(startObj).closest('div.likeSection').find('input[id=likeControlTypeHiddenField6]');
    var parentDate = $(startObj).closest('div.likeSection').find('input[id=ParentDateHiddenField2]');
    var parentUserID = $(startObj).closest('div.likeSection').find('input[id=ParentIDHiddenField1]');
    var UserRoleHiddenField9 = $(startObj).closest('div.likeSection').find('input[id=UserRoleHiddenField9]');
    var UserIDHiddenField4 = $(startObj).closest('div.likeSection').find('input[id=UserIDHiddenField4]');
    var businessIDHiddenField7 = $(startObj).closest('div.likeSection').find('input[id=businessIDHiddenField7]');
    var cID = '';
    if ($(startObj).closest('div.likeSection').find('input[id=PreviewGuidHiddenField8]').val().length > 0) {
        cID = $(startObj).closest('div.likeSection').find('input[id=PreviewGuidHiddenField8]').val();
    } else {
        cID = $(startObj).closest('div.likeSection').find('input[id=ReviewIDHiddenField2]').val();
    }
    var text = $(startObj).closest('div.likeSection').find('#CommentText1').val();
    var reviewType = parseInt($(likeControlTypeHiddenField6).val());
    var ParentDatee = $(parentDate).val();
    var ParentUserIDD = $(parentUserID).val();
    var userRole = $(UserRoleHiddenField9).val();
    var userID = parseInt($(UserIDHiddenField4).val());
    var businessID = $(businessIDHiddenField7).val();
    var service = new MNRService.MNR_Services();
    service.set_enableJsonp(true);
    service.Comment(new Date().getTime(), text, cID, reviewType, ParentDatee, ParentUserIDD, userRole, userID, businessID);
    //Comment(string time, string text, string cID, int reviewType, string ParentDate, string ParentUserID, string userRole, int UserID)
    text = $(UserNameHiddenField1).val().concat('<br/>').concat(text);
    var tablestart = '<table class="commentTable"><tbody>';
    var tableend = '</tbody></table>';
    var first = '<tr><td><table><tbody><tr><td style="vertical-align: top; width: 40px">';
    var image = '<img src="'.concat($(ImageSrcHiddenField1).val()).concat('"/>').concat('</td><td style="white-space: pre-wrap;">');
    first = first.concat(image);
    var last = '</td></tr></tbody></table><hr/></td></tr>';
    var isEmpty = 1;
    if ($(startObj).closest('div.likeSection').find('#comments').has('table').length > 0) {
        isEmpty = 0;
    }
    if (isEmpty == 1) {
        first = tablestart.concat(first);
    }
    var newtext = first.concat(text, last);

    if (isEmpty == 1) {
        newtext = newtext.concat(tableend);
    }
    //  $('#myTable tbody:first-child').before(newtext);
    //$('#myTable tr:first').before(newtext);
    if (isEmpty == 1) {
        $(startObj).closest('div.likeSection').find('#comments').prepend(newtext);
    } else {
        $(startObj).closest('div.likeSection').find('#comments .commentTable tbody:first').prepend(newtext);
    }
    $(startObj).closest('div.likeSection').find('#CommentText1').val('');
    $(startObj).closest('div.likeSection').find('.CommentBox').hide(300);
}

function showCommentBox(ele) {
    $(ele).closest('div.likeSection').find('.CommentBox').show(300);
}

function HideCommentBox(ele) {
    $(ele).closest('div.likeSection').find('.CommentBox').hide(300);
}

function processComment(val) {
    var IsloggedInHiddenField1 = $(val).closest('div.likeSection').find('input[id=IsloggedInHiddenField1]');
    var ReviewIDHiddenField2 = $(val).closest('div.likeSection').find('input[id=ReviewIDHiddenField2]');
    var businessIDHiddenField7 = $(val).closest('div.likeSection').find('input[id=businessIDHiddenField7]');
    var likeControlTypeHiddenField6 = $(val).closest('div.likeSection').find('input[id=likeControlTypeHiddenField6]');
    var InitialStateHiddenField3 = $(val).closest('div.likeSection').find('input[id=InitialStateHiddenField3]');
    var PreviewGuidHiddenField8 = $(val).closest('div.likeSection').find('input[id=PreviewGuidHiddenField8]');
    var UserRoleHiddenField9 = $(val).closest('div.likeSection').find('input[id=UserRoleHiddenField9]');
    var UserIDHiddenField4 = $(val).closest('div.likeSection').find('input[id=UserIDHiddenField4]');

    if ($(IsloggedInHiddenField1).val() == "True") {
        // Run Web Service Here
        var service = new MNRService.MNR_Services();
        service.set_enableJsonp(true);
        service.WebLikeService(new Date().getTime(), $(IsloggedInHiddenField1).val(), parseInt($(ReviewIDHiddenField2).val()), parseInt($(businessIDHiddenField7).val()), parseInt($(InitialStateHiddenField3).val()), parseInt($(likeControlTypeHiddenField6).val()), $(PreviewGuidHiddenField8).val(), $(UserRoleHiddenField9).val(), parseInt($(UserIDHiddenField4).val()));

        var initialState = $(InitialStateHiddenField3).val();
        if (initialState == NONE) {// Neutral
            processButtonDisplay(val, true, true);
            $(InitialStateHiddenField3).val(LIKE);// Change to like
        }
        else if (initialState == DISLIKE)// Originally Dislike Change to Like
        {
            processButtonDisplay(val, true, true);
            var dislikeButton = $(val).closest('div.likeSection').find('span[id=DisLikeButton]');
            processButtonDisplay(dislikeButton, true, false);
            $(InitialStateHiddenField3).val(LIKE);// Change to like
        }
        else if (initialState == LIKE)// Originally Like just remove
        {
            processButtonDisplay(val, true, false);
            $(InitialStateHiddenField3).val(NONE);// Change to neutral
        }
    }
}