<%@ tag trimDirectiveWhitespaces="true" %>
<%@ tag description="Feedback Response Comment Form With Visibility Options" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ tag import="teammates.common.util.Const" %>
<%@ attribute name="responseIndex" required="true" %>
<%@ attribute name="qnIndex" required="true" %>
<%@ attribute name="frc" type="teammates.ui.template.FeedbackResponseCommentRow" required="true" %>
<%@ attribute name="formType" required="true" %>
<%@ attribute name="textAreaId" required="true" %>

<c:set var="isEditForm" value="${formType eq 'Edit'}"/>
<c:set var="isAddForm" value="${formType eq 'Add'}"/>
<c:set var="divId" value="${qnIndex}-${responseIndex}"/>

<div class="responseComment${formType}Form"<c:if
    test="${isEditForm}"> style="display: none;" id="responseCommentEditForm-${divId}"</c:if>>
  <div class="form-group form-inline">
    <div class="form-group text-muted" style="margin-left:1em;">
      <p>
        Your comment about the above response
      </p>
    </div>
  </div>
  <div class="form-group">
    <div class="panel panel-default panel-body" id="${textAreaId}-${divId}">
      ${frc.commentText}
    </div>
    <input type="hidden" name="<%= Const.ParamsNames.FEEDBACK_RESPONSE_COMMENT_TEXT %>">
  </div>
  <div class="col-sm-offset-5">
    <input type="button" class="btn btn-default hide-frc-${fn:toLowerCase(formType)}-form"
           value="Cancel" data-responseindex="${responseIndex}" data-qnindex="${qnIndex}">
  </div>
  <c:if test="${isEditForm}">
    <input type="hidden" name="<%= Const.ParamsNames.FEEDBACK_RESPONSE_COMMENT_ID %>-${divId}" value="${frc.commentId}">
  </c:if>
</div>
