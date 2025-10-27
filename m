Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF337CCF9EE
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.31568.1761569076020026423
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=b2SSEjwM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B3ABD1A16B1
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89CA86062C
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 867C6102F2507;
	Mon, 27 Oct 2025 13:44:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=79CAjtXOdCyqgiIGmSfT47u+N123i5XJxEXAzhbeL8s=;
	b=b2SSEjwMsimLCOxeJJHZ4f7oJ2cOnFbVHVbAVXDM9FmzHt41CYVKeIOpytYXqQfmlDUiLg
	3EZibx2NL4PkY/ceMgzk/CcNWt1PRMzct7UF/E6fU1v6FWem363mCdViK8eMbuQ6i9B/4c
	8o9wVhKO7NZZmPhg/vY/e80T2oAzJ5Im4rqblkvvfbLSH+PCtMCTcOi3rN0FBhPXC2q2hc
	md0QRDC5d8ROBUgvVOREFCQ4WJVq2aXgNaZp+XJxXaTovlsqwETFRsQdIwEJ/b6Ua82qMK
	PD3vesoDKV8Gf989rCxbte/74rwDX45T/8nhZFCApJ23CAh7Y/Bep6CWkJmOcA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:43 +0100
Subject: [PATCH v3 11/16] ref-manual/classes.rst: gettext: extend the
 documentation of the class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-11-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ead9YYRukY4+5VL/wPztFxZwEhdeLarNfQ2lEowelrU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kG4UkB+dOLyrzYcpikIYw0RXq9FEcOTqpsb
 eBXdaS0l3yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBgAKCRDRgEFAKaOo
 No1MEACAuzV+LiMZs61C9TQRhvfke8mCL6XOxhuA6Y8VOnrMSjPqAxEp8iDqLLB3bpDmc27tgMO
 NTyNJqFvDplWNHjgWa1FsJJkf7pmuANCT5N+ocBZ2i/0wpfdayviJKFBQWnNURix6y0d2OXUPIx
 to2bO12yaQ1mXTDnG8cyJpyQ2JdJ5bipfb9AasRFLtrEa5dh2N28zACaBJugfTM6/ABXMr1oURz
 ICDOZ2yrE0aZB1itsa7plzF1Z3NPUNIJ0frqFhiVlHezM1TT/RE7PI7pXtyKW8Ve+MHgRk7rkQB
 KVU0OvzpWVU5SV00m7laGSXOeMFVj2ywKF81EtuT4cQB1PFg7fVcgy5Wrntz4jN4apZbt/3hcBg
 bnu2vVdE2+x7ZLnlTFcKNL6QuMzs8361Y0E6pyAYb4yuTvoQWS7l2s528LLFIVlyRQyMOW06f9d
 MTtWInHHckh47D9N2gkBbxBRQSsx3C0jywm5eUR/ATf1vEB5a8WozVgHIr1YpQgbMLL3ZWHTXmc
 JBmvOwgtVAlecEz+X6s3LkPdg1zbCY6el9CE9A5wsZ4O+TZOfN609ldhr+RWdqAe6QYb/dTg97P
 kpQa+n97yyqgvqN1yAKLMTWVtDGs7TGk93irHsGL/h40pF4aSpfNKTggoGwYVNun2SnMuykxd/O
 EhgzdvDvmTFOp+Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7860

Mention the use of USE_NLS, INHIBIT_DEFAULT_DEPS and the cross-canadian
class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 4e5083a79..5903a4b9a 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -966,6 +966,14 @@ software that uses the GNU ``gettext`` internationalization and localization
 system. All recipes building software that use ``gettext`` should inherit this
 class.
 
+This class will configure recipes to build translations *unless*:
+
+-  the :term:`USE_NLS` variable is set to ``no``, or
+
+-  the :term:`INHIBIT_DEFAULT_DEPS` variable is set and the recipe inheriting
+   the :ref:`ref-classes-gettext` class does not also inherit the
+   :ref:`ref-classes-cross-canadian` class.
+
 .. _ref-classes-github-releases:
 
 ``github-releases``

-- 
2.51.0


