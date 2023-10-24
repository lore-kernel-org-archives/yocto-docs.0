Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4112DC27C46
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.147729.1698154051910349025
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JuyU2QjT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5164DFF815;
	Tue, 24 Oct 2023 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crEVbVfhOk1ENfeBBYPiXIp94ZSfks+g4VK2qXXoDyk=;
	b=JuyU2QjTaSQ5SKDI5I1Btht+ZZEGWEX7/dcSPSMZI9Hjw4ivGogFwaYaP16JjQwas180ik
	FvAQ01auWQxdWL08jUQSejwhtY0XNqvkoQe4SJrl934PhpfONbYgA36RXdEkFRLqbdb6o8
	u6JvmJRB4k9y98pA26Zq3/gWAwgQE7DlbNUSZqH3w4LAkJAZ9YXQkooEjOoWsDfcqnDsZa
	rM8Odp2zeQsdhgX/LO77nPCSR+wtcWJdfQPU+67fjrdUB5G8ULiRtiCzpazuvAP4IbWbkr
	loREB7ZuTniL/FTgjVCTYAi6sqdMFnIA9LDdvjmDFPwTRrEH+fwnBQfomLeLDA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [kirkstone][PATCH 10/16] ref-manual: variables: provide no-match example for COMPATIBLE_MACHINE
Date: Tue, 24 Oct 2023 15:27:06 +0200
Message-Id: <20231024132712.90600-11-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4485

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
index 5d45f4a9f9..38b13ecf8d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1202,13 +1202,32 @@ system and gives an overview of their function and contents.
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


