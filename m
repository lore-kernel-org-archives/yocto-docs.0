Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A7ECCD184
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 21:35:46 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.8450.1760218543369653863
 for <docs@lists.yoctoproject.org>;
 Sat, 11 Oct 2025 14:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=TJ8Ve7uO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202510112135401716f80ecb000207b4-oxdqle@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202510112135401716f80ecb000207b4
        for <docs@lists.yoctoproject.org>;
        Sat, 11 Oct 2025 23:35:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=0yDjYVugvSglAd8VMPuwc7h8jHpRQ45CAFe6v42mAFI=;
 b=TJ8Ve7uOQV5uaib5vm/+T6In68RisTkG+ptzyyOC46pUyNCBA83CFUmqHEXgGdeRvGbg27
 rbkIszrM8XNWB2IJkz7ncRlSDkoMlYR4AgDDVF8i83s6kHwlgDA0QworNkpMxssX0O5zcSPI
 P04ygC0eJ+vR7esIZHvC6OdDZk218LEBdBu9DtrWJRUO8IUWHYsDgkA4tE+yFtLPKhzggHV1
 AiniMLKk1vZa2Q1t1FNP2dI60ZqM+cF0liq93VWSDBCY9nD2tgWyMWQ5N8mKPAKWJrYHAH5C
 neywj4cs7csPsP64wCTsJoXTmU8iAS40V8aMCx8+Nqhb72oJAWzZXgNQ==;
From: Peter Marko <peter.marko@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [kirkstone][PATCH] vulnerabilities: update nvdcve file name
Date: Sat, 11 Oct 2025 23:35:37 +0200
Message-Id: <20251011213537.4168728-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 11 Oct 2025 21:35:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7685

From: Peter Marko <peter.marko@siemens.com>

The filename is outdated as its version was already bumped and there are
also different files for different feed choices.
Use glob to match any available file.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 documentation/dev-manual/vulnerabilities.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index eebb77902..53fad1613 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -235,7 +235,7 @@ products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
 The CVE database is stored in :term:`DL_DIR` and can be inspected using
 ``sqlite3`` command as follows::
 
-   sqlite3 downloads/CVE_CHECK/nvdcve_1.1.db .dump | grep CVE-2021-37462
+   sqlite3 downloads/CVE_CHECK/nvd*.db .dump | grep CVE-2021-37462
 
 When analyzing CVEs, it is recommended to:
 

