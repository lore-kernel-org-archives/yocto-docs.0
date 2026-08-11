Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2567AC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:17:28 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53833.1786454241538516681
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 06:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TswOtykp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 419AE4E411B0
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:17:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 111306033C
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:17:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8EF611C48BAA;
	Tue, 11 Aug 2026 15:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786454234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dREUQH4t+0mvYGDXGb8teTSTneprhVctlUSa7cVRA0M=;
	b=TswOtykpZgDhGSjh9VWl8SfzLk2AfQqQW2zy1bZN35ERSUnLH+GNdOTHGKm16wEnpY8Qif
	SN5pMmt+qBLXJIGxA94vZTQCDyFR1l3v6Qb9gsmMmvcPu3nDLph+PMNDtlHxAwFQgrUe2U
	vaa9brQCJRww6DYaP3wDTvH28IKqC6gWBB3eZAY0VpMey48ZUwR7B7dpoFFB8yuiLsda/C
	LN4VvxqClIh9zV6vZab+ujS1lCeERn728Kiwug0Gd96gAL205FMSmwtid6ja05HJ7MA7eN
	U91VT4cxKx4Nsa9UAn1WstPfM9DnOdHv7s308f/mhqipCQmv45R+igRdvLZVpQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 11 Aug 2026 15:17:09 +0200
Subject: [PATCH v2] ref-manual/variables.rst: document the QB_DEFAULT_BIOS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-qb-default-bios-v2-1-02a6284ca3cf@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7Zi2qBRX3sOwoO0gY5BqW4iGc
 HcB1y5f8v77E0QKTBHO2QSBRo7s+wXULgPb1v2NkN3CoIQ6CS0O+DLoqKmHLqFhH7GwUpHWjXB
 GwbJ6Bmr4vRWv1Y/jYO5k05pZjZZj8uGzXY5y9f7XR4kSjdVHWeayLHJ3Md6njvu99Q+o5nn+A
 ocGHcrCAAAA
X-Change-ID: 20260804-qb-default-bios-7c12e88f0db2
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Xulg8MCagYgIswTrJ2E8fpU+VfzVc2CF2yEWxpt6N54=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqeyDYluTc1I65SrBJ60UILt5y5Rikpx7WFU1Mg
 pjdgYX+OR6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCansg2AAKCRDRgEFAKaOo
 NoVMD/9AkJvHFbmpaWRw764HnpQA7OmjkDXI9/ZxfDBP6KG9aGk1l4WKTK+/is5sbuvUJqZ9ICB
 iPZ7KwiAf3OON18L5jvtQ+RLpjTxFnX4gZMIuZKLLq5Hmm08NL4IrX/gfB6r0QlodvrAZ5nwUpz
 fg6LZzm4KGuIgL123UDri26eDNY6DWa0HpWyfgTpYaPceNaorm7SEguQA1310oMY5qqTH9Rhfwf
 oPXi+vMSzxZvnrbfd835h/2S2NZirU0OgNPirJbIQtv7A+9tk81sGwKOmoemXjiv/NuJpfRAujc
 gSXLMIWY5e0L865mb5/t2rjqPz7fOgZ+1XFPUoIfO8/tIwKaaznbCU4IeZav9xocIeUFZbh3N1o
 n6OSgcvTTi/OH5BGwiAUhT3McqtcIJwidfcQM6Q3vj5l8dHjHZVvToCOjv5PuoO4wwBM/kZoVn0
 W0QuWaQorqjSccFzp4E0apVTCDFDCyGyhfWfe78pUVbOYZac33hmAII0hLGDo60i50tRa+DD/uO
 xG8xNJUnWgHVurhK5Y30JlCDMJP1HqQJWkHk2OQwcbehmgetnWScWPhdJXqc3wxHQoSU1ynCt13
 Tcx8CKpLGKs0n3jCYjcsub8eUz95ySilwxocw7JUHyw7q7CCaKr5hqcRVj4KLIVvGwEBerEFiJ5
 WEiR6J1EgUHlrnw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:17:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10262

The QB_DEFAULT_BIOS allows setting the -bios parameter of QEMU, which
can be used to emulate U-Boot, for example.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Address comments from Quentin (thanks!)
- Link to v1: https://patch.msgid.link/20260804-qb-default-bios-v1-1-bc851931973d@bootlin.com
---
 documentation/ref-manual/variables.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e75f42afe..f4ed9a883 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8084,6 +8084,25 @@ system and gives an overview of their function and contents.
       replaces the ``@CLIENT@`` and ``@GATEWAY@`` place holders by the IP and
       the gateway address of the QEMU guest.
 
+   :term:`QB_DEFAULT_BIOS`
+      The :term:`QB_DEFAULT_BIOS` variable can be used to provide a default
+      value for the path the of a file located in :term:`DEPLOY_DIR_IMAGE` and
+      used by ``runqemu`` to specify the `-bios <https://www.qemu.org/docs/master/system/invocation.html#hxtool-8>`__
+      option of QEMU. For example, this parameter can be set as follows to
+      emulate U-Boot for the :oecore_path:`qemuarm64 <meta/conf/machine/qemuarm64.conf>`
+      machine::
+
+         QB_DEFAULT_BIOS = "u-boot.bin"
+
+      The above example makes the assumption the U-Boot recipe was built
+      and that the ``u-boot.bin`` is deployed in the :term:`DEPLOY_DIR_IMAGE`
+      directory.
+
+      .. note::
+
+         When using ``runqemu``, the ``BIOS`` environment variable takes
+         precedence over this variable.
+
    :term:`QB_DEFAULT_FSTYPE`
 
       The :term:`QB_DEFAULT_FSTYPE` variable controls the default filesystem

---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260804-qb-default-bios-7c12e88f0db2


