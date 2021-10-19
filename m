Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23D8C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 17:04:44 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.12840.1634663083219301931
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 10:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=RAey+ruD;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634663083;
  x=1666199083;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1ly6HFbdxPvMKriawEs/LnEJWsIUgV42rwekdOq9E9s=;
  b=RAey+ruDp1xDkSFJ72tORZfbU3yIUzInODASMRYUKwhGsk4qjoLZe7Vm
   rQwkePx698/V1VdfSUtisaBjUeACTWEizWyiKDTG92IM4VpN1jQsmU0JJ
   shsyBpfA/rAXUt+rvzbjegLR8lai8oGnQ8zdIu5TTdWTvGCTf9W7H2Dbn
   iHgHrebOKdPI2FnPp9WAVqu6Oxgepu46pfxbpI7vSpI1O/eb3yC984tor
   8KFfNCU7zhwodJRRqq/yshn5A3u7XcvN6XilSOBYTG75SUMUT3IYuwM2K
   xsn8cUE3TqV8U76LVstGIQeOoFuvXs5OfNqENNxxkgpnxp9ghiO3NsxCV
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: Document the EXTERNALSRC_EXTENSIONS variable
Date: Tue, 19 Oct 2021 19:04:34 +0200
Message-ID: <20211019170434.18700-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Oct 2021 17:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2004

EXTERNALSRC_EXTENSIONS is used to specify additional classes to inherit
when externalsrc is inherited.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This of course assumes that the corresponding change to OE-Core is
accepted.

 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 85f65cae35..8e7321fa20 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2175,6 +2175,12 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/common-tasks:building software from an external source`"
       section in the Yocto Project Development Tasks Manual.
 
+   :term:`EXTERNALSRC_EXTENSIONS`
+      When inheriting the :ref:`externalsrc <ref-classes-externalsrc>`
+      class, this variable contains a list of additional classes that will
+      also be inherited. This allows for extending the externalsrc
+      functionality when it is active.
+
    :term:`EXTRA_AUTORECONF`
       For recipes inheriting the :ref:`autotools <ref-classes-autotools>`
       class, you can use :term:`EXTRA_AUTORECONF` to specify extra options to

