Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB942CCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 14:55:17 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.10677.1760108107838144427
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Oct 2025 07:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oNr1rRuF;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E385D4E40FD9
	for <docs@lists.yoctoproject.org>; Fri, 10 Oct 2025 14:55:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B530C60667
	for <docs@lists.yoctoproject.org>; Fri, 10 Oct 2025 14:55:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8704102F21C7;
	Fri, 10 Oct 2025 16:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760108105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RtSu1o3s88fr0ENkLc8gdke5Vfoe046duKC8DAb8ptY=;
	b=oNr1rRuFxz1cmaryD05hpSYLJBw9ynk6Pn5gI0Vl14IqJCrFms1OGPF5JcvkBccCkl7B9Y
	uSNLGJWotSNrrBRU1vHSg7hIaMTwmy5wHucSxlMdaMksuntqzu/I8vdk6QvuKtLfmbW+OB
	TNm48sau7RBnuek2AElKIEEcROEhEPvhO2ApP4xv6Jr99JBVF5uiQWGV7+Ru5FUYV7fEHH
	1dWVYrWVnWvX09N9mqw74yLFnUooKY6Ao0L45T2AjDHHnahw3V58NBLEXvEKwY0WVK2EHF
	yo36WvQX/aceBAjBIX7vDTA5L451g459g85V3PShxkM8OvGCP5Hwum5HhOOftQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Oct 2025 16:54:56 +0200
Subject: [PATCH] ref-manual/fragments.rst: remove duplicated built-in
 fragment note
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-fix-builtin-fragments-doc-v1-1-2594783324f0@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAD8e6WgC/x2M0QpAQBAAf0X7bGvvQvgVeVgstji6Q0r+3eVxa
 mYeCOJVAtTJA14uDbq5CCZNoJ/ZTYI6RAZLNjdkCEe9sTt1OdTh6HlaxR0Bh63HiojFcsFlkUH
 sdy9R/t9N+74f8ihFW2sAAAA=
X-Change-ID: 20251010-fix-builtin-fragments-doc-900ae2a6a864
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=bvNRWWwgDoqpoobQyCsGupfKGqWB9ODdCxKxFHFfrWA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo6R5H2OqEVUcyqlRgcYXuHwGlWab8L8oqFxFyI
 KwBsREpZE2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaOkeRwAKCRDRgEFAKaOo
 Nr5+EACOjkd7Zl/nES078VSHVVvoYUOiztou7s2GmEXI6UcGwp7tnnynPj+Ckt2LDddyuPvyqKy
 kBS0EvF7GLISqalL0Hd5cCjYhriz8tuDav3Rj7AKW6KuMHmma9MEXvS6KvC9rMC1FEJLkHka1vP
 V76I/jFDg2muXzh1pioWXwo/AZZH8JsouNNbo78hMgkvivk2VRvDhTAGvs1N5tm+JlQmiEF/fIc
 iaCQvVzGA4qoNGXTxyw8KSULwyi60+hUaEHBZlAZhFOsQ8O96LsvJtW7ljvQDJwP51N9mzf/aMc
 zixpAwq/yZSFcqXTkZB6oIXcKllAoJLNzKmAeQ5dtyuqxKRefwe23eSwUbMMP0eDO4h/XRU2VEL
 ecl77yvh1DoLArwljL8wxAXuC43zLtad6sFFk2GdQjVkqtIhrQwaMCiQT3t68aLmAIksnQRvrc4
 dBCwxrMZAJ4p57i4fHmBoBAtLEWhyBiwDpZNLPaJrOL6kSxV/WXOupFIGlCJjLCfUlhv06gtZnw
 stJ9E+DVq0DEkDR8qBN6RJ+slGMQxToeJ05xCab/N4l8ECNnsg+rB0Fuw5oDdmi6518ceW/q2Zb
 vIyZBpeKVmhtCsvUNRbbGfS+2CY8f54HQ/FYo3g76/XTvcqWx7VG0HGrexeZUQCzKnTEOPUqVGu
 54hfXmM2uktOSTg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Oct 2025 14:55:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7683

This behavior was removed in commit aea2d69d0533
("lib/bbconfigbuild/configfragments: disable the previous builtin
fragment when enabling a new one") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/fragments.rst | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/documentation/ref-manual/fragments.rst b/documentation/ref-manual/fragments.rst
index 7fd08656d..520cf783a 100644
--- a/documentation/ref-manual/fragments.rst
+++ b/documentation/ref-manual/fragments.rst
@@ -90,15 +90,7 @@ value, for example::
 
    bitbake-config-build enable-fragment machine/qemux86-64
 
-Note that in this case, the fragment will be defined twice in
-:term:`OE_FRAGMENTS`, and the last value is taken into account:
-
-.. code-block::
-   :caption: build/conf/toolcfg.conf
-
-   OE_FRAGMENTS += " ... machine/qemuarm64 machine/qemux86-64"
-
-In the above example, the value of :term:`MACHINE` is thus equal to
+In the above example, the new value of :term:`MACHINE` is now equal to
 ``qemux86-64``.
 
 When a fragment is enabled with :ref:`ref-bitbake-config-build-enable-fragment`,

---
base-commit: 93c30b8a430a981e8b89061c968a006a3e086353
change-id: 20251010-fix-builtin-fragments-doc-900ae2a6a864

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


