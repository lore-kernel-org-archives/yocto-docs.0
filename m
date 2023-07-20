Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FE7EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 12:47:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.12017.1689857259739646950
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Jul 2023 05:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K2UFbbKs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E66A2E0012;
	Thu, 20 Jul 2023 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689857257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p340AG4c5wAU+HkntgnNkltdT18J2B5EiaWWsPNs9ys=;
	b=K2UFbbKsECHE+sOen6BcXCrgMRT9CYq1nI24YDCdHFm6i+pyZ08SUdbGHIf7L76SfTjaeC
	O8/i3nD/XBZ4qZX+0iu13IpqASfURdEP/hz+jEBxXPX2VKMHpgRoRwH7NKob2F64nk4pVh
	qm1Pbd9NSCjit/aSSc00JWBV3oAsv9uwZscP+i9R/b2QufBgtGoSDpK1a9P14Cpi0N85t6
	P6oODYnFY90iTtV0fW2Kbn6mBFmtn0ffHqMnChcDEHAJ1zl9qm5VurXloOKMbofh5Gqogk
	Y8tg1WVU/ZAEacUGb3bY1tnq+uu3AkRhdPcHOfeTgh6DclXr6cjcbCk9cYf8rQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/3] [mickledore] conf.py: add macro for Mitre CVE links
Date: Thu, 20 Jul 2023 14:47:22 +0200
Message-Id: <20230720124724.333252-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Jul 2023 12:47:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4069

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


