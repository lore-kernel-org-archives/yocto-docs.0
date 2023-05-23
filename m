Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847A2C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 01:32:56 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.10864.1684805570784409167
 for <docs@lists.yoctoproject.org>;
 Mon, 22 May 2023 18:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ETR09OwD;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1684805571;
  x=1716341571;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yMNNHs8/XnipriK0VpG2E3NgoIr2c/48t4SQ2MGsDYw=;
  b=ETR09OwDZDhsrOazemzgvNBK+MduWNKC52r4kGJh9Yax5zryNTYMqAyv
   qaDvIfdRl06pyGafyxF86aO83KXLCRMkQJB255hPOeAnKI6xhhLb7GoOJ
   KTwzovNAO5wgCqq6qAS/Lb0ko0cCtgKJxdVss00j5fF/Xnpy0aPTmUBM+
   9ptVYrq7M1j9mMPB3WcrOrq2z7SmwW4FmW0Qyq4dktHztKp6fmpiQr5NC
   Zxd9g/h0kCmOkDv54E804WmXJwEmo7h6kQA+EuoIfY90R3ygTpK9Bk+mz
   C58td4hO00/5Nfdha2no5JVvsiBasl0TAh5D1GDvFOWM6kvOauT09EJ99
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] kernel-dev: Use protocol=https in a SRC_URI example
Date: Tue, 23 May 2023 03:32:42 +0200
Message-ID: <20230523013242.54314-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 May 2023 01:32:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3953

This matches the change in commit 139102a73d (recipes: Default to https
git protocol where possible) in openembedded-core.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/kernel-dev/advanced.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 35195135c4..355326de6e 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -730,11 +730,10 @@ reside in a separate repository. The OpenEmbedded build system adds the
 Metadata to the build as a "type=kmeta" repository through the
 :term:`SRC_URI` variable. As an
 example, consider the following :term:`SRC_URI` statement from the
-``linux-yocto_4.12.bb`` kernel recipe::
-
-   SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
+``linux-yocto_5.15.bb`` kernel recipe::
 
+   SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
+              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 ``${KMETA}``, in this context, is simply used to name the directory into
 which the Git fetcher places the Metadata. This behavior is no different

