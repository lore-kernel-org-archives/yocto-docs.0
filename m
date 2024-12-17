Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F89E77189
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.77668.1734427636798655353
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lcWixDC5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EC691C0003;
	Tue, 17 Dec 2024 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wg/v4aCvjRqRNfeOJKGzk4LJ9dprlXpUpMMoOm0bZiM=;
	b=lcWixDC5UH++EJ/pPwWjHLKpKck6joE6WXKhxSQ9Y2GvE0xL3N/FuT02AGZbmE2EGeuSBP
	Hil8jH0QJoLhl3DbxrO9SyNCxoMPPmj2hfnbzTIxpgc4ExYlLyG1/Utt97puAJbpsXsbUy
	5BJTLcdke0LvftAmvYca/v4ZCDn6tXqRZTfDnBgsgg66n8PHV9/wFxK3Hzam06dV+BSqOa
	Fs0OTmO2A5mUjf0kvinIL2nDJjp716YcTtO4VVQJZsCdIs+rhdL0Gahe//ML1un7dJI+6L
	i8W9sGUcchGtXhIkDq0ik0sd8NIvMp0FYV6D3mZUle+/J2zXx7J+oRMargBbdA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:08 +0100
Subject: [yocto-docs PATCH 09/14] Drop support for
 BB_DANGLINGAPPENDS_WARNONLY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-9-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3622;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KAzLu3aqHO3JRCKRKaYSI213MlCBjj7cxGrCnNw9roM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPw882JQyyjQQ6hcSB6QMYVPqfVmvKvYWeXW
 5IrDyYdJtiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD8AAKCRDRgEFAKaOo
 NhE+D/0a+z5YQcHXZYAdgwma/Qn7HsswYv2qVr5dUqbDFUxNVQJywbIqph9JQAOJ37qKNrRVWFu
 Gm8aXDbKCgcN4GUr/4rvWDnGhbrzEj+m2HR4azlhYvg+2gu9l6OYxvyve4YMAhDtLpjsCCxQztB
 da31d7Obx3+E+KW4rvgKy2TJpUzRQIOdF6POqNj23Wo0IJziEOWiayP4utv9fH68k3an1chCf2F
 w/iREBaNsT6GdFP6oUm6zf13dM4fxpg3Qau0XxO43AEu4Oh4HjdZr/pK3WKCUzSduUdbNAcGd54
 tzu4UBiP6z87Gbb9Vp4+m8OI4ysph03Ps18Zd+FXNv5D48nh+mbGOQopWKYipOtZGn5R0nZQ6n3
 s8J28Br/A0x+YkJcebQuuFHDnk61sOJMM7KiZd9Cc8TuY8ZDh0XNhaKNbjWEGbS433SVMP9RGYm
 3r6tGa8au1UrBohlF63jNzjrdpuyMmRN/cxgLUnm7rx8WQGSj1T7AChLpXUedQhZAfNY31lG+0L
 fGPmCN20ZEGFVUBbePbrCpaEnTkMRHJ9CIVKR+KnZzu97rDvt8N7NnK4Zo5ssh5LUXPzdXGF8Lg
 YuLtfgMeD+XWta6Xeli9z2gbmM5NRtMuCopg5K0J4Z6ihXmoNAU6GVwebTOjgtOkCn0YcxUYEwG
 bI1xM7vojW2sMnw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5942

Support for this variable was dropped in BitBake, see commit
fca9c9e3cb6f8e9f99bf51dc5e8a8d83f4c84c69 ("cooker: Drop support for
BB_DANGLINGAPPENDS_WARNONLY").

Drop this variable here as well and rewrite the "Appending Other Layers
Metadata With Your Layer" section to advise to rename the recipe and
check if the bbappend is still relevant - otherwise to use BBWARN.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/layers.rst    | 15 ++++++++++-----
 documentation/ref-manual/variables.rst | 18 ------------------
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 89c84669337c9ecdc90110fdf34b7949459a1b9f..365991c225159d051f6dc4122625616b81f01ee3 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -470,11 +470,16 @@ corresponding recipe file. For example, the append file
 means the original recipe and append filenames are version
 number-specific. If the corresponding recipe is renamed to update to a
 newer version, you must also rename and possibly update the
-corresponding ``.bbappend`` as well. During the build process, BitBake
-displays an error on starting if it detects a ``.bbappend`` file that
-does not have a corresponding recipe with a matching name. See the
-:term:`BB_DANGLINGAPPENDS_WARNONLY`
-variable for information on how to handle this error.
+corresponding ``.bbappend`` as well.
+
+During the build process, BitBake displays an error on startup if it detects a
+``.bbappend`` file that does not have a corresponding recipe with a matching
+name. To handle these errors, the better practice is to rename the ``.bbappend``
+to match the original recipe version. This also gives you the opportunity to see
+if the ``.bbappend`` is still relevant for the new version of the recipe.
+
+Another method to deal with these errors is to use the variable :term:`BBMASK`,
+especially in cases where modifying the ``.bbappend`` is not possible.
 
 Overlaying a File Using Your Layer
 ----------------------------------
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 08fb0f4d5666b80be153f39310826a7e1b9022fe..d54e1365fcf3dabd3868aa80089afda727b1415a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -362,24 +362,6 @@ system and gives an overview of their function and contents.
    :term:`BB_CURRENTTASK`
       See :term:`bitbake:BB_CURRENTTASK` in the BitBake manual.
 
-   :term:`BB_DANGLINGAPPENDS_WARNONLY`
-      Defines how BitBake handles situations where an append file
-      (``.bbappend``) has no corresponding recipe file (``.bb``). This
-      condition often occurs when layers get out of sync (e.g. ``oe-core``
-      bumps a recipe version and the old recipe no longer exists and the
-      other layer has not been updated to the new version of the recipe
-      yet).
-
-      The default fatal behavior is safest because it is the sane reaction
-      given something is out of sync. It is important to realize when your
-      changes are no longer being applied.
-
-      You can change the default behavior by setting this variable to "1",
-      "yes", or "true" in your ``local.conf`` file, which is located in the
-      :term:`Build Directory`: Here is an example::
-
-         BB_DANGLINGAPPENDS_WARNONLY = "1"
-
    :term:`BB_DEFAULT_TASK`
       See :term:`bitbake:BB_DEFAULT_TASK` in the BitBake manual.
 

-- 
2.47.1


