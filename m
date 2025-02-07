Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B428C021A0
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 16:29:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.73655.1738945739106117215
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 08:28:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ag5znS8d;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9927F4434A;
	Fri,  7 Feb 2025 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738945737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxy8+l/S5n8JnPQr7kxnlsoy88VWAORgHfcOF2roYZ8=;
	b=Ag5znS8dq8oWWJ59f+mT0MnKo67hIRiGm8D8lAzVcorOCM09KUrSLtx6YAthTQKQlwxw9m
	z7WTACJkQpO9KeR90EIKVVSP694HZnguaIIjHCGFAjjOVqxQfobGYRabTxNkf3M6nYB/n0
	BZzPrm7/0qHVrMSPSaivaeQyr78mZDzFaw2DfOEpoFFWZ+sHslt/goeY4dpZukMDn5ay6p
	qabxt8mjDFZVrGa3WfVwtAbl8lu8V8vQgepDvlazGWAS7j/YgVRdiqr6HkUlrEc431a6A9
	IUiOFtta50t9WOIo3YCvwv1u/a6E977/3Row0upZzQ7v91gAUYhv3QbogrEcXA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 07 Feb 2025 17:28:55 +0100
Subject: [PATCH 5/6] dev-manual/multiconfig: improve the current doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-multiconfig-doc-v1-5-f63cdab1fad9@bootlin.com>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
In-Reply-To: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Mark Hatle <mark.hatle@kernel.crashing.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5993;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cH4wqx944v9LV3nQFQp3g1q6ObTL5izV1smb5D9O/1Q=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnpjTHeGS+vxVxUmr1rkNxPGbx6ppmn7K144Myo
 +lex2fPJW6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6Y0xwAKCRDRgEFAKaOo
 NhaeD/9tBnIwlMj9br6YZEIJ3i411Gkqkbv/2w9Hm+3RoEMW8zW0iExN4VJkmdpY3FrN/no8kXm
 n7XqV8kUOnU6GiaEfHKadZuqnTRo/u1WBgbRHdTq5E8rhLp44tZ7roKR53xqnDJew+J51v9gcl6
 Rp7ciMqf69Xg+9p6zt+PNIHGdbWwIqBrLmEA7BmvSffTTEIV4ATrQjXPJNBhavoUCg4rQxqV4J0
 I1r/k2Tz5sgMEkUU0XIPhBto3TxzYtVQ0IPtpWIxc3VG0I0dSExwKrBiiW2peQkPTszcN3iLlY1
 LyF41sAGcXxWjOWoj+rTg7q5pUxhNnII/DyJk8BNFegOdxFmINnLyc04vrSkZDdRyaPbhwNVu4J
 5YIJ0uLqTDueWQPaEL6/DY0d7q1MRGxMS6dGyX/b+hc1veDmDNSOQihy5ZIcR5ktKryqkZDPSXb
 VeX0mVulzET0CBeAGJyLTON6346SrSN6qBk/xgx3XPCVGjoh6Uuz0f0H9eBRR+OfmgyY+mxuIqs
 PcjwgCXESj2qGmSTq53KGXllNLkctI155s3ZBB8wagLatfBg26jv+fIzMsrt64n3KOD51HKVcIx
 LfHuxlDc05iTGsjIMFiTvLFYTK6ZJvowB6UCqekVQx3061KoC1czPth1geiFW1e6PvsgyRnVIit
 Ga6jo+um7fIWaeQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeuhfeihffgtdehjedvleelvdfhgeefhfdtteeuhfffhfdvieduuedvvdetteegnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrt
 ghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhhrghtlhgvsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6306

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
index d8f6470d5..27442a042 100644
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
+   temporary directory BitBake uses for the build.
 
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


