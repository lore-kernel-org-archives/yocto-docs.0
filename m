Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EA7C25B6F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:23:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.147624.1698153822696470967
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cF3HrAc3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB6EB240006;
	Tue, 24 Oct 2023 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698153821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yKg4mMoAwtyK0oHTZ5C0w3rpfyM+xT/hZJ/dkUzNt5Q=;
	b=cF3HrAc3EhCqi7WinJzfv3+AaaCGQzdF5ooomLO5zWGPW3cD/dKuxBB6GxvabMUr0IXLxZ
	5jBudWuMGOkB6+/gnfLdv+xGuXuWrsgdZc6C6TE0MPhsjPIRsOMZJrQA6s5QD/Dj1cPuZd
	z67XPKINkcsSQIX/TwgsTfRIpDj5EJ4mp4lkYOKDBx1FEc1W1A6IOFmUc7TDpWXWZjdOyA
	1GKs1j6fGU0RGjyKUd0MqsNXXh9Cjoc5FbKX6v4A9DyE0WCvhC38gHg9R6W26Ms/jPZmgp
	PWuyiOggoBlRSE1QRLzq0MdNwE0vWgwgSGeqdSQIdOc9bKHFP4hH6du+tzF7gQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [mickledore][PATCH 07/13] ref-manual: variables: provide no-match example for COMPATIBLE_MACHINE
Date: Tue, 24 Oct 2023 15:23:12 +0200
Message-Id: <20231024132318.90209-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
References: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4468

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

COMPATIBLE_MACHINE is used to forbid the use of a recipe or its packages
for a specific set of machines.

In some cases, it may make more sense to have the logic inverted and
have the recipe always forbidden except for hand-picked machines. Such
could be the case for pieces of software that only support some
architectures. In that scenario, it is sometimes a bit easier on the eye
and for maintenance to use the OVERRIDES mechanism but for that, a
default should be set.

COMPATIBLE_MACHINE:aarch64 = "^(aarch64)$"
COMPATIBLE_MACHINE:mips64 = "^(mips64)$"

wouldn't do much because if COMPATIBLE_MACHINE isn't set, the recipe is
assumed compatible and therefore, if no default is provided we enter
that case.

Hence, we need to add

COMPATIBLE_MACHINE = "^$"

as default so that it only matches the empty string, which isn't
possible for MACHINEOVERRIDES.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8d557495d4..eb19048db2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1362,13 +1362,32 @@ system and gives an overview of their function and contents.
       speed since the build system skips parsing recipes not compatible
       with the current machine.
 
+      If one wants to have a recipe only available for some architectures
+      (here ``aarch64`` and ``mips64``), the following can be used::
+
+         COMPATIBLE_MACHINE = "^$"
+         COMPATIBLE_MACHINE:arch64 = "^(aarch64)$"
+         COMPATIBLE_MACHINE:mips64 = "^(mips64)$"
+
+      The first line means "match all machines whose :term:`MACHINEOVERRIDES`
+      contains the empty string", which will always be none.
+
+      The second is for matching all machines whose :term:`MACHINEOVERRIDES`
+      contains one override which is exactly ``aarch64``.
+
+      The third is for matching all machines whose :term:`MACHINEOVERRIDES`
+      contains one override which is exactly ``mips64``.
+
+      The same could be achieved with::
+
+         COMPATIBLE_MACHINE = "^(aarch64|mips64)$"
+
       .. note::
 
          When :term:`COMPATIBLE_MACHINE` is set in a recipe inherits from
          native, the recipe is always skipped. All native recipes must be
          entirely target independent and should not rely on :term:`MACHINE`.
 
-
    :term:`COMPLEMENTARY_GLOB`
       Defines wildcards to match when installing a list of complementary
       packages for all the packages explicitly (or implicitly) installed in
-- 
2.34.1


