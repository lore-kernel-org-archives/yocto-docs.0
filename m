Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAEEC47088
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.4253.1665393876377836804
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=B7ADDXG0;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id D73B820EC312; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D73B820EC312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393875;
	bh=rnj7578j7w1apGOcrwaChP9yqpwURm1lNWXLOYISorI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B7ADDXG0i3vABQzMyDa1G3/YZW1pqDloOaPfsFVXKtg74qfNSvGh9Zj+gSVJgU0VK
	 6wjLHMXPB6ZdvjKCJPEN65K9KWGzXOCyrvAmNwuxT7QLZEpBkN64+/EaAM9id8JdcV
	 VDLoSQGvcHPchzxIiQzWdZnVvximRQ7Fz0nJX6Yk=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 02/34] ref-manual: add DISABLE_STATIC
Date: Mon, 10 Oct 2022 02:23:48 -0700
Message-Id: 
 <a0bae26915c6faead46a699585ded9ce26917ce5.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3306

From: Paul Eggleton <paul.eggleton@microsoft.com>

This was added all the way back in krogoth.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1685a26..8ea9834 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1812,6 +1812,18 @@ system and gives an overview of their function and contents.
       :term:`DESCRIPTION` takes the value of the :term:`SUMMARY`
       variable.
 
+   :term:`DISABLE_STATIC`
+      Used in order to disable static linking by default (in order to save
+      space, since static libraries are often unused in embedded systems.)
+      The default value is " --disable-static", however it can be set to ""
+      in order to enable static linking if desired. Certain recipes do this
+      individually, and also there is a
+      ``meta/conf/distro/include/no-static-libs.inc`` include file that
+      disables static linking for a number of recipes. Some software
+      packages or build tools (such as CMake) have explicit support for
+      enabling / disabling static linking, and in those cases
+      :term:`DISABLE_STATIC` is not used.
+
    :term:`DISTRO`
       The short name of the distribution. For information on the long name
       of the distribution, see the :term:`DISTRO_NAME`
-- 
1.8.3.1


