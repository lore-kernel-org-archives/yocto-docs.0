Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7722FC6FD1F
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 16:36:19 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.876.1711816573428505001
 for <docs@lists.yoctoproject.org>;
 Sat, 30 Mar 2024 09:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zk7EyenR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB40F60003;
	Sat, 30 Mar 2024 16:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711816571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jufFuxR/x5qNhU+KPJO1Tm6NQULfu1LTfFFTFwPmPrg=;
	b=Zk7EyenRayOrqCCxin5K/6d6Yi+MAGNDVPjFlZg0lRszy8Z9/ymQ210as/DHruajhvEa82
	0x6Z+RuZSb+uRqDhv0iMwsYeaXHalccj+81Hu3b/rEnTqtFMVQc1FgBht+rgqBjPm0coH5
	y6O1VreK0juIiG+wMIj/ctrp1qncTVPOBMiuGnSa3lP/xmwnVUNhkbjYF1CJAYFNjbz2ff
	zKNCTv6Q5ax3CcnRndx+flqKNHi1KJ6nk24C66jAurOIeZI2q4o8MM2dXQrTmFiYApER+y
	kljontrj1O7kAWZxG2sTH6gFLqoaf3pseEz7ITrdzfrMDm4NujDHZhchxdV62A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: add initial sphinx-lint support
Date: Sat, 30 Mar 2024 17:36:09 +0100
Message-Id: <20240330163609.1735506-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 30 Mar 2024 16:36:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5033

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Makes it possible to catch errors not reported by sphinx,
such as idle spaces. After customization, this should be used
to enforce our syntax conventions, such as two spaces after a "-"
character to introduce a list item.

Just run "make sphinx-lint".

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/Makefile |  3 +++
 documentation/README   | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/documentation/Makefile b/documentation/Makefile
index f3b775b3ec..cacb51c036 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -53,6 +53,9 @@ stylecheck:
 	vale sync
 	vale $(VALEOPTS) $(VALEDOCS)
 
+sphinx-lint:
+	sphinx-lint
+
 epub: $(PNGs)
 	$(SOURCEDIR)/set_versions.py
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
diff --git a/documentation/README b/documentation/README
index 8035418cac..e1451789b6 100644
--- a/documentation/README
+++ b/documentation/README
@@ -165,6 +165,20 @@ To run Vale:
 
  $ make stylecheck
 
+Link checking the Yocto Project documentation
+=============================================
+
+To fix errors which are not reported by Sphinx itself,
+the project uses sphinx-lint (https://github.com/sphinx-contrib/sphinx-lint).
+
+To install sphinx-lint:
+
+ $ pip install sphinx-lint
+
+To run sphinx-lint:
+
+ $ make sphinxlint
+
 Sphinx theme and CSS customization
 ==================================
 
-- 
2.34.1


