Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF80CD1CDBD
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 08:38:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.13670.1729586302156310050
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 01:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E/cmCpOj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B00FC4000D;
	Tue, 22 Oct 2024 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729586300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1qV+XFyq6iv2muU4y8QVTOiJzSgDFXVeK1MwgYR2LEQ=;
	b=E/cmCpOj/LHk5gXCJdyc5QXx/XyEWCs/qYjrKv0Yt6AvcFlumvZmYTxQHLM91ykIH1VO5T
	xif1A8TGU1mrVGE1Z+o4N5+yCPLBD3lpIuRKrC1Psrfddg420MB1YKRst1hKpp7FK4ZyXC
	3exIp9PLzqBHLDG3WwSFSsEl5BvWdOQLVXqx0KfV3UAJOz3aXFVfp0jdAZOFhwHVX1vexp
	SBGpP8ot2vpmZ6b9HqfYdXh0HIO3lXQYVbvU1iHn3cRVvKX+i+18prsQIFqgAappBrCVqn
	R3ZmQiyCrOuyqlhuIOBjuQKedKcF4yW53XmsfddPMolJVkFfoxY6egg7TumhRg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 22 Oct 2024 10:37:57 +0200
Subject: [PATCH v2 2/2] ref-manual: devtool-reference: document missing
 commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-devtool-improvements-v2-2-9d2ebf9c5311@bootlin.com>
References: <20241022-devtool-improvements-v2-0-9d2ebf9c5311@bootlin.com>
In-Reply-To: <20241022-devtool-improvements-v2-0-9d2ebf9c5311@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3462;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6u1V8bLMchOMMKyFXTH8K+CHle78Ce4xPF9Plqq3ZD0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnF2R7pOtP5In4V5W+/a088wh0yyJxPvtzEg1i3
 N3fCM2wpqiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxdkewAKCRDRgEFAKaOo
 NlipD/0TA9pzt06hXlE9ROrkrSpp/f2PyNeKPkPPXvq2u3AscdXcslEH9lZtWFLQ/1Kbk9MK5S7
 VOFOXn/Lokm92HmqvR8VoufujuIBa9gRYgudMQUJL/wJjYWTWomlFT7NVIlqVq1Z0VkUNdlX+ZC
 ZxusUrNZnIg6H+iDahl/JgHSNhIYWpBOT6/np1z403thCQKNGB1pAcZb82pBMDc676K5ECfHIHI
 ugyCWsfYsK27xIzTP8pCu/zxy1oUg7eICHHjsp4JEZzVReEEvQ3ewU4Hh8I0Oougxx6ZOINV7sm
 KHCdHcPFsJrwO7uBQBNQp/WU14Xbe8erLK3BfKbDcEbcEJDQ4QGrbasO4ZEHhC2kYwDKx4p7IOP
 q645Mf7tkR7I9zUU9J0NTvxZfLh1brA1JOFgVnlKo9OQgLDo4FSEus7CN3YgrRlC5cPE+9gFk7R
 9kDRYCmIsbjg0TTeG5RFFXqboA18a1g80g2lZ1mRUW1+IY9IgAfwWnxl/JrkwPwAVx8IZxVA64Z
 vzUtL8ELvMJhZWHR2SNCJqwfqrA2qEY12BDGQJblWLIPdJHtVFm3HJnorn9up7g9ycyAe4xhi4f
 0DJIKyY0HxuB7VJGlVuA/Q3CYkBxfArS7ib77rO2YZOTNStMX35RW+Zctk3TrfAxL79qrEo1+N3
 6hF+EOugkjc/ihw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 08:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5549

Give a brief description for important commands that made it into
devtool or that were missing from this quick reference document.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/devtool-reference.rst | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 9c36195c5a5a2405cf8e3a562a2a53291e97c859..4862350f92781c80187a951f149ac2e5ef273510 100644
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
@@ -614,3 +628,43 @@ a match.
 
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
+command. For example, it shows the output of ``./configure --help`` for
+``autotools``-based recipes.
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
+and create a remote debugging configuration for the recipe. Similarly to
+``devtool deploy-target``, it requires an SSH server running on the target.
+
+For further details on the ``devtool ide-sdk`` command, see the
+":doc:`/sdk-manual/extensible`" chapter in the Yocto Project Application
+Development and the Extensible Software Development Kit (eSDK) manual.

-- 
2.46.1


