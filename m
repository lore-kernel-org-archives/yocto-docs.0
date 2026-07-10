Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E00DC44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:47:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.604.1783694831857886984
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 07:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DXWn3zSW;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2AEAC1A0F41
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F379360342
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19C8111BD1746;
	Fri, 10 Jul 2026 16:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783694829; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6zH5OFTCrlcqlypFrQyLzP8r5l0B8KIoRRtV1+ZAsHU=;
	b=DXWn3zSWBxZ/d9UDkH4X5XZaQfJa0thwpw0pUjJfylMGuKEs8+jELam0yL+3Biu+Mu1LrG
	ih/vlmEjYil/3/d/oN2m36e/5woJIxaBB3rtbTPXDBtvvOiAvFTP+fn8r+I7bQFUb7DloU
	LKoThEhkCZ95GwD1gpMlwlyy3o5xQ7FeNxxM2h0A9argqa6+tJA/2BNTBGTxPUHag9Q2wr
	1rguCbCkGtXoJRYKNPGcS+sC+H2D0xcX+V6aRclQNRr2/0L62Nb6Vf7RhrPD9yQjpqIewN
	aHk80FlRtCYX8fTt0f3h4yP5yzfQxxVGTl2azyjm1LR4BMzrHwXEt5C3yGQVCQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Jul 2026 16:46:48 +0200
Subject: [PATCH 1/8] conf.py: add linkcheck builder exclusions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-linkcheck-v1-1-999168371d5e@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
In-Reply-To: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9eBnagu4jyMjzDa7TpFhjSe15g6ShH6F8Gykc9Gm9LU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqUQXq9Y+VxiKxpu4cwB/gbED06/ERW97BC6e7N
 L76L9NpEaOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCalEF6gAKCRDRgEFAKaOo
 NlY9EACL8TOjDiYIm4DjcQeGxEZO2LkTTWylDi49Q/oXsdAR2UXTdu2LP7Jzd/z0PgENDGgWEqq
 /yOlTAwhW/Do2XV5CHu0GeMairxmpqmATW4WX7FkW5/sycSZkMr5gVdnLj+ZVPYkVyMo3fR02QL
 gJ8dYILMFrXa4OJS0OKeWzb9AC21qlhosh3emKCq8BzIWLcrrdmJHazqS2PlhnnJ+dhL/kj8yVr
 lXiw6q3ro1jPOBEFI27XmkQCsCCdQN7eec4RhVJ2rP2W08I3uDeDercadgq+uoBZXBejSab9qlK
 Gw28sWAaWzswLhXT8zoRY2VzYUYgl9uudsBpVYlG0Lv7ofZywcSCANmbdU3dzdT2p8t45JRBqFE
 5lhxZv2A2zryBYOs0ljOK4DW/Q/uBeAtB9hw9zKmOpZv5XubBN0H7oI9CwpDZmq9X1Z8GQcnXCv
 82lgt8wAxf31NiiFfervi6qSS11oas3P0WSMF/c62FcR/mQo0Aw/FYkdUix06tzCmt09H58mFe7
 W2FArnhRYqaL/MPpWp8vsx4cY+XNpMCUvdCXPETqgXIMjD4RpulK8nVnq8nqUHOXasWAFFuquSC
 Nh5bF/IrVAbxqRodHyeQ9qIXJW0dHabNA+U6Scm7AO2h9/Upl91W/GqZdpvsJsZsf4CGNZIVv52
 EQ8pXAfl4uVRWFw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10058

The linkcheck builder can be used to scout for broken links. By looking at
the output of:

  grep -E -r --no-filename -o 'href="http.://[^/"]+' | sort | uniq -c | sort -nr

from the HTML output directory, exclude links that are too frequent.
Also remove docs.yoctoproject.org links are those should already be
validated when building the documentation.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index 7b201ebd6..aff01c1ed 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -143,6 +143,19 @@ suppress_warnings = ['epub.unknown_project_files']
 # sphinx-copybutton configuration
 copybutton_prompt_text = "$ "
 
+# When using the linkcheck builder, ignore the following links which are too
+# present in the docs, and self-references to yocto-docs which are already
+# checked.
+linkcheck_ignore = [
+    r'https?://nvd\.nist\.gov.*',
+    r'https?://docs\.yoctoproject\.org.*',
+    r'https?://git\.yoctoproject\.org.*',
+    r'https?://git\.openembedded\.org.*',
+    r'https?://downloads\.yoctoproject\.org.*',
+    r'https?://mirrors\.kernel\.org.*',
+    r'https?://mirrors\.edge\.kernel\.org.*'
+]
+
 # -- Options for HTML output -------------------------------------------------
 
 # The theme to use for HTML and HTML Help pages.  See the documentation for

-- 
2.54.0


