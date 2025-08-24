Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B762ACA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:54:11 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.18262.1756047246366284114
 for <docs@lists.yoctoproject.org>;
 Sun, 24 Aug 2025 07:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=USFYl3HR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250824145403be8207fcf30ea17dc5-twfhgb@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250824145403be8207fcf30ea17dc5
        for <docs@lists.yoctoproject.org>;
        Sun, 24 Aug 2025 16:54:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=brOXHxXhPcxQXm1HOMLoR0cWygfv/um0noSpUp79RQ0=;
 b=USFYl3HR+DI2T1FCHAzgNANk5ENpWYY454g+rq9n3mKm1Redy6G90xVeDEceWas39k3t7i
 K5xehu5rngl12mBMowbpa9WP5uS8IP1N0uDR9oc2waf2MiEi2umtRFi641uyLnSWOCdClAi6
 /rymN84rdqFr6aeM6XaV68KLywgXO6lWt9zPt4BEV6DZ1jBaEzO/w7xMJfCiQCr1hx+DaAHK
 bGAAqHAEdvjMGD//iwBp3SPlsSoqCquTtUCmU5ZtB5f+XHv297/8r+QsWYlnpGW9ohN1Urvz
 wZ+J3iiD/7z13FvtuaP3PhiVK8x5SjbFMxprWfFT9E/Xlbs9zsZjGQUQ==;
From: Peter Marko <peter.marko@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] vulnerabilities: update nvdcve file name
Date: Sun, 24 Aug 2025 16:53:16 +0200
Message-Id: <20250824145316.1098911-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 24 Aug 2025 14:54:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7463

From: Peter Marko <peter.marko@siemens.com>

The filename is outdated as its version was already bumped and there are
also different files for different feed choices.
Use glob to match any available file.

Also the directory changed to CVE_CHECK2 meanwhile, so Update it, too.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 documentation/dev-manual/vulnerabilities.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index 5331a63991..6cc7f04944 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -318,7 +318,7 @@ products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
 The CVE database is stored in :term:`DL_DIR` and can be inspected using
 ``sqlite3`` command as follows::
 
-   sqlite3 downloads/CVE_CHECK/nvdcve_1.1.db .dump | grep CVE-2021-37462
+   sqlite3 downloads/CVE_CHECK2/nvd*.db .dump | grep CVE-2021-37462
 
 When analyzing CVEs, it is recommended to:
 

