Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC51C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:20:31 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.3489.1713118830177276889
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 11:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kfbK/GUp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BE20FF802;
	Sun, 14 Apr 2024 18:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713118828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emishvQv61B3gaJujG1aekhUTUoY7vE4yxsaM7g63t8=;
	b=kfbK/GUpMG+DBcno1T/Jd1mSHig81WxY4Y4X/fyUMfuxcTkp+9Qm8Q4cNN6ftAldrnt8pH
	yYMwTWdrxUk4TgnQZTU1HZe09JtXih/Z+kBauoWp/ifGKZ+hZu1En2VgtjKu+Nq9VHMQBN
	+M8NUvXNPGdTDzjxMz/z9ewIsYgEmFyVHz6cuXmuKz+u6XwCZ8ePbbOgGS8KC4QcQAyNSu
	w4TpH9I1JOE6pSlrCaK+6JATKOP6EY7moJ4VRVChGvyO7EjUtU/sX6e7Euf+60UdzeKuCU
	6dhVLUu8k4MqfKO+/Z7gK7DkNTiRmF8RUH4cyrWVGPxt4bfieyBUNnl/4NAQ/A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 5/9] manuals: add initial sphinx-lint support
Date: Sun, 14 Apr 2024 20:20:07 +0200
Message-Id: <20240414182011.994356-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
References: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 18:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5129

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
index 20dab5725c..4e0af4bd30 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -53,6 +53,9 @@ stylecheck:
 	vale sync
 	vale $(VALEOPTS) $(VALEDOCS)
 
+sphinx-lint:
+	sphinx-lint $(SOURCEDIR)
+
 epub: $(PNGs)
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
diff --git a/documentation/README b/documentation/README
index 8035418cac..b60472fcbf 100644
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
+ $ make sphinx-lint
+
 Sphinx theme and CSS customization
 ==================================
 
-- 
2.34.1


