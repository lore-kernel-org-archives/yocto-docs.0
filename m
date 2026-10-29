Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11295.1793278747222525734
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2026 05:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Jt2TMlEN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CAE69C49F44
	for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 13:00:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75AA660360
	for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 12:59:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D21FE103290E8;
	Thu, 29 Oct 2026 13:58:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793278740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q5Y/BCQGrmmgs1/b2EEY88RLDB0vB66Rkul+StR38LM=;
	b=Jt2TMlENofan8wE/8UWRUt+24Plbr8kUq1mbspn9J+ff7CiJxoMT0wZ58iBWUOy6xM8b9v
	O4nD9P5PYmzxYcNIOktlx6U4GExR5mA1wI8vBOOe9rXVhzOQTWIy1Kjjx8kQLx0N6dJNOT
	I/1Sd+r2kSF9GgyeBlx7rDIlXZ4jwD4SeGzDMyfGC69RgYVXq91ApHXC1vceGmiYWkHhbr
	0V7GziykfdWeekn7pLiSDhJFtmugU2RKxiD5zcp1ZhQ/YwH3IzndI5ggUSqYKnuW+fPOyQ
	zUpsPPqoflyW9oBLEOQHXs57mvOIVssw1UKOKfGhmKCgtRdaqdECPQkp965Qkw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Oct 2026 13:58:50 +0100
Subject: [PATCH 1/2] theme_overrides.css: rework admonition colors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-admonitions-styling-v1-1-8990714284a1@bootlin.com>
References: <20261029-admonitions-styling-v1-0-8990714284a1@bootlin.com>
In-Reply-To: <20261029-admonitions-styling-v1-0-8990714284a1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=S+c6bxUgWunYxPbHlgOyTKz75ORh+jzNr32JnitXV+0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq40MMJAlOY+bLcUIubmanOYvRFh6b6SH3Ywwmz
 R3qGb+Y0GSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauNDDAAKCRDRgEFAKaOo
 Nhx+EAC7u5TO0l4yL/MYjRVA20/PYq83lY38EwjAzhG3v0j1vlCIUFVURzwE+FkOblRkxxxO292
 AqbgaSFOr1TPX5MKYCF6IBzkz6eF/wTA5Vr3d5G9s0IezUpyBNd5g3a5Ggunam9iWZ8q+ODkbKV
 8L6J5a6yI+hgMGr9vsfI44CYHOCBMpB4FzUnoZ6LHEa5JT0FPP6v7uS23FvZDN2dvr5nAoamjkp
 obb9yoeCek4XR49y9tiDkFNwWCWs4EWGyaQeRNtZGRDltXsdL89zeiy0mMwBJZJBdYC03TKbEDe
 iXF7cCPMfgmrzIXJRooSWMyfzpq7FWcfc7vXPazkedDfajcY/7Z2TOxGOib9SNiD6H7xScSMRA3
 93QMh40sL3jdbE0LxzLTytnIM+VtF08hSsoBilp5IL83AmRLin4TfnkVc4AdHZC1Ia/oBGyCp4T
 dRFKU5LT43H804fGGvKazCbLuhDKXgdMkT/VZ9cG6LyoglAIB0/a9M9/wYpVUBlWoHGCZ+AVoTE
 BsvdmRkTvdrpDem3NJ1l8MK6BjqnrQZiKbtpiw9VaKs0PCJ8HI/L3BoGlKX5ZD1/k8c6IY7LESC
 hONkdWque3/JbxkpRg4iDdMCNIMajBRUcy56IBAmRF8vL0Exmq/8FwOk7Iju6uapxrK9ucMOoLK
 VCK4g4hq7ZVb/bg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 12:59:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10741

All our current admonition are shown with the same colors: grey
background, blue title.

Change the warning, attention, caution, and important to have a
light yellow background, yellow title.

Change the danger and error admonitions to have a light red background,
red title.

Increase the spacing above the titles from 6px to 12px, so that
left/right and top/bottom spacing are all even, which renders better
since we do not have a different color for the title background.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sphinx-static/theme_overrides.css | 45 +++++++++++++++++++------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
index 3823db820..81915b19c 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -163,27 +163,52 @@ section#welcome-to-the-yocto-project-documentation p.caption {
         color: inherit;
     }
 
-    /* Admonition should be gray, not blue or green */
+    /* Normal admonitions should be gray, not blue or green */
+    .rst-content .hint .admonition-title,
     .rst-content .note .admonition-title,
     .rst-content .tip .admonition-title,
-    .rst-content .warning .admonition-title,
-    .rst-content .caution .admonition-title,
-    .rst-content .admonition-tying-it-together .admonition-title,
-    .rst-content .important .admonition-title {
+    .rst-content .admonition-tying-it-together .admonition-title {
         background: #f0f0f2;
         color: #00557D;
-
+        padding: 12px 12px;
     }
 
+    .rst-content .hint,
     .rst-content .note,
     .rst-content .tip,
-    .rst-content .important,
-    .rst-content .warning,
-    .rst-content .admonition-tying-it-together,
-    .rst-content .caution  {
+    .rst-content .admonition-tying-it-together {
         background: #f0f0f2;
     }
 
+    /* For other admonitions, make the title background color the same as the
+     * admonitions' content, to be consistent with our note and tip admonitions. */
+    .rst-content .attention .admonition-title,
+    .rst-content .caution .admonition-title,
+    .rst-content .important .admonition-title,
+    .rst-content .warning .admonition-title {
+        background: #fff6e5;
+        color: #b37400;
+        padding: 12px 12px;
+    }
+
+    .rst-content .attention,
+    .rst-content .caution,
+    .rst-content .important,
+    .rst-content .warning {
+        background: #fff6e5;
+    }
+
+    .rst-content .danger .admonition-title,
+    .rst-content .error .admonition-title {
+        background: #fdf3f2;
+        color: #8d2f26;
+        padding: 12px 12px;
+    }
+    .rst-content .danger,
+    .rst-content .error {
+        background: #fdf3f2;
+    }
+
     /* Remove the icon in front of note/tip element, and before the logo */
     .icon-home:before, .rst-content .admonition-title:before {
         display: none

-- 
2.55.0

