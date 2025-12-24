Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEA2E776CA
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:31:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123182.1766593908755359232
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NTHug5SB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 424631A23E1
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1990B6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7961B10AB136F;
	Wed, 24 Dec 2025 17:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2b60xFxDmvEZjUxiZOq+wco1w6UC5M1sfNQpMXeTWqc=;
	b=NTHug5SBSvlixwNci8O1qUpQOIJJyqJeRclx1o4I/Nshdh3oN2+zD11NeWqayTGjqUjrh7
	+RcaeEreUof2LClp6eQ+IzPe2F0gxP3fowAGbPUWIlqE234nwv+011XYjwUCIoK7HWcY+L
	dp3kO/ORQBUoR8Ub98lxu7caCzfidw/IdKXBqZE1rirHePEVOwTw8YyaMfKB8rXE1KYr2M
	SHg4iU5mioOhG9KMyYSWzJCYJmtBavDkRz03ehQcAdaLm3kNP5+Gr7Fnz8k4cA2vsmU1Qy
	glFqKDKq53SJbwV44NMSHR2J7UH5TCEzKRR0xyhVA91Ok1cs6t84Jci21NJAaQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:27 +0100
Subject: [PATCH 01/53] transitioning-to-a-custom-environment.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-1-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3345;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0lTEteHjsuziwK771asb+iE7y9lsxO1uNIROFhsaphM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVmFCTzPipI9vGdpzc3/8ScAGXlPzgUAMpnz
 ch3kz8owACJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVZgAKCRDRgEFAKaOo
 Nqr1D/9fAopE7N2agcI0u8J5TnedR3vNZCNN8UjtbX9C9iuy3Ta4zw5mXKppOLRApA7sAX776h9
 C/qVYrVzWR/xGLM6MhDzW5RGFRG7mYobG+U/I1BpasgETdY2pKDt6R/ogR29P1byed1adQ2O9oY
 0HZVbBbjJQv44NUYhxa1aab6YUDeJeJ/k5ft/UHi/2B24TQJ1FmWOg+u7tAqVj9iRFTX625qf8K
 2Ge0apwEbvIBeDqtnEj1IdfPXU9kxpBCbITcDobY/dSIMuMWQF/dmHFF/ZcKGxYwfqdi0EljHrz
 e8MgtjGYTD0tTOxz4FRJZ70/0NEfyUCIHU3lS3w90/vDpJlah9e5YT2ENO9wSUGj5QPZRil3V7g
 kl1XwiXeNGLgiewc9KBWTG1upIpJqdKpFz+7wkdKiIx/vF9VzdC2u9eqQ5ehy7fysyUEd2xATug
 jDThwFHUww6kLycvK/dr14NC6vlqFEtG3d3gwmX5Ng/NwYH7XD4+U21xoxe2ymoJFYkegpk9v3t
 GPBhNHbEE3Uo52hUc3iBDxmr6jJsof+i5XbIrzjDClDUDRB8WltJu0Ezmmy3c8zJqGZhWQ6Ag5U
 VsiDPLbjh/RZrH+qKoV8nuL1u3+5U++/JIYAICOpgs4a/gy3u8vpze/I3bZa2/apD2FIsbQRngs
 A5GI/ptWR5WHgJg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8330

- Use :term: for Poky.
- Mention use of fragments instead of local.conf.
- Remove Yocto < 2.4 reference.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../transitioning-to-a-custom-environment.rst          | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index a5f55c567..e292399f4 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -39,7 +39,7 @@ Transitioning to a custom environment for systems development
    that you've downloaded. Be aware that some BSPs may not be immediately
    supported on the very latest release, but they will be eventually.
 
-   You might want to start with the build specification that Poky provides
+   You might want to start with the build specification that :term:`Poky` provides
    (which is reference embedded distribution) and then add your newly chosen
    layers to that. Here is the information :ref:`about adding layers
    <dev-manual/layers:Understanding and Creating Layers>`.
@@ -48,16 +48,14 @@ Transitioning to a custom environment for systems development
    configuration**.
    For instance, you've chosen a machine type and added in the corresponding BSP
    layer. You'll then need to change the value of the :term:`MACHINE` variable in your
-   configuration file (build/local.conf) to point to that same machine
-   type. There could be other layer-specific settings you need to change as
-   well. Each layer has a ``README`` document that you can look at for this type of
-   usage information.
+   configuration (using the :ref:`ref-fragments-builtin-core-machine`
+   fragment) to point to that same machine type. There could be other
+   layer-specific settings you need to change as well. Each layer has a
+   ``README`` document that you can look at for this type of usage information.
 
 #. **Add a new layer for any custom recipes and metadata you create**.
-   Use the ``bitbake-layers create-layer`` tool for Yocto Project 2.4+
-   releases. If you are using a Yocto Project release earlier than 2.4, use the
-   ``yocto-layer create`` tool. The ``bitbake-layers`` tool also provides a number
-   of other useful layer-related commands. See
+   Use the ``bitbake-layers create-layer`` command. The ``bitbake-layers`` tool
+   also provides a number of other useful layer-related commands. See
    :ref:`dev-manual/layers:creating a general layer using the
    \`\`bitbake-layers\`\` script` section.
 
@@ -99,7 +97,7 @@ Transitioning to a custom environment for systems development
 
    Distribution settings define the packaging back-end (e.g. rpm or other) as
    well as the package feed and possibly the update solution. You would create
-   your own distribution in a new layer inheriting from Poky but overriding what
+   your own distribution in a new layer inheriting from :term:`Poky` but overriding what
    needs to change for your distribution. If you find yourself adding a lot of
    configuration to your local.conf file aside from paths and other typical
    local settings, it's time to :ref:`consider creating your own distribution

-- 
2.51.0


