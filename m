Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5120FC79FA5
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 16:06:22 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67483.1767629179573251140
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 08:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2S5so6Wt;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2BB2FC1E489
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 16:05:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A31760726
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 16:06:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FA1F103C8567;
	Mon,  5 Jan 2026 17:06:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767629176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gmBlTUxhn9EOvHIEsfMGZlardGscQQ4qItky74t2moM=;
	b=2S5so6Wtz1ESvMSwpvV125//DIe8LgtHEOhTV04DoSATRaD2bS0yuM//dJX9yxBNbRC10r
	VC52GWU1KRP30GmsCot+12uFHMCNHlgco8EI3T02L0E3ua2+5jR3yH5as+WD36xZ2zJPu+
	UQiGcJZEozW281kXHCHSuPTtXMvAoDt9pz3PtkcVG1yj7v8NExGsI7Tfa5uI51f9aQauJG
	D2k7c6R3gHCV4ZCvpxVzYPcWHzGvfywRyZAx9QQHPUegjH6iBb7uKdd7NvmzbLOt20n0JB
	5gSCqDF/NQzDzL4Y98Q+hYIoxr3aPhCA6ApM8P78nZEDPKSNnV3xLGpeRpwijA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 05 Jan 2026 17:06:07 +0100
Subject: [PATCH] dev-manual/qemu: add an example for the snapshot+nographic
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-qemu-snapshot-v1-1-b598171f513f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAG7hW2kC/yXMwQ5EMBRG4VeRu54mNAheRWZh2h9XouhlIhHvr
 lh+i3MOEniGUBUd5PFn4ckFJJ+ITN+4DoptMOlYZ0msC7Vg3JS4ZpZ+WpXJdNla2DJPQaGZPVr
 en1/9fS3bb4BZ7wmd5wX0hdPjcQAAAA==
X-Change-ID: 20251028-qemu-snapshot-c529fded964e
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=TEzDG/1iaaEisfvjwMSP4bQJP37LZ5voqJTdqm4C548=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpW+F3Gvm5Mf5rK4bMGwidEHPbsTD4qxIKunDQa
 b+IHqimgV2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaVvhdwAKCRDRgEFAKaOo
 NvsmEADGzflcwi8DW04GXzaVgMapozNrX+rkerCNDthB+Ifje63oeSghx/Pesph4a09R1AxuE3w
 FFh2t1PaAjxyyaqwD0aL4NLY9j1zSIXx5EzWrva5hjom3w5kc4oLz+YrwXFLpYW/Y6MGSTZfxB7
 pTzktSobvPpbFCYl7SZURSPtAUOpuO0pgAJ8GJOjC4Y3+0G0sR3jhdbIGQ+zKubzpGulU6mYkqz
 k6vr3JPTxDuVS87UeB/kV4jhij3AMMEsxb1z0drCm434nvtALKWsfZjm4FYseylXOMvUkfkiHD5
 EM/d5MrNX9qQS2ua9I9z0WjfijpkH5KWdZ3y4xbf5rrgCTcSbctxpX6fjO9OlDrA/z06rEMJ01O
 AYFB5v1IFdEIpEY5uOKmNWqIaRbgDxD8aWUPSv9o85p39tY5cAMbXCEIisYphQyUm0sFzlqPLpH
 ZhC5yediRYO2MAwyhwmTtYckxJFZzwaXTs/DJIz3FGrxwp7MLBUccID62H7HhH7qTtEOpq1OGC6
 ALYHzvPhzxOElTeIV80blD9hFnBWcMBmrmOYjcL+oVtE+QyZep0pcLe93svhNU9fusWHdilg4LP
 XkxcIIccFvc/9OhNNieCHYhnzMgltdIbE3k/JvqEuy/kOPW0AJeHJ6NkUdL3Y2mNrERxrGCTr5D
 oN807O7OosX3kxQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Jan 2026 16:06:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8394

The snapshot option was added by OE-Core commit 8fec4a5a004f
("scripts/runqemu: Add snapshot support"). Along with nographic, this
execution mode is useful for temporary tests in an environment that does
not have graphics support (like a remote server, or a container).

Add it as part of the listed examples.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/qemu.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 9e0b8b813..442fdced3 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -119,6 +119,17 @@ available. Follow these general steps to run QEMU:
 
          $ runqemu qemux86-64 core-image-minimal ext4
 
+   -  This example starts QEMU in a temporary root filesystem ("snapshot") with
+      no graphical environment ("nographic"), meaning QEMU is started in the
+      current shell:
+
+      .. code-block:: console
+
+         $ runqemu qemux86-64 snapshot nographic
+
+      Running in "snapshot" mode means that changes in root filesystem will not
+      remain after quitting QEMU.
+
    -  This example specifies to boot an :term:`Initramfs` image and to
       enable audio in QEMU. For this case, ``runqemu`` sets the internal
       variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to be enabled,

---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20251028-qemu-snapshot-c529fded964e


