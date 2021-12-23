Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C923EC433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 10:37:21 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.31396.1640255840237437257
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Dec 2021 02:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=OS5K9D/Z;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1640255840;
  x=1671791840;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ESDZljT44I0WyPq4f2F8U08kJoMF3fD5w3rOH8V1wOk=;
  b=OS5K9D/ZobJapJujFvKcf+wRg2JvsgvKi8PKvI5aby9z2u6XPxWpEh6i
   /PvTb67Q9YXjY6Jd47HXhf0VNU52kmkSHCDGgbE+jR5xGEAtwloedQlFP
   fSdxIU1tdoe+zSHpt5oPM51wqbUB+d9ZKzE7gkBRRGe0ZHtZvJztcOE6N
   RdnUcUohaieG0uc+O5ueC1dxh7/70rsFFh3WPzAVNOYBVCp4h+kid9ezc
   vDkS5LSlkiitML8SgAUwGakN/9VJAX6LRU1uwAXslY5A6BX9br1y9N0Y6
   gVVs3i65CUEhq7A2oLCAXHhCfMWKfKJL4ED4c67PbKSXTJtFUFtZyIJyP
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: Add documentation of PACKAGE_DEBUG_FILE_SUFFIX
Date: Thu, 23 Dec 2021 11:37:13 +0100
Message-ID: <20211223103713.4552-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Dec 2021 10:37:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2321

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This of course assumes that the corresponding change to OE-Core is
accepted.

 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e5216b3f36..52adcf1e4f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5085,6 +5085,14 @@ system and gives an overview of their function and contents.
       result of the package manager in use, see the
       ":ref:`package.bbclass <ref-classes-package>`" section.
 
+   :term:`PACKAGE_DEBUG_FILE_SUFFIX`
+      This suffix is added to the names of all files with debug symbols produced
+      by split_and_strip_files(). It can be used to make the debug files
+      produced by one recipe unique to avoid them conflicting with identically
+      named debug files produced by another recipe. This may be needed since
+      while the target files may be split in multiple packages, the debug
+      files for one recipe are all in one package.
+
    :term:`PACKAGE_DEBUG_SPLIT_STYLE`
       Determines how to split up and package debug and source information
       when creating debugging packages to be used with the GNU Project

