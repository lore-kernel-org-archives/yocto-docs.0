Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD47CC3527D
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.3539.1650591648439528537
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=EXeo14wN;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id A2DD020E6569; Thu, 21 Apr 2022 18:40:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A2DD020E6569
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1650591647;
	bh=mO7s6KFjVMGVOC54L3Es0CsNjABi9g5umjHR/zl8sNY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EXeo14wNkKyl9Rb/XJzhaWvVNUkmGrSuqGcc+szmDTeWyAl9pkLjdHMJ/ND1corWs
	 BYZVq+fsRYzPbXsl3pUuo6LVP4zlh2ezIJTnRzged+h5QYeZaAEzFR5PUn0W0B4kTE
	 RvcHHQkT9v5UdVKRl1xBjOShay5O6GoX1gMCwnhI=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/9] ref-manual: add a note about hard-coded passwords
Date: Thu, 21 Apr 2022 18:40:35 -0700
Message-Id: 
 <52c5571a8664a7547caed420ea83d77ab5d21d0f.1650591341.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2825

From: Paul Eggleton <paul.eggleton@microsoft.com>

It seems prudent to point out that hard-coding passwords in the manner
detailed in the example is not a good idea in production. This type of
mistake has unfortunately been made by many device vendors (outside of
the Yocto Project context) leading to security vulnerabilities.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 6ba792d..13cc2bb 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -576,6 +576,13 @@ Finally, here is an example that sets the root password::
        usermod -p '${PASSWD}' root; \
        "
 
+.. note::
+
+   From a security perspective, hardcoding a default password is not
+   generally a good idea. It is recommended that you do not do this if you are
+   building a production image.
+
+
 .. _ref-classes-features_check:
 
 ``features_check.bbclass``
-- 
1.8.3.1


