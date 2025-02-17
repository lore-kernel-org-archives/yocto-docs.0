Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAC2C021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:50:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.53283.1739803836564532927
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M5XgaMRp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19DBB44311;
	Mon, 17 Feb 2025 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739803835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y0MkJXghTSwK80lFEvo/Oocqrr0BPU9bxoa4ITG7YIM=;
	b=M5XgaMRpY6X/9YhJiUbWSIJpy7ys6+r7NnJkJhm+lJKjqo9p5vMeT8VNeenqb3pGvUElHe
	LXYpEsQIuMoSxcNQ1096AxNxnHZBsvmfRc/H4SBgBeTh7IVz9+XRhxl5cE3OSV21yaNYvH
	zlj3y6T6QrVpgAZMv03wMogQF9KzbBaviQ3dMEEySJLXKZkq5uWwR9QC0j7p544V5x6H4c
	81G5LFtD9AHUKRxjkOwy3OI64GsJyeG+Yc4Jao8vAHBM6ee06n2cTOZaHgnyJ5SoOfgh+V
	aZ+tWVWOlb219IFPgIRIwiUUJO64OXCULaNb9h/xE4Ac+MgHwac12W8vAaD9aw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Feb 2025 15:50:24 +0100
Subject: [PATCH v3 5/6] dev-manual/multiconfig: improve the current doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-multiconfig-doc-v3-5-027a9fb282c3@bootlin.com>
References: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
In-Reply-To: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6254;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=2atPgGxk/WhFf06EIyeAyjOP0iL4pYb/3CfaKwqajjE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBns0y5hFelM78i+NaDhKaESjNk9n/DoX/esdkgx
 MQa3PZIj1yJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7NMuQAKCRDRgEFAKaOo
 NgoTEACEVVRymDXYCbMRSHUXVe19O+CVBGm13TRixGlQQ8XnE/gEL+Wh1dczroV1RZKfggzPK8H
 hjE7X0PgIF75i/9acZX3ocX3VRzAGMFUGUCDSBhp5mAtayuVBHYDI927hsQGmcyWwzCyqKnL+cB
 fjLxbIJ4os1Frd7KSTi0TlYWTZrFi9sjGsh5Bh2xlXlVx9hwu8rtF6+wh/jcwnXiuXdWcK2At2q
 fGo/nQ41D4qkyrV6/QabS1PNLISDObGEE8+HiOrqGM9mFj7atIZBOcygm1LnOHoLiDU/gIqhYKN
 KQdZKCWOocmaZr+2Y4gcg0eDc4fynJVcrsDABd0q99WLQLrUA26eYayXHDheqi4Y4kPxTBXVM9F
 5QLq44r3+xh6lg/4W7QSoEfOtydZuBRpJVzdESjbAQ0O1yNTrAmnxx65MG5yHGx8AIgrxmft45I
 VuYqRuuk+9ky2vc07FO/COAdjnQVIkjifhs1swm7RJOHcieHJVyhVIazX3fRYEzDuH+f1QUzQV3
 GtIgyE21wFShj9HWoYnt1/4Tox+kExYbJByqINenyvRd+xWmF+rpRE2AhYEmRwSbvFhFF90UVDY
 y9nAzliKHF7N4V9gqYd7ov6dnwK0pakZMU5zIoMDkyxmrvU/m8IpEBnTz/KslbkK5Wwr0tmNp+u
 pD/s2IfmLZ1m9gQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeuhfeihffgtdehjedvleelvdfhgeefhfdtteeuhfffhfdvieduuedvvdetteegnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:50:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6399

After the suggestions from Mark Hatle on the list
(https://lists.yoctoproject.org/g/docs/topic/110487932), rewrite the
introduction to multiconfig with the following changes:

- Move the part of overriding TMPDIR or not to a note.
- Use BB_CURRENT_MC in the example.
- Various additions of references & improved formatting.

Suggested-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/multiconfig.rst | 68 ++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 26 deletions(-)

diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
index d8f6470d516be9b57084228f33bceb69a9341388..8371cf0e464bbd09f80a2ba0fbe700a911774fa9 100644
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
@@ -25,31 +25,30 @@ multiple configuration builds in your ``local.conf`` file.
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
+
+      In the general case, using separate :term:`TMPDIR` for the different
+      multiconfigs is strongly recommended.
 
    The location for these multiconfig configuration files is specific.
    They must reside in the current :term:`Build Directory` in a sub-directory of
-   ``conf`` named ``multiconfig`` or within a layer's ``conf`` directory
+   ``conf`` named ``multiconfig`` or within a :term:`Layer`'s ``conf`` directory
    under a directory named ``multiconfig``. Here is an example that defines
    two configuration files for the "x86" and "arm" multiconfigs:
 
@@ -58,7 +57,19 @@ Follow these steps to set up and execute multiple configuration builds:
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
@@ -88,11 +99,16 @@ Follow these steps to set up and execute multiple configuration builds:
 
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


