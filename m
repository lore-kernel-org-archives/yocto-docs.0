Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC2BC77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 17:25:01 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.1607.1750785893450381631
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 10:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=VaUbKeUX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20250624172448fb233ccd74ab22f3e3-n24h2g@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250624172448fb233ccd74ab22f3e3
        for <docs@lists.yoctoproject.org>;
        Tue, 24 Jun 2025 19:24:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uZILsDVNxuQuoTz7x4gMnqH7/cGrLMshAvnn6pgWZHg=;
 b=VaUbKeUXKsmZF8aATfzh88NR5iOogyUiZQolMRjHMfwJvvEjTV+W/DK78JZzHmFJiHHOzU
 8EOJ0x/6ksCCbryFDkzztCMBoheMj+U+1874fueg1DQcdYLjQXWPL4NpFGBpNJ/JXopt3Tew
 FtUk+0LARA/XWONvrcay7kDxVYN4pvvCLW6UVRKqUEnjVrs4AaoGwxITlRToAMSskV6jQmgz
 XmWTQZgppWSipEEp1Ftm7+RS6/w98D1PwCsFvhwhFGs+r+tiS0EnhCsHkgqKQ+xS8dq0DxZ3
 0+GB4cIbeUUECVj1MQYHMTp3cySK3vm+bXRDDX1jTZ0aNytumulkamdA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] ref-manual/yocto-project-supported-features: add ppc maintainers
Date: Tue, 24 Jun 2025 19:24:39 +0200
Message-ID: <20250624172439.1667237-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 17:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7217

From: Adrian Freihofer <adrian.freihofer@siemens.com>

PowerPC (32-bit) remains relevant for our use cases, and we aim to
maintain support as long as it is feasible with reasonable effort.

For transparency, our primary focus is on maintaining
core-image-minimal. Support for more complex images may be limited
unless additional contributors join, as ongoing testing and maintenance
of these images may not be feasible otherwise.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/yocto-project-supported-features.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/yocto-project-supported-features.rst b/documentation/ref-manual/yocto-project-supported-features.rst
index 06e298cbe5c..283c79d4cc0 100644
--- a/documentation/ref-manual/yocto-project-supported-features.rst
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -209,7 +209,8 @@ builder(s):
      - Builder(s)
    * - :wikipedia:`PowerPC (32-bit) <PowerPC>`
      - PowerPC architecture testing (32-bit)
-     - TBD
+     - Peter Marko,
+       Adrian Freihofer
      - qemuppc,
        qemuppc-tc
    * - :oe_git:`meta-openembedded </meta-openembedded>`
-- 
2.49.0


