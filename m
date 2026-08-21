Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAA5C5DF89
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:47:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6579.1787316432350082254
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 05:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iMyMimm0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D1281A1779;
	Fri, 21 Aug 2026 12:47:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01008604AA;
	Fri, 21 Aug 2026 12:47:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 888F311C770CD;
	Fri, 21 Aug 2026 14:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787316425; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=6ruT+Ubx1M27/tXcW3RtIVIjqde70JqFB1xST51daTE=;
	b=iMyMimm0EEwJnSy7PomNsImWGCxoNyP6qWMQ42G/oDtwZoopM8Guopk/kJV5EODofne1g+
	oriOxIpdYuc/Oc9B2KldPw6r8WrWOyLV6N2nnSBsOXhIJw67ZrqUAVCvTzuS15rMu+uMSW
	xWdj9puV52O8EaGng2aSlXuPxl9nN1DyFLTb/P7+XeSt5oF3zhicVpqFgnKgC89HQyuwTO
	0OmrV2+M/URtfCMB8wY6dWWu0JMiCyay54A39Ix2NsFpNpDUPdMNZM+wdy4BgfCqU+C/+A
	8e5CmdO9dVoW+Swb4NJescwaI8j4zBODvDqu83QIcIy4QXObgvX3SKmoyLWHnQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 21 Aug 2026 14:46:41 +0200
Subject: [PATCH] Makefile: remove unused O variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-remove-o-makefile-v1-1-fe61b5cf7fe1@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPrsQYyjFq5Q+GJ2026qRREUQ7
 27Ux29g/o0igiBSlW0UsEgUPyQUeUbNtx4+YGmTSSv9UE9dcEDvF7Dnvv7DSQeGcqY1BqWzltJ
 vDGlfr+brfTvO9odmOkO07wcfRHA6dQAAAA==
X-Change-ID: 20260821-remove-o-makefile-e0f4d44e3fbb
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=973nbnamQ8VLsNmHrhdi1ZOetBJxEW5ryoxjpvtJ0Oo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqiEjHtBdsFGjciboDMPdbMucvkXbbdMQAr4s2J
 /Vkj+ccUk2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaohIxwAKCRDRgEFAKaOo
 Nn8yEAC2k1WPXQMvMr9UYv/mnclK6UC7Ck9wcAJFv6vnwt9n387dluJ9w1uMdpGgPbt6pqflJsw
 1NSQrIqDogfHJmlW9sAne1VwqwvgWyQmBUm4NEkOPuxO8eKe1if5nD4B65hA8sAXmZjFdjT/ewB
 pXlaarjvQkymF7RTg4eBvIhNCtC9kszV6dkNNH8NdrNWuE8gxpBhcq4GnRhAKBM3RQ1Rbv+Au0U
 kmzOOEb6KcwbsOM9EQffzZBWIU80BBkm3lEMouEiUPwlRRFXNAq5rKbHRwn8uM4BWza+ox/YkoL
 yNZvqoKjkYsRRUtwtuosCNpWUpNeWFX+95K4j2WimrlvUFKd5RpeJQY9E54/8fdANdsgje3Sqf2
 vJNFK+gd7wMk8Q5sn7YljPUjjMcjjyhK6GLbabr8OgUx1m4/6dgK3XlJPAEVFDZwPd49/6xgmY+
 V+xPxouLz4iy/A5VnBvybs5o4MqjVHGct1f/YJC6kS/u0ko3jT6cioh6ItGO5zFrITgGCbPrREQ
 fjtUvyVls3aLeM+t6rGmKP9aBqB0oTF6YhM5BwqDUxoSVhaMEhDEqcYUg9/9h62dYev/p+vCSwk
 kSBiRW7kQBqU5Q13kDQtuniZlRmxkiHnZvCGrGBokOP7m9sWmjcSO2ZphjgzOHQXBLWFlD6yb99
 Pr5hEv6RothJsAQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 12:47:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10309

This variable isn't set or used anywhere, remove it and remove the
misleading comment.

Reported-by: "Robert P. J. Day" <rpjday@crashcourse.ca>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 87a6f8a8b..2df23ebf4 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -19,7 +19,7 @@ endif
 
 # Put it first so that "make" without argument is like "make help".
 help:
-	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
+	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)
 
 .PHONY: all checks help Makefile clean stylecheck publish latexpdf
 
@@ -51,12 +51,10 @@ sphinx-lint:
 #   Unable to read an entire line---bufsize=200000. Please increase buf_size in texmf.cnf.
 latexpdf:
 	$(SOURCEDIR)/set_versions.py
-	buf_size=10000000 LATEXMKOPTS="-silent" $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
+	buf_size=10000000 LATEXMKOPTS="-silent" $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)
 
 all: html epub latexpdf
 
-# Catch-all target: route all unknown targets to Sphinx using the new
-# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
 %:
 	$(SOURCEDIR)/set_versions.py
-	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
+	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)

---
base-commit: 3660b8085a5e790c1ea8bf75236fff4b216fe19c
change-id: 20260821-remove-o-makefile-e0f4d44e3fbb


