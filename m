Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D6ACCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 21:35:16 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.8380.1760218513981196735
 for <docs@lists.yoctoproject.org>;
 Sat, 11 Oct 2025 14:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=gbPUjxJR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025101121350893bc802b71000207de-zdngct@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025101121350893bc802b71000207de
        for <docs@lists.yoctoproject.org>;
        Sat, 11 Oct 2025 23:35:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Sma2MyehG7lQvL7tKHcr0iVg8/X3xTPrTpMgqKbG3gA=;
 b=gbPUjxJRw09S6sBu+DpNvxuyJ2CFz2vghAtp8IovH0St2z6GwqQxyxSsEUbRusxd5nmPEE
 OBut+5/VCcwwUJezlKNhr6n7uwnvGjD6ThpOkv5vLgD/krrioNsIu5yXNywYocIvBYhrwX9s
 h09n49RnYDsV3gDxcIjzGB9Evo+A/h53zPIPB9el2ecukaf8T7hqPMbyHT3CNWlzVg2rScbx
 eh52wWKueMhcxPj5SBHX5ME05Uv2ZyB4K8Z2GtGew72WsjyYE4us0U6g3t0S4kBZa/0qVlHL
 wqK1BOeo6NhS+F8n05D7P/EN0TtWEyfUm6m1q8/UQDxi/IDV6rgE19ng==;
From: Peter Marko <peter.marko@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] vulnerabilities: update nvdcve file name
Date: Sat, 11 Oct 2025 23:34:55 +0200
Message-Id: <20251011213455.4168626-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 11 Oct 2025 21:35:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7684

From: Peter Marko <peter.marko@siemens.com>

The filename is outdated as its version was already bumped and there are
also different files for different feed choices.
Use glob to match any available file.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 documentation/dev-manual/vulnerabilities.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index f5f9fe3a0..22b85d53d 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -314,7 +314,7 @@ products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
 The CVE database is stored in :term:`DL_DIR` and can be inspected using
 ``sqlite3`` command as follows::
 
-   sqlite3 downloads/CVE_CHECK/nvdcve_1.1.db .dump | grep CVE-2021-37462
+   sqlite3 downloads/CVE_CHECK/nvd*.db .dump | grep CVE-2021-37462
 
 When analyzing CVEs, it is recommended to:
 

