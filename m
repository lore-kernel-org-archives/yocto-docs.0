Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A227C433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 17:04:39 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.9340.1641575077453402938
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Jan 2022 09:04:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=lgHk03v/;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1641575078;
  x=1673111078;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HNsi6pcj0GaHL0v/z80quijdQRHKq1QnzRLyqhdbW5o=;
  b=lgHk03v/OfFRqP0/aax2B9S4RXpxme4G5gtIlO2iuJ/j0C/DOeghwqLs
   4ka07yL/ABG+jli0tAOV4Qyw+yiy9SoW3oEJJ+GZJ+Ma0L3MqtxnTIp9J
   EG8qWZl53pOE6H5PqXlSycsweV5zsvHYsYw8iDv4ulJz+EWgb/QOZKeZ+
   coMO34iq75Sfi7o8NxHRvWYTUakI+S8CquI5hD42fpvhSCIo2ZnpFU7tz
   6tQiSOxWHStMWS+Db9Nd061xNd8eCoJI0Hf+YW72JokhpaDWgmd4/NA2w
   ktnlGgklnJSIQ4blmnrvSMMZsY+GPCrLBJRqxRugJsgNofK/KAEs+KYQe
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCHv3] ref-manual: Add documentation of PACKAGE_DEBUG_FILE_SUFFIX
Date: Fri, 7 Jan 2022 18:04:33 +0100
Message-ID: <20220107170433.1958-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Jan 2022 17:04:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2355

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Removed the reference to split_and_strip_files().
PATCHv3: Changed "dbg package" to "``-dbg`` package".

 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e81a12030a..aaba23dbdf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5085,6 +5085,14 @@ system and gives an overview of their function and contents.
       result of the package manager in use, see the
       ":ref:`package.bbclass <ref-classes-package>`" section.
 
+   :term:`PACKAGE_DEBUG_FILE_SUFFIX`
+      This suffix is added to the names of all files with debug symbols that go
+      into the ``-dbg`` package. It can be used to make the debug files produced
+      by one recipe unique to avoid them conflicting with identically named
+      debug files produced by another recipe. This may be needed since while the
+      target files may be split in multiple packages, the debug files for one
+      recipe are all in one package.
+
    :term:`PACKAGE_DEBUG_SPLIT_STYLE`
       Determines how to split up and package debug and source information
       when creating debugging packages to be used with the GNU Project

