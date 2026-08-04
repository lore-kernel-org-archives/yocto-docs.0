Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12131C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 09:01:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12318.1785834114782215326
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Aug 2026 02:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gwZocO9U;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8137A1A13FA
	for <docs@lists.yoctoproject.org>; Tue,  4 Aug 2026 09:01:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50E7B6029E
	for <docs@lists.yoctoproject.org>; Tue,  4 Aug 2026 09:01:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B68611C32706;
	Tue,  4 Aug 2026 11:01:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785834111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4Y4AfSI4eWp5yV0utfK9wwrE4unhnBC58KhMdxT6wNc=;
	b=gwZocO9UDy4/fC10xWHcggmGJ5Ffat78ZUT9G1CQUm1ojFMxMgwTbN1r3cawUPYdo99NQ5
	2epqqDuO6Iwlf5EdRtmGWnJkm7Jc1emOll1rq5a2m159qM7FRz9Dt9iEp4fHDTYzseKbqx
	4o62dMYBWl2sBPofLoxD3OHszkn2TG7ezFfEjYjDLThGIAcKwgdlrSrrzAwZnxIS76E6Zd
	YQhzZDOauXXSblm13cUKbSVikTGQCAmW3Gk2H252UTD4CHfUEjRlirBdnt5qaT+r5gw1X9
	V/gDdB09baYvnEWxiRen7lB9bTgtNMvJleWGkZB2DNgLE6dTsVri+Ximrul1LQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 04 Aug 2026 11:01:44 +0200
Subject: [PATCH] ref-manual/variables.rst: document the QB_DEFAULT_BIOS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-qb-default-bios-v1-1-bc851931973d@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqEMAxA4atI1gZqkbF4lcGFbVONiD+NiiDef
 Tq6/BbvXSAUmQTq7IJIBwvPU0KRZ+D6duoI2SeDVvqjjCpxtegptPu4oeVZsHKFJmOC8lZDqpZ
 Igc/n+G1ey24Hctt/A/f9A8hxokxzAAAA
X-Change-ID: 20260804-qb-default-bios-7c12e88f0db2
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tzQjRfsw0qDU7LAipn/sCV1lEgAQlOUnG3DdbkbXsDs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqcap+IDGQA58EU4L//lyIGFartId5KvFZiG9iG
 BmEU7+Tz0aJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanGqfgAKCRDRgEFAKaOo
 Nm1pD/93wos8xVyKMQuR/c4fc3gHWQQmvyL7GvLIuKFF/4qV0n5a8ZiOjB4Z4P7+m6ZZ1D7Ynxc
 1JaIwy2iXC0TViExf6vzeAPOX8G6MGjp3iUjtLs3gBvDypxvwNeGvakt3owCbCFG2e3+til2rJ7
 h4J5razOLfIxZao6hnje4S/FysBnTDS4qXsbEzaxHkKram5AKg0V8VorcPmVKsAmh4joOrBA1JD
 PLZsGJU9YPoBL2nvmFjfvoOJkUDxOuwXh+Gu0hEpq/Eju6LyYPrFPIuesaKh9HUhUXmmMWX4eyi
 fw6liSMvOgahaGDkHtRdBuKuArPP6t/yVhMiTZotPWccAjyIkG54InzzLHKr6YRNBeZ8FL3n2IA
 c/6J40+GlKxP2liKfSAZ6oGP0/96ZCkK/KYEPSfzYFb2kxozZO7Tg8qetk2hcle2MzA1/Q8Ggr+
 HzctsAZFhrpLvMuS0xa1/IzZiKtnqHGLswFuU1qfwgN0soVNF5eCh7tE7fbR3lTMpYWLN9OptIM
 9FniokD/9uaUNgc1OuIDEkWAXnRRtkx/6KeVRQ9KI1p7/imM395Q6zmSBqUgIrWjDp0/eu1FP1x
 NxIg1Hgd42cukrPfpp3Y16wi7iBk/H1eqC76pFnU2FqymhIgMQLjCThLI6G+ZUiBt/xhovbrDg+
 Hj8IezpCrzP82QA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Aug 2026 09:01:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10233

The QB_DEFAULT_BIOS allows setting the -bios parameter of QEMU, which
can be used to emulate U-Boot, for example.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e75f42afe..cfc764961 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8084,6 +8084,18 @@ system and gives an overview of their function and contents.
       replaces the ``@CLIENT@`` and ``@GATEWAY@`` place holders by the IP and
       the gateway address of the QEMU guest.
 
+   :term:`QB_DEFAULT_BIOS`
+      the `QB_DEFAULT_BIOS` variable can be used to add the ``-bios`` option to
+      the initialization parameters of QEMU. For example, this parameter can be
+      set as follows to emulate U-Boot for the :oecore_path:`qemuarm64
+      <meta/conf/machine/qemuarm64.conf>` machine::
+
+         QB_DEFAULT_BIOS = "u-boot.bin"
+
+      The above example makes the assumption you have built the U-Boot recipe
+      and that the ``u-boot.bin`` file is located in the
+      :term:`DEPLOY_DIR_IMAGE` directory.
+
    :term:`QB_DEFAULT_FSTYPE`
 
       The :term:`QB_DEFAULT_FSTYPE` variable controls the default filesystem

---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260804-qb-default-bios-7c12e88f0db2


