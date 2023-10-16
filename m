Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319BBCDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 12:16:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.120463.1697458586012921447
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 05:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198, mailfrom: foss+yocto@0leil.net)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 823C9C0003;
	Mon, 16 Oct 2023 12:16:23 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] ref-manual: variables: provide no-match example for COMPATIBLE_MACHINE
Date: Mon, 16 Oct 2023 14:16:04 +0200
Message-ID: <20231016-dev-compatible_machine-v1-1-6528e1c98611@theobroma-systems.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: foss@0leil.net
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 12:16:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4376

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

COMPATIBLE_MACHINE is used to forbid the use of a recipe or its packages
for a specific set of machines.

In some cases, it may make more sense to have the logic inverted and
have the recipe always forbidden except for hand-picked machines. Such
could be the case for pieces of software that only support some
architectures. In that scenario, it is sometimes a bit easier on the eye
and for maintenance to use the OVERRIDES mechanism but for that, a
default should be set.

COMPATIBLE_MACHINE:aarch64 = "$(aarch64)$"
COMPATIBLE_MACHINE:mips64 = "$(mips64)$"

wouldn't do much because if COMPATIBLE_MACHINE isn't set, the recipe is
assumed compatible and therefore, if no default is provided we enter
that case.

Hence, we need to add

COMPATIBLE_MACHINE = "^$"

as default so that it only matches the empty string, which isn't
possible for MACHINEOVERRIDES.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/variables.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 11523bb9e..370b5bfbf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1358,6 +1358,26 @@ system and gives an overview of their function and contents.
       speed since the build system skips parsing recipes not compatible
       with the current machine.
 
+      If one wants to have a recipe only available for some architectures
+      (here `aarch64` and `mips64`), the following can be used::
+
+         COMPATIBLE_MACHINE = "^$"
+         COMPATIBLE_MACHINE:arch64 = "^(aarch64)$"
+         COMPATIBLE_MACHINE:mips64 = "^(mips64)$"
+
+      The first line means "match all machines whose :term:`MACHINEOVERRIDES`
+      contains the empty string", which will always be none.
+
+      The second is for matching all machines whose :term:`MACHINEOVERRIDES`
+      contains one override which is exactly `aarch64`.
+
+      The third is for matching all machines whose :term:`MACHINEOVERRIDES`
+      contains one override which is exactly `mips64`.
+
+      The same could be achieved with::
+
+         COMPATIBLE_MACHINE = "^(aarch64|mips64)$"
+
    :term:`COMPLEMENTARY_GLOB`
       Defines wildcards to match when installing a list of complementary
       packages for all the packages explicitly (or implicitly) installed in

---
base-commit: ceb1812e63b9fac062f886c2a1dde23137c0e1ed
change-id: 20231016-dev-compatible_machine-2b0d5c26e12a

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>

