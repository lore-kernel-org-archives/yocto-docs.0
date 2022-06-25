Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0D5C43334
	for <webhook@archiver.kernel.org>; Sat, 25 Jun 2022 16:13:55 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.21228.1656173633589625588
 for <docs@lists.yoctoproject.org>;
 Sat, 25 Jun 2022 09:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=RDmQZxft;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1656173634;
  x=1687709634;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vAoegsonq3ILNx6fsXNFtkTYXSrrAA9nMcU4OVp9Enw=;
  b=RDmQZxfttbFEs5d9mvxBZYh5LsoMtFmE4lpPLUX9xKhISE07wEX5oN/2
   S37Htuepx8SCDqUyp+729L37dIJs1+9SBa1RTBBAV2MdWDQIEtxJNlyX/
   tNXHYBLsbA/m1BgWWbhGFuFGwcN7JXxB/7PEpbxYqJCTilhyslfzCFcqp
   mmzmOBF3b/D6KgEDKItRLwjP99LpX+7hxelqPGu9jqxgKNMH9kTPktpP3
   8WVF5tt69LfxNI7QNl87+cpaZS39EoEatr5eF5je6OJ1J1igzO3nditLW
   fcBZ1VmnPncGdFl4oc7vTgsX0583FclSv4oB/E1kRedWh5ly4zq/M2n8B
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: Add documentation for
 INCOMPATIBLE_LICENSE_EXCEPTIONS
Date: Sat, 25 Jun 2022 18:13:46 +0200
Message-ID: <20220625161346.31894-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 25 Jun 2022 16:13:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3031

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/migration-guides/migration-4.0.rst | 2 +-
 documentation/ref-manual/variables.rst           | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index a8e6b4c331..79e53f89ac 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -45,7 +45,7 @@ The following variables have changed their names:
 - ``SSTATE_DUPWHITELIST`` became ``SSTATE_ALLOW_OVERLAP_FILES``
 - ``SYSROOT_DIRS_BLACKLIST`` became :term:`SYSROOT_DIRS_IGNORE`
 - ``UNKNOWN_CONFIGURE_WHITELIST`` became :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
-- ``WHITELIST_<license>`` became ``INCOMPATIBLE_LICENSE_EXCEPTIONS``
+- ``WHITELIST_<license>`` became :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`
 
 In addition, ``BB_STAMP_WHITELIST``, ``BB_STAMP_POLICY``, ``INHERIT_BLACKLIST``,
 ``TUNEABI``, ``TUNEABI_WHITELIST``, and ``TUNEABI_OVERRIDE`` have been removed.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 28267101d8..e471d4fe12 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3544,6 +3544,14 @@ system and gives an overview of their function and contents.
          remove dependencies on or provide alternatives to components that
          are required to produce a functional system image.
 
+   :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`
+      Specifies a space-separated list of package and license pairs that
+      are allowed to be used even if the license is specified in
+      :term:`INCOMPATIBLE_LICENSE`. The package and license pairs are
+      separated using a colon. Example::
+
+         INCOMPATIBLE_LICENSE_EXCEPTIONS = "gdbserver:GPL-3.0-only gdbserver:LGPL-3.0-only"
+
    :term:`INHERIT`
       Causes the named class or classes to be inherited globally. Anonymous
       functions in the class or classes are not executed for the base

