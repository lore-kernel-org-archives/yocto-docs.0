Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA80D374A9
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 15:13:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.350.1729178007263940811
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 08:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bfxAbZg0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 735501C0003;
	Thu, 17 Oct 2024 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729178005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nF53C8I9ak1d2QLGdDzrDK9HEuyABYSVcQpNOfoMzm8=;
	b=bfxAbZg077r6dV3MqdodMvbePx528wjKEY+tZInbW3TlKC5a51Kwj8/afHbkPz7SmnGxcF
	/D1u2ppPnYXd2AgsYZj3uQX6Yedu1+9zJ7PxKP3I7jX/YP9ryhxoAvLsGwAyEyZzyXoZ3Q
	fG2+a8hHL/V4fBPAhT1CUPFAmqG9HSc5q64YEKAXQP17YDi8iZkWsrkgylJSb+fXt705d2
	sJQ7AvFehgHwWcvNF9EsW3A9QIJ7ZSP+4pQrMszvMianJKT7BTz2Jo6wBZaQIMsSW7QJUU
	WsqjXZY0B36EyP93GxtXlkdLBIo0pvHMO5GgYQQMolNf+KAKA0guDDlmq1hmyw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 17 Oct 2024 17:13:09 +0200
Subject: [PATCH 2/2] ref-manual: devtool-reference: document missing
 commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-devtool-improvements-v1-2-2bacc656fe39@bootlin.com>
References: <20241017-devtool-improvements-v1-0-2bacc656fe39@bootlin.com>
In-Reply-To: <20241017-devtool-improvements-v1-0-2bacc656fe39@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3277;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Wv+yiUuwqodrWHD6Hzd/36cnN6WwnaFQUtVNczrbs18=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnESmUtE3YM15wnO1XChNOA7kBePaDHZB3jJDA2
 Fp10DZFLsWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxEplAAKCRDRgEFAKaOo
 Nr+6D/9emapHpjZGj/eAXZ9+DkO1kgMzP9ybWpgxabqdk0X4zyZUS/IwMfyUzbCi6R9sHnOAmHV
 MrrRKHCnaayfUcFMR5YqkzbBZyHKBgjxm65rakjupDw5IiuM0A7ssKXaWx/LXuiggWLrgHV4Pq1
 lZqIH64cptpM11RHpu565d3DlyEcuu7uNaphNDJDRDzKbNIPdxt69MshITm3A7dNrXw+6fhgnAF
 sAk79jOi9309YazNTPFTNTbdQVfIqXb3P3KznOV1Ouo+JXXkiEfRR/XiFi33Aps6eRa8v08ZQB1
 JKczqEBcKoidm/dsAEWSbuCPPGq/yaETNGdkP9I/L0OWAegHAYVFt64ndzilj38s7xDphWnfFlk
 ROANJHHHcTToPMtVEbYwqOkczlsFpZvp+dI7EXAJY5RaWz6vjOfetwwgOYHnOubSC1KCXVAo5KO
 vCC04DnjHtyIlOxj6mkZhihdpGuNn8Tj/1yc8/LJzWvnh8Mg/xtS3iTbZsOXvIwb0J0Kesr8Sau
 P8p+1/5Kaud+4NVAdw9+uwBsA29NtXF6+2b7NNsIGatWwoLkS61I4we0XpdwTadJ7Cbqb+3NxLN
 nFHuPoGdUf5+RQ97+BxCz3UjfuCN0sWVWIfGjpqTBTaitoUeIjr1PYVaAJ7OaNlXtb7UXYSBAvT
 23zX4DL7GpQd2+A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Oct 2024 15:13:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5529

Give a brief description for important commands that made it into
devtool or that were missing from this quick reference document.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/devtool-reference.rst | 52 ++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 9c36195c5a5a2405cf8e3a562a2a53291e97c859..e4c7f79a23644f2a89c882ce5e2130fb2a93a4b1 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -463,6 +463,20 @@ Here is an example that resets the workspace directory that contains the
    NOTE: Leaving source tree /home/scottrif/poky/build/workspace/sources/mtr as-is; if you no longer need it then please delete it manually
    $
 
+.. _devtool-finish-working-on-a-recipe:
+
+Finish Working on a Recipe
+==========================
+
+Use the ``devtool finish`` command to push any committed changes to the
+specified recipe in the specified layer and remove it from your workspace.
+
+This is roughly equivalent to the ``devtool update-recipe`` command followed by
+the ``devtool reset`` command. The changes must have been committed to the git
+repository created by ``devtool``. Here is an example::
+
+  $ devtool finish recipe /path/to/custom/layer
+
 .. _devtool-building-your-recipe:
 
 Building Your Recipe
@@ -614,3 +628,41 @@ a match.
 
 When you use the ``devtool search`` command, you must supply a keyword.
 The command uses the keyword when searching for a match.
+
+Alternatively, the ``devtool find-recipe`` command can be used to search for
+recipe files instead of recipe names. Likewise, you must supply a keyword.
+
+.. _devtool-get-the-configure-script-help:
+
+Get Information on Recipe Configuration Scripts
+===============================================
+
+Use the ``devtool configure-help`` command to get help on the configuration
+script options for a given recipe. You must supply the recipe name to the
+command.
+
+The ``configure-help`` command will also display the configuration options
+currently in use, including the ones passed through the :term:`EXTRA_OECONF`
+variable.
+
+.. _devtool-generate-an-ide-configuration-for-a-recipe:
+
+Generate an IDE Configuration for a Recipe
+==========================================
+
+The ``devtool ide-sdk`` automatically creates an IDE configuration and SDK to
+work on a given recipe. Depending on the ``--mode`` parameter, different types
+of SDKs are generated:
+
+-  ``modified`` mode: this creates an SDK and generates an IDE configuration in
+   the workspace directory.
+
+-  ``shared`` mode: this creates a cross-compiling toolchain and the
+   corresponding shared sysroot directories of the supplied recipe(s).
+
+The ``--target`` option can be used to specify a ``username@hostname`` string
+and create a remote debugging configuration for the recipe.
+
+For further details on the ``devtool ide-sdk`` command, see the
+":doc:`/sdk-manual/extensible`" chapter in the Yocto Project Application
+Development and the Extensible Software Development Kit (eSDK) manual.

-- 
2.46.1


