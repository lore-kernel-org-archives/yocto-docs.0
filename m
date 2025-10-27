Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E18CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:44 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.31748.1761569079078112547
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=y2tVUGgb;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7EC0CC0C43D
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC2166062C
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02501102F24FC;
	Mon, 27 Oct 2025 13:44:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569077; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7+dB7l2q5kTvavR9jZvgH/Mztv5fk1daLx31ba7iiVA=;
	b=y2tVUGgbMsVWLW8/k1lx4H4w5FcGsNOkjXqtfmQK8udAtj0+c7zx9OsPBNLlWE1GlDNR7p
	JrvJXRQgap1te4PlilqDk8LaIv53qShYvbtJwJBZld3nX4dYi39M4vn8Cqm1U5mkUTdanX
	Vm3yh2HqodCSVAJRaJ5rWYNz2NCuFyO5eD48dBupNvkrNUvW5TZklRlLbI87oBy3yknCxX
	VpMgAPVm5hERqhx+AJMtC0aAybQ9ggmjGXpRBgn4Hz8DYvxBG8gJG0eG0rLRRNSRa6UXvr
	pEQCEfq8L/lM//N8rwF15TaK1N635sbkeW8aUotonQ/7u6CL2HWGxRngM33n0w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:47 +0100
Subject: [PATCH v3 15/16] ref-manual: document UBOOT_MAKE_OPTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-15-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=oPLWlWN3k0KdrIPcWmELu3mXPTiKe7H7nUvk6fAvXr4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kGaPETu14sUmLCUra60YjvSdsZaanc8t9WO
 DeNtxu3n32JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBgAKCRDRgEFAKaOo
 NoLYD/99IOfj2BDeiwDgjU8+o61zpCjfa6GwNk8yp3KDk/lhFFWUhVsR2hFAjmi7UrdWUGuQ9bi
 2ilz/vbZvd6dBUvGZZMW7/+kHE+W+YzxUdLmhGtFTXbstAJEjDVTZU14jJE0Y1eZRTAohO/IQal
 E8oGeY0BIeZA1llOxBu1WtqgKnQYKyQBPnt3SLGOfiQSV6oJBykjRWRtp82/+DWxJOh5ZWNDxM/
 bR8OEBUO3t+pZQlu6lYkbLlDpTrKpHcZYnPIftT8XV+DUWvrpslqrdQatgdL/O0HL7PgoXx7N/2
 WacXiZb5uU82aQ7pXJJaTsVR/Nt1HZ+LuC+LpKZaYVHVY+IjpvIXhTTJwJX9zTWSFwijl0Y0Ubm
 wqJX4PyXEF6mqNGXT0tguMsKnf2UtPIQ0Izh9GUzO3ZMc4Hcu0/5IsAJN401wH+k4H2PCGdJBsw
 i4ATz+K7nOv4a16FLiVyuAzxkWYnufp43HbZJbD3f0m5JdOmvoCzLDhMdYPNQLo5tGYU5z5REJw
 hunqB7tqgw85J2UAMKH6a//7NM4Q3tnMqsithjrCj+PIjEzvrzYJU1Y/ddAUIs68VhubaNXKvc9
 UA23jzoFqnghaNaJGb1iaK00+t/84f5bszEYjjlqzTPDOBnZ9R/4zMHFxwEJjtI/QsyzNoMosmv
 81FPq6sUWNAWZ3A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7864

This variable was added by commit 3338330e0c46 ("u-boot: Add specifying
make options as part the config looping") in OE-Core. Document how to
use the option in UBOOT_CONFIG.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 8 ++++++--
 documentation/ref-manual/variables.rst | 6 ++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 2a69d2d59..9fd2fe375 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3241,8 +3241,8 @@ There are two ways to configure the recipe for your machine:
 -  Using :term:`UBOOT_CONFIG` variable. For example::
 
       UBOOT_CONFIG ??= "foo bar"
-      UBOOT_CONFIG[foo] = "config,images,binary"
-      UBOOT_CONFIG[bar] = "config2,images2,binary2"
+      UBOOT_CONFIG[foo] = "config,images,binary,makeopts"
+      UBOOT_CONFIG[bar] = "config2,images2,binary2,makeopts2"
 
    In this example, all possible configurations are selected (``foo`` and
    ``bar``), but it is also possible to build only ``foo`` or ``bar`` by
@@ -3280,6 +3280,10 @@ There are two ways to configure the recipe for your machine:
 
       This option defaults to :term:`UBOOT_BINARY` if unset.
 
+   -  ``makeopts``: the additional options passed to ``make`` when configuring
+      and compiling U-boot for this configuration entry. The options in this
+      entry are added before the options in :term:`UBOOT_MAKE_OPTS`.
+
 -  Or, using the :term:`UBOOT_MACHINE` variable (and its companion variable
    :term:`UBOOT_BINARY`). For example::
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e80c5a6e9..d879a49d4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10906,6 +10906,12 @@ system and gives an overview of their function and contents.
       Please see the "Selection of Processor Architecture and Board Type"
       section in the U-Boot README for valid values for this variable.
 
+   :term:`UBOOT_MAKE_OPTS`
+      The :term:`UBOOT_MAKE_OPTS` variable can be used to pass extra options to
+      ``make`` when U-boot is configured and compiled.
+
+      See the :ref:`ref-classes-uboot-config` class for more information.
+
    :term:`UBOOT_MAKE_TARGET`
       Specifies the target called in the ``Makefile``. The default target
       is "all".

-- 
2.51.0


