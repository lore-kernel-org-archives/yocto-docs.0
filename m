Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EB0C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 14:46:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.7920.1642171564842417311
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 06:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0C70A2000E;
	Fri, 14 Jan 2022 14:46:02 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: Drop TUNEABI, TUNEABI_WHITELIST, TUNEABI_OVERRIDE
Date: Fri, 14 Jan 2022 15:45:54 +0100
Message-Id: <20220114144554.2485691-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Jan 2022 14:46:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2410

Following their removal from openembedded-core

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 34 --------------------------
 1 file changed, 34 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 76831003d1..4402cc9d24 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8225,40 +8225,6 @@ system and gives an overview of their function and contents.
 
          TUNE_PKGARCH:tune-core2-32 = "core2-32"
 
-   :term:`TUNEABI`
-      An underlying Application Binary Interface (ABI) used by a particular
-      tuning in a given toolchain layer. Providers that use prebuilt
-      libraries can use the :term:`TUNEABI`,
-      :term:`TUNEABI_OVERRIDE`, and
-      :term:`TUNEABI_WHITELIST` variables to check
-      compatibility of tunings against their selection of libraries.
-
-      If :term:`TUNEABI` is undefined, then every tuning is allowed. See the
-      :ref:`sanity <ref-classes-sanity>` class to see how the variable is
-      used.
-
-   :term:`TUNEABI_OVERRIDE`
-      If set, the OpenEmbedded system ignores the
-      :term:`TUNEABI_WHITELIST` variable.
-      Providers that use prebuilt libraries can use the
-      :term:`TUNEABI_OVERRIDE`, :term:`TUNEABI_WHITELIST`, and
-      :term:`TUNEABI` variables to check compatibility of a
-      tuning against their selection of libraries.
-
-      See the :ref:`sanity <ref-classes-sanity>` class to see how the
-      variable is used.
-
-   :term:`TUNEABI_WHITELIST`
-      A list of permissible :term:`TUNEABI` values. If
-      :term:`TUNEABI_WHITELIST` is not set, all tunes are allowed. Providers
-      that use prebuilt libraries can use the :term:`TUNEABI_WHITELIST`,
-      :term:`TUNEABI_OVERRIDE`, and :term:`TUNEABI`
-      variables to check compatibility of a tuning against their selection
-      of libraries.
-
-      See the :ref:`sanity <ref-classes-sanity>` class to see how the
-      variable is used.
-
    :term:`TUNECONFLICTS[feature]`
       Specifies CPU or Application Binary Interface (ABI) tuning features
       that conflict with feature.
-- 
2.25.1


