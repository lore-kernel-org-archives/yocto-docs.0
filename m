Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E81E77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 10:41:43 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.31448.1735036892588312252
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 02:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fx/52fo2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62DD41C0007;
	Tue, 24 Dec 2024 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735036890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zbr+Rdh4wca05MipHjEZ0+MC4T0kJP2zmGxrC1FmgUY=;
	b=fx/52fo2pAd7oI7e08cdnmj5UaLeCH5gy/e88tNK/kE1A3YDPYKPMINFCFU2FQfwPbJySd
	DvCZIx7pSlGVBh08B4w5c8Rp3vvX5VQHkx0Wh+cvcsd3mz7Bi4OOn58IzvxRc15d6ThtOi
	aRJr8LblVZDh6U7vxBONe/8T9YEDMnhKwYom244UV2atNO2C8OORo/41QcRYIL06Ch2SZW
	OXXmS5HCrqMoVqMm08LB+rrX4gQaowLS87BGek2L8+xzdl6E9VI1LtVbfJExI89HBb5hVi
	wV0DA0KkaHajIk7jCphmI1lA9s2R8w4bbc5u91JQxR2uTMdRRcddiNUKV4KM8Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 24 Dec 2024 11:41:20 +0100
Subject: [PATCH] ref-manual/qa-checks: remove
 patch-status-core/patch-status-noncore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-remove-patch-status-core-v1-1-867eb1f6654a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAM+PamcC/x3MQQrCMBBG4auUWTvQDEHRq4iLNP21s2hTZmIpl
 N7d4PJbvHeQwxROj+4gw6auZWkIl47ylJYPWMdmkl5iEIlsmMsGXlPNE3tN9euci4EF1ztyiiE
 MN2r5anjr/l8/X+f5A95wmohqAAAA
X-Change-ID: 20241224-remove-patch-status-core-2e69eca411b7
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Diego Sueiro <diego.sueiro@arm.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2166;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=DkVKGjSOvb/TZcNKPQYGOLgXoKbGnJ4Q3ob5ZFHg8vU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnao/axJHVkBXCCG/CLLAZ9Ey3oVaR2DdQGSGgZ
 qEE5AJ98d2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2qP2gAKCRDRgEFAKaOo
 Ng6lD/0QQVLOr2KobuKW3wEG7mi+QPy4qrqtvZBWSN+1qvb6DLjYQtttuPFW79vimXGAnKLjSD8
 gZYIcM0A3uarUkuvB8ymMpxZupnjUjDNZoxXrX+Yd/N25EaqM/smJhcDANfBa35DjcE4iGz8xGh
 v4LYWoPB5hlqrMPyWnPJqmKxuHBbRS/mhkkvw6VIAnmNAqo9gVWtdhXnBfeQQePUVpaJiwASzxn
 J/a8tnKH4p2gBfB61ZF8jTE8qXCAm1gApZFgEAn/4xJPGamDcs2XRUuyCKOtWeFHyDciwBPiJNM
 ssli9P6NXsxnstSbOP8hfeS2O+LRagi7/kdu/LVOVzSVPJye6JlUzDnp7TG5aktayfAGJZ1NkY2
 iiXJJOYHiUrC7jhDPH7LdBGWgrylqHfl+SLk4JKZKkWJUgs0C7RhoJ98INSJXdSFI1s7+w4kBq4
 VA31MxG0DuZXf0KGSKOGkLN3ul0U6AZur14rVVoXxXT7QQbE0ycZgh5WVFjRkrISNbx/DYUmpa5
 RYLNtnIV9OMHHV3Cu60xnZSH2zBYIvcDJ2TV+NopCoeUpZPWbtNl9icskuDE6VsZpSZtri+e1Ne
 5GHA2qNdsjU4ffK7RoEwIdWnf4ujiE1pY7MMOaQESZynVW490RcHUMx5YPBuAX75jOAe0iUc+lm
 dQc1O4CRYDkrB1w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 10:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6019

These QA checks were merged as "patch-status" after commit
61a881fdbe8b5a21c6276b8a5d06cc30486b1eb3 ("insane: Improve patch-status
layer filtering") in OE-Core.

[ YOCTO #15345 ]

Reported-By: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/qa-checks.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 53b1836e74948f27bf83f91ebb512f3cf0881ab2..1b83834df1d0876b72df5f21fe1cde24673dec10 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -752,21 +752,17 @@ Errors and Warnings
 
 .. _qa-check-patch-status:
 
-- ``Missing Upstream-Status in patch <patchfile> Please add according to <url> [patch-status-core/patch-status-noncore]``
+- ``Missing Upstream-Status in patch <patchfile> Please add according to <url> [patch-status]``
 
     The ``Upstream-Status`` value is missing in the specified patch file's header.
     This value is intended to track whether or not the patch has been sent
     upstream, whether or not it has been merged, etc.
 
-    There are two options for this same check - ``patch-status-core`` (for
-    recipes in OE-Core) and ``patch-status-noncore`` (for recipes in any other
-    layer).
-
     For more information, see the
     ":ref:`contributor-guide/recipe-style-guide:patch upstream status`"
     section in the Yocto Project and OpenEmbedded Contributor Guide.
 
-- ``Malformed Upstream-Status in patch <patchfile> Please correct according to <url> [patch-status-core/patch-status-noncore]``
+- ``Malformed Upstream-Status in patch <patchfile> Please correct according to <url> [patch-status]``
 
     The ``Upstream-Status`` value in the specified patch file's header is invalid -
     it must be a specific format. See the "Missing Upstream-Status" entry above

---
base-commit: 28850c974a3896895bc921c094071523218d6d07
change-id: 20241224-remove-patch-status-core-2e69eca411b7

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


