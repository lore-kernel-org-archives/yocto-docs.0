Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB679C021A7
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 08:23:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.6575.1739435004374850577
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 00:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xr7HT4Pz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9BEF204AC;
	Thu, 13 Feb 2025 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739435003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9oVYO3x8JSpUbW9sBYbXMJ39lhMYB9Gna452ZI+POM=;
	b=Xr7HT4PzrpSQrDE1wnxIS19Fk/cPGoJYgjBNZUYIrrhn5fwCjULJ07op3CSZL+P9JKeOxv
	BYUbMySyxTGhlutMqgWgm4/yfHqraSAa4qCZP4kQskxPMceJCtbYocmrPDSdsikHII77AC
	FXle/7VP7FX8Whygst2X5vj0CDaGkpiFEX0a8hUGZK8bIsY3ipfG8bymLJQdNOENckmeA2
	+CNAFldEJ7sIoJr9fCDw6iHqiPaRkhu8drAtZI3G1tQLqgvSh7crHRgI5J8Yra0Dm2VDQZ
	qAkN86nNWQwSpb8xiQi/BV9WzB3K0GYclqrVietvgSknjG8IKhgpKfcYcYCSbg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 13 Feb 2025 09:23:19 +0100
Subject: [PATCH v2 5/6] dev-manual/multiconfig: improve the current doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-multiconfig-doc-v2-5-f2bd35115cb7@bootlin.com>
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
In-Reply-To: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Mark Hatle <mark.hatle@kernel.crashing.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6010;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=jaX/3+DrCBkBwS3J8CH43LMbd6dz0iuICvO0lfqwy2k=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnrav44zt9Mx0/OmPUNM25aDQxC9alE62r/uUmQ
 CZ8wnfyUFyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ62r+AAKCRDRgEFAKaOo
 NuG7EAC3Q/q8WHMWaKQkkefsjUOIaj7pGHcvwHY5aZEFeMHqyC78Ht7mQ+5Rni5Fv2RM9Fgqdq9
 sDZSvoeCTfp2jDo9p/3smOXaV/qCEg5Z3Xi0qc+iwRMl3Q0FkAp4XNN3oP0pOWqB1xVFrfCFDP3
 Ahty9Z40gAlHgmuVSUr1GtpDy3kGaZRYFyf5U/h8L1jhBza64ve0iUBkq3D3DBthPBwCHdCaIRY
 7LBCm9HVOikdK9K9AoB59QOzP1lbWaOuXI5BjW5OdLNzaAHx5rQGr0N4tvIIjEusPgJRwLVIGWC
 dTLxGiMdBPyAPJOSOunlD1ARmC1zYCjCxdTv9NWwoR+Zml2AAaNwGsAenUp33yHp4wTdA0PbPa6
 GPSxlRH7As4uOthH4Ss8z2htfS/vr+oV9lBGg9RAqiNskc96JlC4ehZXP/5+o9D5y0xpXnB6RbB
 9qpm69jKxGHTKJUKrDuMMR9HnI65plH33aN38OWwzbY8NdDDWV9b5rRvWwc+6PIL28cAc5tmvwC
 Eiqw0bJUUbxXj8DvmvuSvyMFdK9sa/ZOM3gbOCjKBoZdm51RQMnHakPLxzKhsdnkrVoPJfGrgH8
 ZQfdwoqVMXSfogrqbBV4gxWpeWCbT4/4ObgwFC8/w6ZPUbGOMT5/hJAH8rRGsaPcVInX7BszDQS
 cKYumglILbutLaQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegiedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeuhfeihffgtdehjedvleelvdfhgeefhfdtteeuhfffhfdvieduuedvvdetteegnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohepmhgrrhhkrdhhrghtlhgvsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Feb 2025 08:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6362

