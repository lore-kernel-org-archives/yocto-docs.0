Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2F0C433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 19:55:50 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.37458.1640289348974623438
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Dec 2021 11:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=J19GsD+q;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1640289349;
  x=1671825349;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gf3izGK5dWSC+T0QDxr+RNz1sIlOFDyu7z87QlwQl3E=;
  b=J19GsD+q/HrJXvG6COWEoa4/DSeOVye+Q1LjoIQz7aprrihmIIDu7bSo
   3xSvk7bEZKcsQFw4G57boFUezijVWTnwTmwXaLOJSLVPVIuSJTMFERZl/
   UGo5tSJc3lh5ijzQazS0m9HlWl3QSFbxW32v/W7n4+vdFAoMHZgbyThmD
   Cw5zv5vdtpdELzuKloh7pSZdisstcwQ6obr1rOZmQ38oAhE3JUXhjz5ar
   cZBWFs0tD5iBy50JBQKbwRyGM/Ud/ZqtbibHR3ZM9fmplZal18JMsmzfT
   N+AYKz5vSZ7qCslfRV8kIH/sWoQh5YezR/OZId/xOGAgOXWdmM4D4m+o+
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCHv2] ref-manual: Add documentation of PACKAGE_DEBUG_FILE_SUFFIX
Date: Thu, 23 Dec 2021 20:55:43 +0100
Message-ID: <20211223195543.28919-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Dec 2021 19:55:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2323

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Removed the reference to split_and_strip_files().

 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e5216b3f36..c7c9e31f05 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5085,6 +5085,14 @@ system and gives an overview of their function and contents.
       result of the package manager in use, see the
       ":ref:`package.bbclass <ref-classes-package>`" section.
 
+   :term:`PACKAGE_DEBUG_FILE_SUFFIX`
+      This suffix is added to the names of all files with debug symbols that go
+      into the dbg package. It can be used to make the debug files produced by
+      one recipe unique to avoid them conflicting with identically named debug
+      files produced by another recipe. This may be needed since while the
+      target files may be split in multiple packages, the debug files for one
+      recipe are all in one package.
+
    :term:`PACKAGE_DEBUG_SPLIT_STYLE`
       Determines how to split up and package debug and source information
       when creating debugging packages to be used with the GNU Project

