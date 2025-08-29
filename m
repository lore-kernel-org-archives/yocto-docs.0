Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32650C8303F
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 09:04:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.9258.1756458286951992045
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 02:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JEVPviDH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 447621A0D64;
	Fri, 29 Aug 2025 09:04:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D018606B9;
	Fri, 29 Aug 2025 09:04:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6D361C228B4F;
	Fri, 29 Aug 2025 11:04:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756458284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ZaGYQqdJGXKh20ghy3LdsFgTzFk/X5YzYHxrMrtA2p8=;
	b=JEVPviDH3XLPek2RiPsN3PFh7JV4AflluoTke8hycxk5V5zbVF2d2lf65PBhWNhniYRMg6
	SqwxRIRTOkWB5a5Ro++0G3N3y5+AXYxHQ9z70ipvrYZcK2MrrMWbGuspLSziTMy9duwOg/
	bgVUHTy7gsmaIQHmxtw1KeKB/Ow5SKLlRbc/9o0pq4z4NKjwu1MuS5SaxD/EUEAubRxm0N
	niU4akbmmlB7k5bMGNQ7gruAca8NeuaaroYxwv7YcM3b55/2x4emueUg/Newaz2UVqM2zW
	n2SRl7p9wUfXiDhghKdTHsi4+7qIOZOJ5MVsAPTLKa5uCuu9etEA5D9inxTRww==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 29 Aug 2025 11:04:04 +0200
Subject: [PATCH] migration-guides/release-notes-5.3.rst: add x86 qemu
 micro-arch level bump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-qemu-level-5-3-v1-1-d2cac1e1bce1@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAANtsWgC/yXMQQqDMBBG4avIrDsQo4LxKqWLRH/tFLWaqAji3
 U3r8lu8d1CAFwSqkoM8NgnyHSPSR0L1244dWJpo0koXqtSGZwwr99jQc8EZ5860JnVKl8ZSjCa
 PVvb/8Pm6HVb3Qb38LnSeF9+V12hyAAAA
X-Change-ID: 20250829-qemu-level-5-3-4b9f91b0289a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexander Kanavin <alex.kanavin@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2174;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6KOMDmR+OvB2MvoDhBmr8nDTAIXMGC+dHLon8pvnjPM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBosW0jYjFe8kONrIYEsyibG0NVtag/o8wcpKMo7
 DLJyzTe6ZCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaLFtIwAKCRDRgEFAKaOo
 NvP3D/wPSfJz/kYpuRKa9R1LcYfBTQlTGLx9eewfGkPPuuWdM7Eiehjue81B3jmFcWI5IePWld+
 R9pAwOjCo+jq2wKprs79hC/rXeaPPAjlPyFRe5OhdLAoCuajVTxL91q0cOeiHAsI4p1nQTM5NFM
 Quf/j/lKQTGnFyws7gA7Fqfp08T5YtU2gXW9RnQo/3gcJZ4P5FeSx/5HaPSHwZfANPJ5LfNK/tx
 sBLDlH1sHj8OSNngsSaxM3R+u16nk9R3eFeuSiZYsQP1Um4LFLuuTPGluNTrVH32/Z818HbZaHc
 Kp0uStx81YF83mBorFoL+72Uq19wU0lWeVOab33WfsDGkzF+2p40A8TuqzfkHTMHekB50k36qw5
 Lp2Orcow77RE+tycZkARhkaJpTHkTlo10EuxoMvLLa2VLTbCV9ossIAk+i5bncx3LDLPHkS4dhO
 tqaKh3mpZldLdYlkScZDP4rdJLpIofFXgJhLOFCOIxdrwurnXSh64rUaRFlaGE2Hat7LmGJ7FnN
 F4oQDqYVtI7QpsxYexQQZz8B7yySVabqsqfAIz310TRzAOxlJ7Ee9A2t4ImKJhJ49t65xVMj4wD
 epJ2LGWPGYTMTZQ6EjyRP+FimnrhhLSt5xdG883m71zZRr5OhCKncSGEoaxjMXlocDLZSGpk8zp
 BC5HzVmK+Za+2xg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 09:04:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7471

After commit c9585bb8689b ("Revert "qemux86-64: Reduce tuning to
core2-64"") in OE-Core, document the QEMU x86 micro-architecture level
bump in the release notes for 5.3.

Co-authored-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-5.3.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index f32c6162d..4782c2436 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -311,6 +311,25 @@ New Features / Enhancements in |yocto-ver|
    -  Refactor :ref:`ref-classes-qemu` functions into library functions (in
       :oe_git:`lib/oe/qemu.py </openembedded-core/tree/meta/lib/oe/qemu.py>`).
 
+   -  The ``qemux86-64`` :term:`MACHINE` now defaults to the ``x86-64-v3``
+      micro-architecture level.
+
+      The previous default was Core 2 era processors. This change means that the
+      toolchain is configured to build for that level, and QEMU is configured to
+      emulate it.
+
+      The v3 level adds support for AVX/AVX2/BMI/BMI2/F16C and other newer
+      instructions which are seeing increasing usage in modern software and add
+      performance benefits. Please see :wikipedia:`X86-64 Microarchitecture
+      levels <X86-64#Microarchitecture_levels>` for definition of the levels and
+      lists of Intel/AMD CPUs where support for the instructions was first
+      added.
+
+      Note that if QEMU system emulation is used on an x86 build machine with
+      :wikipedia:`KVM <Kernel-based_Virtual_Machine>` enabled, then the build
+      machine's CPU must also be recent enough to support these instructions
+      natively.
+
 -  Documentation changes:
 
    -  Part of :term:`BitBake` internals are now documented at

---
base-commit: dbc6137cd13f982a7fd4d1b2df79dccb177db0fc
change-id: 20250829-qemu-level-5-3-4b9f91b0289a

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


