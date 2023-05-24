Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560B3C77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:27:33 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.136.1684949250206197737
 for <docs@lists.yoctoproject.org>;
 Wed, 24 May 2023 10:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NSZrhlEv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0930560007;
	Wed, 24 May 2023 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684949248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p340AG4c5wAU+HkntgnNkltdT18J2B5EiaWWsPNs9ys=;
	b=NSZrhlEvpWUfFMfMLGtWQPTEll6d+w4id63iHOLQ1R9/UQ2mt+rgn7ssU+eQ7YYmHIo4Vo
	jwiZImit4+Na9lvByo8RylLyTeUlWsvYbQ+IqEzyV3TsCm2Xzm2AzDbQUtRWQgqwG3Jhah
	BpS5Xv5GtjdtUQ2UHM69hw9PUyeSUbHCsOHisDI8LFSqUSFm9FXFAatuW8CtQyxIdfXW/X
	U1lEWYcmfl5MezZ7we9Xeuw9ajnaZvOSFrONSuIOgedJrfzTOxQnp3pVVRqhiLdIpwNhaI
	xvLKZWwDgl0GmlCzxWvAxylalFAZVD0dzj+ZsfC6JDea/dc0PCzZ3a/etoFwdw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] conf.py: add macro for Mitre CVE links
Date: Wed, 24 May 2023 19:27:23 +0200
Message-Id: <20230524172724.393781-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 May 2023 17:27:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3959

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Useful for CVEs that are not found (yet) on https://nvd.nist.gov/

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index bd45a73fa6..a64685ec9b 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -91,6 +91,7 @@ rst_prolog = """
 # external links and substitutions
 extlinks = {
     'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
+    'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),
     'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
     'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
-- 
2.34.1


