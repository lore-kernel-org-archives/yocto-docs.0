Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8E5C982E6
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11772.1789739660201346237
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jvtkWSRp;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DE2CEC58476
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:55:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10C8A60649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 229301032901E;
	Fri, 18 Sep 2026 15:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739657; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ilMTbjxqeszs8QM9sa71q4IyiBffG1XKUlg7Qt5GX/I=;
	b=jvtkWSRp7dDShSYWAhLji1j63EQE5N9vQxkPaL1DunAzfC2ou9B5Ky5MMeh4Xl27A4a5Fq
	0BzabXxtZUUT1drz+e+ALbvB4bbGqZoJrSN3Io53OEa9sFrrCJrJLNP9y+DeAdPEKESQZ3
	3frwtrU7yC2RKzS0e4Cimxuoyg97eJk3ZCywYRFgrFYGmsBU9vNWC9eGkmykmjCMKKKz79
	x9J/eCU0q9shINhs79R3AO0njKnJl1eHmUvcrxgHDNyAHaGw45lxXqtJW1GqAG+fG1LKD+
	cfiBLc1ZGYkPkXwMBSuuOiW1UPFpVkrpKe+cYfBrrmJ0lb/R0MnUnih6XtCyjg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:44 +0200
Subject: [PATCH 14/20] ref-manual/variables.rst: document the
 KERNEL_MODULE_INSTALL_PREFIX variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-14-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HHKhjkIFYt4UWUexxRXoZuPDBZxftNOHrriMecH4VNs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJl1cRfu0WRTk4qeUjAUoC0mjybN4z+adkcn
 E6KgRQGmVaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZQAKCRDRgEFAKaOo
 Nrw3EACM4mgEWEWI+aVQA4ViRiAubAgzOtNYCViRrE7PqYuJL1Tvfik7Bp/RBdg4p0EGINc6Yqm
 n1bMYRiar0A6OxOjiye1g/iJUNQc79VovNtmnYUX6eGklwOZCDUGxJ3j3totJiH2RdgZ9GeJXFv
 xMQe7twoFCDEIB3N11yjAkpGnvxFUpoiPNRXfLm1wnsup5NVbtmCYR2houIpZMyiKNLWgPNCdTO
 rkvO/XRjD0PSoyZlhGPM5FCXcr5NZlcDF0u+jnJHc3Mcc/+0qoUmMy2/6Tes/RWrbE+KIdkIAjr
 KIO2I0Fsxo15M6a7chS91qhfz2QXrRMQPdzfMvAdNN9smRuJEWGhpvniTZUh7U9wUqlRp3oDc41
 08N59rnTb5L5/VPiSJL/VY1c0juCBzFUdrim+8Xb9QaiVO7phSo9l1Xa8pHLIIxYEa72oDl0Etw
 +33Lx3ptY4csE5A8gu76igVc5kNVeNrMtRSbrNTef8X6vsHzVQLyFE4jc0hKfC9gD89VzqniDuY
 peBUtny0ooezcejpx605v5/5ZHtqaKSMHBkCIIDsmEjQ/Q7N+uasRf7pvhVqWZK372Ua3q2CfPp
 AsL+vMLR9c5QF3vyWNfVxRuUSBhJI1xslf2Kezo6Ih36p9D5Zbe/M05gsSwrJMy4/y/F45H19ww
 cHlXifl19VAyJgw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10546

Added by commit 3fc136afbf8c ("documentation.conf: add documentation
for KERNEL_MODULE_INSTALL_PREFIX variable") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8bbb2073d..1c0864d87 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5703,6 +5703,11 @@ system and gives an overview of their function and contents.
       For information on how to populate the ``modname.conf`` file with
       ``modprobe.d`` syntax lines, see the :term:`KERNEL_MODULE_PROBECONF` variable.
 
+   :term:`KERNEL_MODULE_INSTALL_PREFIX`
+      When inheriting the :ref:`ref-classes-module` class, the
+      :term:`KERNEL_MODULE_INSTALL_PREFIX` variable specifies the directory in
+      which kernel modules are installed on target.
+
    :term:`KERNEL_MODULE_PROBECONF`
       Provides a list of modules for which the OpenEmbedded build system
       expects to find ``module_conf_``\ modname values that specify

-- 
2.55.0


