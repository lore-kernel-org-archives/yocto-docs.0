Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256E4EB2719
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 08:37:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41237.1770885471580046199
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 00:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dRPHBsyH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0E5A24E40CB5
	for <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D38C1606CA
	for <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 178C0119714D5;
	Thu, 12 Feb 2026 09:37:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770885469; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jvJf0pU2MkxCvTFZIRoVhypYEQDCJWDbqF7LrWrQD+o=;
	b=dRPHBsyHMe3N391qqObOKexltG9xbfuJ4LaR5yFGpVPUDM7OFvyUq0UCkaWpcQkvRh+fAN
	54yGptLRZuesA9GYeCTSjmeEoO4YTw9CiDlXV/qgd+HNCrQcJu+7cdusR4Q+YVTEPviTnA
	8KxXH5f9zyC11V2IChoIi7WQZx1fV6RPuzEpg54I4cOGf9SXkXo1FnGAeSqV2IqTZ46Lt9
	qX9svJN9bzlRgX3pEbWp5c8k+86hCd+omZhRZmvBKD+G5JMiUQFoKh1V0r59CPa/cBZucw
	TP6zgKdW5F0yzGbiZ7g6l31vWhVjEwV0NQoQINdoG112ND92lh1HU1rTh0G4iA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 12 Feb 2026 09:37:39 +0100
Subject: [PATCH 3/3] set_versions.py: set a more accurate DISTRO value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-fix-switchers-js-v1-3-16d95c74c328@bootlin.com>
References: <20260212-fix-switchers-js-v1-0-16d95c74c328@bootlin.com>
In-Reply-To: <20260212-fix-switchers-js-v1-0-16d95c74c328@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fzK6kkcLVQCa2japyrebNy8LzQcZgawNl1c04GtUk/g=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpjZFaFlYiC0uRFBhUn7xF3ym84vh7s4ExYh6bN
 33r/TiUG9aJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaY2RWgAKCRDRgEFAKaOo
 NmOID/9WhOFmqqI4tUmX0ggAT/kncbjQsByI/pkqwm8EACeYvfNipncNh/8M8MQCvIIEIuWOaom
 DQtHn/6XO9Tvx9FeddjwaaTdSjB3r0get+q24V6FBWx57yzdS3fhPbA9yx9YqGqCLUVFsYzqus4
 PeQ3Uyz3IoufXFr4OImlQmxmHceG6CPe4RABiZItL87lUDQvKogupONauaGadWxs2IunF5nfb3S
 UsshLfF9UYX3Zr9KInAJoDRsMGKiCjbQeSDPhFivL1TadrbYaJyC9lB5H02cOdCbjwLW0txXFSE
 frYMTQTzMLDKVKjcssg6q6yV8PjxXQRaCmhis78BHNQzEiuh/o5Yi5shdpOJywTW+AH38UC8sTt
 zH5/u+vGZdaG/6dQ7USnk8m4hXiFdt2dANt7knnt2UFEjtJu8TT8ZqxwhJe1LFGYH/6sUoASvjH
 vLAbf8ebHxod1J/DUNicMWCrnk5Ceccz2U+deQMWVJx+q48XQghAATtdddHwlT90cnv1PTWqsD2
 Koxf8mxVCGQsZ66GMnqvJ08t6iY6+kIPnEHE5YnUu/t1NPpXzrTelxdZkg8K4VYQegxDXRUMTEY
 PeS0sxflfDOLS0LOIRgAQFuk5UMn9e5UHuxyuHCvLVztKUXIDftQj1ACmFCVT5B8YKzx3GDDhsG
 cLNBaw8yzdO+sPw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8898

The changes from the previous commit make the current value inaccurate
in some situations, especially since this variable is used in some
commands. Take these situations into account and compute a more accurate
value for DISTRO.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 66e845c97..56cf3d34d 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -186,8 +186,30 @@ print("Latest release tag found is %s" % latestreltag)
 print("Release series calculated to be %s" % ourseries)
 print("Bitbake version calculated to be %s" % bitbakeversion)
 
+# The &DISTRO; replacement will be mostly right when just equaling ourversion.
+distro = ourversion
+# Few exceptions though:
+if "(latest)" in distro:
+    # we're on a branch tip, in that case the closest match is the latest tag
+    # from that branch. Some instructions rely on DISTRO to provide tag names,
+    # etc. so it makes sense provide the latest tag from that branch.
+    distro = latesttag
+elif distro in ["dev", "next"]:
+    # When building on master or master-next, make the distro the version of the
+    # devbranch.
+    distro = release_series[devbranch]
+elif head_commit:
+    # or we're on a random commit, in that case create a DISTRO value that
+    # contains the hash. this would for example be "5.3-4d2acc043".
+    # This will not happen when publishing the documentation from the
+    # autobuilder as we don't build specific commits - this should only happen
+    # for development.
+    distro = distro.split()[0] + f"-{head_commit}"
+
+print(f"DISTRO calculated to be {distro}")
+
 replacements = {
-    "DISTRO" : ourversion,
+    "DISTRO" : distro,
     "DISTRO_LATEST_TAG": latesttag,
     "DISTRO_RELEASE_SERIES": release_series[ourseries],
     "DISTRO_NAME_NO_CAP" : ourseries,

-- 
2.52.0