After the suggestions from Mark Hatle on the list
(https://lists.yoctoproject.org/g/docs/topic/110487932), rewrite the
introduction to multiconfig with the following changes:

- Move the part of overriding TMPDIR or not to a note.
- Use BB_CURRENT_MC in the example.
- Various additions of references & improved formatting.

Suggested-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/multiconfig.rst | 65 +++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 26 deletions(-)

diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
index d8f6470d5..49e32b04a 100644
--- a/documentation/dev-manual/multiconfig.rst
+++ b/documentation/dev-manual/multiconfig.rst
@@ -17,7 +17,7 @@ Setting Up and Running a Multiple Configuration Build
 =====================================================
 
 To accomplish a multiple configuration build, you must define each
-target's configuration separately using a parallel configuration file in
+target's configuration separately using a parallel :term:`configuration file` in
 the :term:`Build Directory` or configuration directory within a layer, and you
 must follow a required file hierarchy. Additionally, you must enable the
 multiple configuration builds in your ``local.conf`` file.
@@ -25,31 +25,27 @@ multiple configuration builds in your ``local.conf`` file.
 Follow these steps to set up and execute multiple configuration builds:
 
 -  *Create Separate Configuration Files*: You need to create a single
-   configuration file for each build target (each multiconfig).
+   :term:`Configuration File` for each build target (each multiconfig).
    The configuration definitions are implementation dependent but often
-   each configuration file will define the machine and the
-   temporary directory BitBake uses for the build. Whether the same
-   temporary directory (:term:`TMPDIR`) can be shared will depend on what is
-   similar and what is different between the configurations. Multiple MACHINE
-   targets can share the same (:term:`TMPDIR`) as long as the rest of the
-   configuration is the same, multiple :term:`DISTRO` settings would need separate
-   (:term:`TMPDIR`) directories.
-
-   For example, consider a scenario with two different multiconfigs for the same
-   :term:`MACHINE`: "qemux86" built
-   for two distributions such as "poky" and "poky-lsb". In this case,
-   you would need to use the different :term:`TMPDIR`.
+   each configuration file will define the :term:`MACHINE` and the
+   temporary directory (:term:`TMPDIR`) BitBake uses for the build.
 
-   Here is an example showing the minimal statements needed in a
-   configuration file for a "qemux86" target whose temporary build
-   directory is ``tmpmultix86``::
+   .. note::
 
-      MACHINE = "qemux86"
-      TMPDIR = "${TOPDIR}/tmpmultix86"
+      Whether the same temporary directory (:term:`TMPDIR`) can be shared will
+      depend on what is similar and what is different between the
+      configurations. Multiple :term:`MACHINE` targets can share the same
+      :term:`TMPDIR` as long as the rest of the configuration is the same,
+      multiple :term:`DISTRO` settings would need separate :term:`TMPDIR`
+      directories.
+
+      For example, consider a scenario with two different multiconfigs for the same
+      :term:`MACHINE`: "qemux86" built for two distributions such as "poky" and
+      "poky-lsb". In this case, you would need to use two different :term:`TMPDIR`.
 
    The location for these multiconfig configuration files is specific.
    They must reside in the current :term:`Build Directory` in a sub-directory of
-   ``conf`` named ``multiconfig`` or within a layer's ``conf`` directory
+   ``conf`` named ``multiconfig`` or within a :term:`Layer`'s ``conf`` directory
    under a directory named ``multiconfig``. Here is an example that defines
    two configuration files for the "x86" and "arm" multiconfigs:
 
@@ -58,7 +54,19 @@ Follow these steps to set up and execute multiple configuration builds:
       :width: 50%
 
    The usual :term:`BBPATH` search path is used to locate multiconfig files in
-   a similar way to other conf files.
+   a similar way to other configuration files.
+
+   Here is an example showing the minimal statements needed in a
+   :term:`configuration file` named ``qemux86.conf`` for a ``qemux86`` target
+   whose temporary build directory is ``tmp-qemux86``::
+
+      MACHINE = "qemux86"
+      TMPDIR .= "-${BB_CURRENT_MC}"
+
+   BitBake will expand the :term:`BB_CURRENT_MC` variable to the value of the
+   current multiconfig in use. We append this value to :term:`TMPDIR` so that
+   any change on the definition of :term:`TMPDIR` will automatically affect the
+   value of :term:`TMPDIR` for each multiconfig.
 
 -  *Add the BitBake Multi-configuration Variable to the Local
    Configuration File*: Use the
@@ -88,11 +96,16 @@ Follow these steps to set up and execute multiple configuration builds:
 
       $ bitbake mc:x86:core-image-minimal mc:arm:core-image-sato mc::core-image-base
 
-   The previous BitBake command builds a ``core-image-minimal`` image
-   that is configured through the ``x86.conf`` configuration file, a
-   ``core-image-sato`` image that is configured through the ``arm.conf``
-   configuration file and a ``core-image-base`` that is configured
-   through your ``local.conf`` configuration file.
+   The previous BitBake command builds several components:
+
+   -  A ``core-image-minimal`` image that is configured through the ``x86.conf``
+      configuration file
+
+   -  A ``core-image-sato`` image that is configured through the ``arm.conf``
+      configuration file
+
+   -  A ``core-image-base`` that is configured through your ``local.conf``
+      configuration file
 
 .. note::
 

-- 
2.47.0


