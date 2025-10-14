Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1070ACCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:38:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.11406.1760434702886092031
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 02:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HQqbqzbW;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E1CC9C09F80
	for <docs@lists.yoctoproject.org>; Tue, 14 Oct 2025 09:38:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7074606EC
	for <docs@lists.yoctoproject.org>; Tue, 14 Oct 2025 09:38:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C6A8102F228B;
	Tue, 14 Oct 2025 11:38:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760434700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=IjzWAg/sNuqzCFnfX+lr/eOWs+O2caV6Rxj/s5h5yBA=;
	b=HQqbqzbWKYlEw0PqHeSBFnsKdkn8rX9iyg0AqU+pSe2XQR9cAASssNH8+rtWnbN7i6iO0/
	RuzyK+jAgwTUyJZvjD76GZy/4pxvZrJtwVSzHPHCbm4K4e/4RoX2VeAemOfkzMcHyt4J+y
	EK+3jQyVeYBtXrLmJLB2xAScPrzNExF66y2hBcm1fZPzr2cJQzFAwTruRKRUzPjV31rDgQ
	Tn6apLeSSwabLgZ0PwcXSLAr/q5BA4jI282YiJ+GyrYXBCks2Wlfma7DTnQaTLaBKZdDqQ
	af8c0LKcQ09pNiEz8iXQPobEAWjlTVGx1hz30WGp/PD3gd01ID6cmhE+uGUAGw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 14 Oct 2025 11:38:12 +0200
Subject: [PATCH] ref-manual/classes.rst: uboot-config: improve
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-improve-uboot-config-class-v1-1-9163eea15557@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAMa7mgC/x3MwQqDMAwA0F+RnBdoq8K6Xxk71Jq6wNZIoyKI/
 27x+C7vAKXCpPBqDii0sbLkCvtoIH5Dngh5rAZnXG+N7ZD/c5GNcB1EFoySE08Yf0EVjRt679o
 Unt5DDeZCifc7f3/O8wIN0wETbAAAAA==
X-Change-ID: 20251014-improve-uboot-config-class-02b5923fa899
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2759;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vGeTKpX93zhw5lIToPu9qTa7WlZj/Q3UvNoPPYUduOk=;
 b=owEBbAKT/ZANAwAKAdGAQUApo6g2AcsmYgBo7hoKlX83InWo2f6Od7qi/RELAlK0PZd0Atn9H
 UrpkrXB8R+JAjIEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaO4aCgAKCRDRgEFAKaOo
 NkJ6D/i1OfJgF/9dp8u8724Rdhbv7zDo8CffknTWzWjk2PEpQUNZcImMMGbTkaBHdvX/gUFNdMu
 6NVTi/C/HOsKe3huDyYy/CdSupL/AYXDuXYAIOijSfIRz7jZM0zhRVjqVTcNx2pFPKWRN6dpi4D
 h5lLS2/fGd9Zd3HIcVpbh0dwilCT6+rpOPhDKAT8JGGCRi3x/AsHHn0W27g2gnBdqrtQnkHmpB3
 OPFC8hanS/wrvSAHd3V+J7J+S72xSgjqdEqM9sjlgdysX1wKiUAT3JGJ/Q1Sn4G7tMHtt3hE2Id
 Mx0npAIqQ9r9d6y5IifGeHurc/0UnMS8Q2b2HX53KpagaU46FxV024BNncSNgTCYkvCqQxSYMW8
 Zjt11lIQErJh6Fk2mp8u9AxjCp3/49i3K7SoGToTl9PqnS356BujdC7pbBgX/zdDVu4qsmpRAAN
 FAaqrOk15bNnN2amRkhVg+CbQUgPqXqn223FCpv8Sr8j+A+Qo2vChXZOQ8C+BkFYW+V56bSj+IG
 qOjqPd0bHuy7YYPu9yBxOFVHyEQQrh8vdsXuokqQAVFpnYXm69T4PMJMY6PQRjKrgsc/A3orFZX
 XdBG2y6XeoR/Xg6sny6IH0gu+VMNlIBtwF1SuiQsGTVxw3/cSOER47NNmhOhbCb5kN1VN820t47
 m8qYgTIynFA6J
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Oct 2025 09:38:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7699

Improve the documentation of the uboot-config class. It was not
explaining any of its entry in UBOOT_CONFIG. Mention that using
UBOOT_CONFIG and UBOOT_MACHINE at the same time is not possible.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 42 +++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 662121ed9..f1fe48648 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3170,15 +3170,51 @@ variable using the "type" varflag. Here is an example::
 ================
 
 The :ref:`ref-classes-uboot-config` class provides support for U-Boot configuration for
-a machine. Specify the machine in your recipe as follows::
+a machine. Specify the machine in your recipe with configuration entries::
 
-   UBOOT_CONFIG ??= <default>
+   UBOOT_CONFIG ??= "foo bar"
    UBOOT_CONFIG[foo] = "config,images,binary"
+   UBOOT_CONFIG[bar] = "config2,images2,binary2"
 
-You can also specify the machine using this method::
+The above options correspond to:
+
+-  ``config``: the defconfig file selected for the build of this entry. These
+   files are found in the source tree's ``configs`` folder.
+
+   *This option is mandatory.*
+
+-  ``images``: the image types to append to the :term:`IMAGE_FSTYPES` variable
+   for image generation.
+
+   .. note::
+
+      Appending the value of :term:`IMAGE_FSTYPES` is possible because the logic
+      of this class is called from an Anonymous Python function.
+
+   This option is not mandatory.
+
+-  ``binary``: the binary to select as the main binary for this configuration
+   entry. When U-boot compiles, it sometimes outputs more than one binary as a
+   result, for example::
+
+      u-boot.bin
+      u-boot-with-spl.bin
+
+   Setting the ``binary`` value to ``u-boot-with-spl.bin`` will make this binary
+   the one selected for this entry.
+
+   This option is not mandatory, but the value of :term:`UBOOT_BINARY` is used
+   instead and should be set.
+
+You can also specify the defconfig used during the build using this method::
 
    UBOOT_MACHINE = "config"
 
+In this case, the value of :term:`UBOOT_BINARY` should also bet set.
+
+Using :term:`UBOOT_MACHINE` and :term:`UBOOT_CONFIG` at the same time is not
+possible.
+
 See the :term:`UBOOT_CONFIG` and :term:`UBOOT_MACHINE` variables for additional
 information.
 

---
base-commit: 8b85245490ae0b19a9c3880ec31e55b42e19d094
change-id: 20251014-improve-uboot-config-class-02b5923fa899

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


