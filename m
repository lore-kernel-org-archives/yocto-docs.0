Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1FAC43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 14:34:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.27753.1654871646206007954
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 07:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H6CaiuJD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E3C58240006;
	Fri, 10 Jun 2022 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654871644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TIdexjGAxSKkO3XA7sxV49qB+3WyNzr661Uzxwa2BO0=;
	b=H6CaiuJDEDEX5nlfTvWJVTidV+HfTltCJY5/qzi8LlV1/tAqUmnTT44RpyZ9guAXY2L+GR
	We+el37c8wWNm6qJeq8tLmVRINzewP9++BsytWJjA5uY9C7x8SC615tw7dmFP3vayufbHD
	mpL+DvfTI1CV2KZRwzBiJB4daTIaQkzj0AX86ujXxbM5vXT47BZXxc8i1kB7GYQHRGTUqO
	2tf3Wk6qehfGZAsx24m5qmZyTiFN/BbQFyIRi63FLJDz57jwYGM0JKOfIhKnoitS8ojHFf
	+bCr/TsjyOqbUM+HTPKQADqnaRWnYbZ5Mjj7TkDH7Io0D0UDGmdiYIaM6om0RQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] Revert "docs: conf.py: fix cve extlinks caption for sphinx
 <4.0"
Date: Fri, 10 Jun 2022 16:34:01 +0200
Message-Id: <20220610143401.2239827-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jun 2022 14:34:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2978

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This reverts commit c9922076f5c1285d9cfd6aff8ce5b6635d88222f,
and allows to avoid this new warning which appears with Sphinx 5.0.1:

WARNING: extlinks: Sphinx-6.0 will require a caption string to contain exactly one '%s' and all other '%' need to be escaped as '%%'.
---
 documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index baf550e3e3..5a3ec58bc2 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -90,7 +90,7 @@ rst_prolog = """
 
 # external links and substitutions
 extlinks = {
-    'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-'),
+    'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),
     'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
     'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
-- 
2.34.1


