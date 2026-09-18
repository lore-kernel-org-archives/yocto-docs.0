Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD32FC982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11773.1789739660433398646
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HE9s/Qmf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 79DF7C58477
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:55:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A38B960649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0CA41032902B;
	Fri, 18 Sep 2026 15:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nW364yKkedLH2Rjl13Qp0HSVpooAJ+RT8yD1OL74wBM=;
	b=HE9s/QmfNiNLPVuIkjuWxurS7DE0Gir94ZboGh6nSHRlxLsiSX5WZ76qpKlwy1z1VY1odN
	Yjya3h4Fg24TmqCPExliZEr5qzIjlYH3YIEeSOWUJ5X/YrlILaFv7boK2O4Nxz1w7RyTWy
	Gb/fDIgKbhOPv9ybi93qdepehNI8MH0CTvevURogVks0ojqjRdrawRTP4+mWshb1IdPJ8c
	vm0OGJhoGSG2sZeI1nYd/AMbKrhKkSnvjd3YrV9uii1MdVg9T9Wr8BVO+IP02JQAduv53u
	k7k6qp24CeMhWOLmQwKuILHUvx6nD7QrQoD9M0iTQURMRNHs7dnB1eNDUkVAvw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:45 +0200
Subject: [PATCH 15/20] migration-guides/migration/migration-6.1.rst: add
 note on moved class functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-15-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=CqQSSxxhNRvnc3OjnaaTFlBYYRS+VpbVKUSmcVN019o=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJl3hHGuEY2TI3zZS39XAPsfOxOxhBmA4aWA
 NfkVA+CmfWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZQAKCRDRgEFAKaOo
 NkUPD/9y0nkEzRsSxsEU9HuIKEa2RU3W+1LVm8AGucdrpJ96iTRdtFBsP5Qcc79YZNKTrxw3wia
 0/7IEwzjw+M2cJ07o1Db9kBT97fWqJBPOHqEHbKy62B9MvZOlANyGV8MrJpG89C1u2pEa3s4ihz
 QIhRe7ObtWm5OVxxvUauvXFP3jddnG6kyGGWTKkpI8kaVYHCcGd3N2+JiVR8MrDieWgcKsWTMGa
 hGxt/QVQu6sy9zT8j5Om1CaiGPainNDXV5t4lrK8bUdmtKjKyfTNeReYYFG2FqfmHIqjp/LY51R
 /5HLgvDJ4zRk8cFN78YcaomHqQxvtRCvhTWHJ4RPI5vm2ULWxEfRwcb0czGx+zP1AuOWhjSn80E
 XxaCyr5B1Uo4mi8kV911xCuTO0Qm1f9txJWXOHrTAxk4KJsNbi3SXvmpoe+QWUFASh5LbR9QcRl
 Lz67pJ5CjbKEIcRiFkwPEnfK4sSD/Valmpk0yK39bbFxjx1v4e5bVJTKEpDmRaa+8MkmI95VxJv
 dOyqGoBTTpgXgLRCvfaNG0qPU9fI6NbOaMiPCwIkxcTgy9BA/SkUrSp9I7uvpuM12bP88QcxOzQ
 NMoxD84v2zixlYJC2+FQn/NEVRvy5UNSp13vYZVKVmBbeB/vU1nXouILlZHSZdH6ftwjhg392/8
 ATugTccQBk4enYw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10547

OE-Core recently moved many functions defined in classes to its internal
library, document these changes in the migration guide.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.1.rst | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/documentation/migration-guides/migration-6.1.rst b/documentation/migration-guides/migration-6.1.rst
index 6a98ee86d..457d27bf6 100644
--- a/documentation/migration-guides/migration-6.1.rst
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -145,6 +145,33 @@ valid values for these variables will be :term:`SPDX License Expression`.
    The :oecore_path:`scripts/contrib/convert-spdx-licenses.py` script can help
    converting :term:`LICENSE` expressions in :term:`layers <Layer>`.
 
+Class file functions moved to the ``oe`` library
+------------------------------------------------
+
+Many class file functions have been moved to :oecore_path:`oe <meta/lib/oe>`
+library in :term:`OpenEmbedded-Core (OE-Core)`:
+
+-  :ref:`ref-classes-kernel`:
+
+   -  The ``get_kernel*()`` functions are now ``oe.kernel.get*()``
+   -  The default kernel build ``make`` commands now set ``ARCH``
+   -  The ``valid_arches`` variable is no longer available to change ``ARCH``
+
+-  :ref:`ref-classes-kernel-arch` no longer exports or sets ``ARCH`` and
+   ``UBOOT_ARCH``, ``oe.kernel.map_kernel_arch(d)`` and
+   ``oe.kernel.map_uboot_arch(d)`` should be used instead
+
+-  :ref:`ref-classes-kernel`, :ref:`ref-classes-uboot-config`: ``ARCH`` and
+   ``UBOOT_ARCH`` are not exported into the environment in most cases
+
+-  Various :ref:`ref-classes-utils` class Python functions are now
+   ``oe.utils.XXX()`` (see :oecore_path:`meta/lib/oe/utils.py`)
+
+-  Most :ref:`ref-classes-sanity` class functions are now ``oe.sanity.XXX()``
+   (see :oecore_path:`meta/lib/oe/sanity.py`)
+
+-  ``lsb_distro_identifier`` is now always ``oe.lsb.distro_identifier()``
+
 Removed recipes
 ---------------
 

-- 
2.55.0


