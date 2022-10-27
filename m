Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5FBFA3742
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 11:39:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.5347.1666870788646797863
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 04:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ju/NUCVd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5D29DC0002;
	Thu, 27 Oct 2022 11:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666870786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mTBseegrJLgMbzJNKCkYNg0DYn7WGKypXybVOI1VMTs=;
	b=ju/NUCVdtJ1wX7BqJU/J/nqtMbns2irZm/nVutS96FsL8a52dQn8IXVBdVWTIjr+OH0ojM
	16ZTaCiFNxWSFGVTSDkRecGyxRquDjqkwA5FSZX2Z6qtEqnQk56xBrSNmu7zcZi24vmMqj
	aBE+vF8lCOb6Hu7Adc8KrpDn3YqjOJv/HKZVBv5Yw7XPdcGJQeo9GnM5DiomUs/BBvloVD
	42/nu2+2EylPwK7X4prPqwjsEV2sA2SLNFDwLLyKdzM/Ba0DvU2l01MXF3a1iay+PjKd3n
	1e3/CPME+qWLvK95MO9j5DH3IpdCZAl18XmDS2ZXxWD2wKHD5uyYvgRROItzHQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/3] Documentation/README: formalize guidelines for external link syntax
Date: Thu, 27 Oct 2022 13:39:39 +0200
Message-Id: <20221027113941.34972-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Oct 2022 11:39:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3425

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/README b/documentation/README
index 6333f0496a..c27ed86a33 100644
--- a/documentation/README
+++ b/documentation/README
@@ -275,6 +275,19 @@ websites.
 More information can be found here:
 https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html.
 
+For external links, we use this syntax:
+`link text <link URL>`__
+
+instead of:
+`link text <link URL>`_
+
+Both syntaxes work, but the latter also creates a "link text" reference
+target which could conflict with other references with the same name.
+So, only use this variant when you wish to make multiple references
+to this link, reusing only the target name.
+
+See https://stackoverflow.com/questions/27420317/restructured-text-rst-http-links-underscore-vs-use
+
 Anchor (<#link>) links are forbidden as they are not checked by Sphinx during
 the build and may be broken without knowing about it.
 
-- 
2.34.1


