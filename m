Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B7FC433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 02:26:08 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.1455.1643423167222695396
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 18:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YE75qt/8;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643423167;
  x=1674959167;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=d/ZizH278t4uBstiEczyAhjdFndcFHxa3SSQ0a8riRQ=;
  b=YE75qt/84mgK8ocaeo2WmtRlahGiZOqPAmOYnrtZfGPcbLnHQ/yjlhGb
   LnUB2irwPUEIjs4uIcQ5wfnpp5Eb3GXcCG38uNKn6ReuocJdhKme/lioV
   IYg5pz/U0hCj/rhf3L130iBSfW8x2h/9xfMTrst3hRUeJ+H0lGpUf8yBG
   wognP1zF3iI/Kr7qUscbhFO+41Ym8WNiOPK96kiy8GbeJqyhfh+Q24sgS
   Jg968ab9XJw+mwRd5d1IrOaiQx8N2Pt0SqomF9NQDfEAtGSGt01wu2kDN
   Aa7fqAciNdi0ZjRO7KYlPz7UlCbbkAifT7H0ZkHlUaBJ3G0xlWvAzhEUv
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH 2/2] test-manual: Correct two references to BB_SKIP_NETTESTS
Date: Sat, 29 Jan 2022 03:26:02 +0100
Message-ID: <20220129022602.17304-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220129022602.17304-1-pkj@axis.com>
References: <20220129022602.17304-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 29 Jan 2022 02:26:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2453

The environment variable used to disable network tests when running
bitbake-selftest was incorrectly referred to as BB_SKIP_NETTEST.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/test-manual/intro.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 4a3a97e29a..9c1a93cd40 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -178,10 +178,10 @@ Tests map into the codebase as follows:
 
       $ bitbake-selftest
 
-   To skip tests that access the Internet, use the ``BB_SKIP_NETTEST``
+   To skip tests that access the Internet, use the ``BB_SKIP_NETTESTS``
    variable when running "bitbake-selftest" as follows::
 
-      $ BB_SKIP_NETTEST=yes bitbake-selftest
+      $ BB_SKIP_NETTESTS=yes bitbake-selftest
 
    The default output is quiet and just prints a summary of what was
    run. To see more information, there is a verbose option::

