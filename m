Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66610CCD1AA
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.3549.1760604890668154978
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=a653Oyhd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D3411A140D
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35EDB6062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6A47102F22DB;
	Thu, 16 Oct 2025 10:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604888; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0fX7lE6z6uJZof/qEVjSMRgggKgQ2c4Vyh+0uBFr3tk=;
	b=a653Oyhd5wC0L120D5xV/J7RuUuqfPBFwwzwNjijTOrPy4AI0EuUwokMKUAgv4PVqGX0De
	LH0SQSGR3fDcVqhomMTjVWEsumGAu9FThDxJR7TJts3OxrzwS+yllyzQd9UXdqKWbODymF
	ylPvlDpV6QT1IZ9Tn9my3b4REdYeQJWpH1saZdFUYCCaGHVmQpSNsrWJ66vt8cFdGMhrMq
	q1UtB+mWPq4fqDU3yHCdeWwUu1zr+miSFX3WhzuQTeL0wM3BUX5V9HGrYohDUlhYs7n88V
	E+wBrg/gcdq19vUhd7uL6oJzvDSo4FuRt/FiDvB0ebd5iopLWFTODm0qK5A5TQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:54:00 +0200
Subject: [PATCH 10/17] ref-manual/variables.rst: document the USE_NLS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-10-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1435;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=sQBSOaZCb2e+MOW5BkFLGPCq4u6HGWGXbVwFLJ7aRTg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLQZabOJqGQQJtgT+s0tYwtn8UbmtdwQGeoz
 woO0dsf/a+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCy0AAKCRDRgEFAKaOo
 NqavD/43zLiZpHQVf5M2vnOQ9LZU627m0wIb5jwW7BHupPQ3STrgFz3YL2GVLLBFvK86fMEi9GW
 gC2QJgOgaSIn8zAWoZ3rYmehceF0z559EtbAds20ZUyGmA/VuBK5wW7kOCIQxaFaVZxpFydIkOZ
 e0NbUOYwVeVL+DeB6ODYnwkyjBCArfTmuUHuw5aNOtDAR/6dA6aIEXI6UC35p/bo66PzizwjYFo
 DfsGJTMkrN2P2SY4ME0kSpo4FPiSfsE7rSZd9wqVb0cAv1MH5aGyVN51inrymFQ6rgf255URXDT
 Ua9iTXsRPCXFlpc9/LpA9uXgAZc0S5kXWxWuTDe7pwqHxw26uVPPwXRkJx7fci6OOwabHJHdHVd
 4knDl1+/qQSiwiGv3KlAzENSQ/GTbbLZ0XjBD70YQxj3mEtTSOH1XR0ONLaD04p9Gx8Mq/+3Ww1
 L+0ZAMn9+6od2M7cicjEARykiBRQPAriMRqOwQPW+IB63Wr1ld51MEK/IrdQLEnCnK7R0EF13tP
 7miEVMCffXNPZiYVVat7JotKI22M81itQz+Hfx3ptclTDSiMPRxfTyZ5W3OStFEK7VCVb9H9TET
 ykqSn95AEXcfMhwLbn7W/jXyY3E5Qs7V7zBEgE+B7NKBeWcDgZqVRoRZPu95evO2snudiGTerNK
 6ZiZjBRpkLi/YBA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7720

Part of bitbake.conf, this variable allowing to enable or disable
translation was undocumented. Add a entry to the glossary.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index bb24f2583..f16ef9aae 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -11117,6 +11117,19 @@ system and gives an overview of their function and contents.
       the Yocto Project Development Tasks Manual for information on how to
       use this variable.
 
+   :term:`USE_NLS`
+      Determines if translations should be built for recipes that can build
+      language translations. This variable can be equal to:
+
+      -  ``yes``: translations are enabled.
+      -  ``no``: translation are disabled.
+
+      The :ref:`ref-classes-gettext` class uses this variable to enable
+      :wikipedia:`Gettext <Gettext>` in recipes that use this class. Recipes can
+      also use the :term:`USE_NLS` variable directly to override the default
+      value of the variable, and configure themselves according to the value of
+      the variable.
+
    :term:`USE_VT`
       When using
       :ref:`SysVinit <dev-manual/new-recipe:enabling system services>`,

-- 
2.51.0


