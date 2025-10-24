Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A06ACCF9E9
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.5042.1761294042342825164
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=a0qZiXQE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 04EB14E412CE
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D206060703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C9D5102F248E;
	Fri, 24 Oct 2025 10:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294040; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QxVbbPoHy+2ItKpXV4tEl4nhzeeVWLqBldzqDdxj2oU=;
	b=a0qZiXQE5OqIn6Uw8iQ3qkwoFZI74iZgciVEL6ehYjSfpC1bu7HJjUMuP/ZX/Ko3pRApo4
	XjEonoNwzG2v8FvRbFlFOC+7QIg00TxZIuVL5pI1mU3B+aGfpiWraVAk6zkcSAR3rBbaM+
	30L4HjfNfvwKssrL7HPFJHgvC72VoetrFIrTsBxejmKZWPtRSCG8Rc2Ov8OfWnb5klVI0J
	Sr6HL4AjdDe0hTUvKFjICsbxRUkDgaWLFsK92HXcWZXB65j/a7MUyXqT0Z+vMxruMqppj0
	1jw08C9tspQnb0Z3l6a5fBMgXu+ST7kr2Y6lSaMRLaf2A68Bn1NDCgutFr3rEw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:20:04 +0200
Subject: [PATCH v2 15/16] ref-manual: document UBOOT_MAKE_OPTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-15-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2759;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fshRnOsoqeMy2SG6mv+152UTJS71YaS8VoxvxuE/gII=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbK25F92WImTIVN3qVnyMabRxfkQoLWsUTIY
 ctCpxtKtmOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2ygAKCRDRgEFAKaOo
 NsILEACUsDVii2Ej8XKc4p6CDyIkEs5/XMczD098W1L6DL3YzuAIo+liUv+DF5BhMsa1nsIOXld
 615U9v07p4Bw5IU7HbdsvYd44g0aMEnx6S5M/tybJWIpMoefXPxeDEPfGn0bJDBZIFy22PJQzxv
 tDKUYIBMVa0nIRnoDBqXbrrBp1ScEIZVuTxIRA4fIf147jjjRwqSP5NEpBSYNLan8iJ3MNZ5Npn
 BQuHcLv34XVVLOnYaHr+Mp1qfihClmCh+eK+oOwWAvTX+ippq1YYSPYMy6FE/tUWeLM1EkTGMGl
 pol0vaGC3lD6Ju2iAspgy3HrysyIC3/iS4XSXlbI6mfwpaM8e6FsIFtu8D+juI5xqzT50PdAYJn
 NtEGVb1xcl2Cjn0DzpFW65OHBoaVJWkB8p5po6SWasqx1+lejdt7hWzyVIjyr/KjeyhKDm/TVO2
 Gxc8QfntNH0K9GknfJtFv7szQffvAF4jJ1/UMSUg2VDp3mPQtiIuapFeNAP7upmsuUh9sUUNWyO
 UtOHXsSmsz1pXGdshItNbfAWvwO+aJvObPUlll6cDibjqMlLG6M6g2yYPYrtNAybeccQyUEEdAT
 Sc/frss8Ld4j34HuVF92b1oP9llF419PDP/WPl1D+/NwPE61R5IgUUUp5i0kYSX3qo03DHIX897
 7zWIEYRU3F0gk1A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7804

This variable was added by commit 3338330e0c46 ("u-boot: Add specifying
make options as part the config looping") in OE-Core. Document how to
use the option in UBOOT_CONFIG.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 13 ++++++-------
 documentation/ref-manual/variables.rst |  4 ++++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 60529ef9f..a0089c415 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3240,8 +3240,8 @@ There are two ways to configure the recipe for your machine:
 -  Using :term:`UBOOT_CONFIG` variable. For example::
 
       UBOOT_CONFIG ??= "foo bar"
-      UBOOT_CONFIG[foo] = "config,images,binary"
-      UBOOT_CONFIG[bar] = "config2,images2,binary2"
+      UBOOT_CONFIG[foo] = "config,images,binary,makeopts"
+      UBOOT_CONFIG[bar] = "config2,images2,binary2,makeopts2"
 
    In this example, all possible configurations are selected (``foo`` and
    ``bar``), but it is also possible to build only ``foo`` or ``bar`` by
@@ -3272,13 +3272,12 @@ There are two ways to configure the recipe for your machine:
          u-boot.bin
          u-boot-with-spl.bin
 
-      Setting the ``binary`` value to ``u-boot-with-spl.bin`` will make this
-      binary the one deployed in :term:`DEPLOY_DIR_IMAGE`. It is renamed to
-      include the build configuration name in the process (``foo`` or ``bar`` in
-      the above example).
-
       This option defaults to :term:`UBOOT_BINARY` if unset.
 
+   -  ``makeopts``: the additional options passed to ``make`` when compiling U-boot
+      for this configuration entry. The options in this entry are added before
+      the options in :term:`UBOOT_MAKE_OPTS`.
+
 -  Or, using the :term:`UBOOT_MACHINE` variable (and its companion variable
    :term:`UBOOT_BINARY`). For example::
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d249ca383..6aba20d52 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10842,6 +10842,10 @@ system and gives an overview of their function and contents.
       Please see the "Selection of Processor Architecture and Board Type"
       section in the U-Boot README for valid values for this variable.
 
+   :term:`UBOOT_MAKE_OPTS`
+      The :term:`UBOOT_MAKE_OPTS` variable can be used to pass extra options to
+      ``make`` when U-boot is compiled.
+
    :term:`UBOOT_MAKE_TARGET`
       Specifies the target called in the ``Makefile``. The default target
       is "all".

-- 
2.51.0


