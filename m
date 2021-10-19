Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66462C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 14:18:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.10217.1634653113901128198
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C212360010;
	Tue, 19 Oct 2021 14:18:31 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/3] ref-manual: document BUILD_REPRODUCIBLE_BINARIES
Date: Tue, 19 Oct 2021 16:18:22 +0200
Message-Id: <20211019141824.1980728-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
References: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Oct 2021 14:18:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2000

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-3.4.rst |  2 +-
 documentation/ref-manual/variables.rst           | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 9ef1982026..592dbc57c4 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -243,7 +243,7 @@ Miscellaneous
   re-enable it, set ``AVAHI_GTK = "gtk3"`` in a bbappend for the
   ``avahi`` recipe or in your custom distro configuration file.
 
-- Setting the ``BUILD_REPRODUCIBLE_BINARIES`` variable to "0" no longer
+- Setting the :term:`BUILD_REPRODUCIBLE_BINARIES` variable to "0" no longer
   uses a strangely old fallback date of April 2011, it instead disables
   building reproducible binaries as you would logically expect.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 85f65cae35..9daf230a59 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -906,6 +906,19 @@ system and gives an overview of their function and contents.
       :term:`TARGET_PREFIX` when building for
       ``native`` recipes.
 
+   :term:`BUILD_REPRODUCIBLE_BINARIES`
+      This variable allows the image building classes and recipes to produce
+      :ref:`reproducible binaries <test-manual/reproducible-builds:reproducible builds>`
+
+      If you inherit the
+      :ref:`reproducible-build <ref-classes-reproducible-build>` class,
+      which is the case of the Poky reference distribution, this sets this
+      variable to "1".
+
+      If your build inherits this classs but you wish to disable reproducible
+      binary generation for specific packages or images, you can set this
+      variable to "0" in the corresponding recipes.
+
    :term:`BUILD_STRIP`
       Specifies the command to be used to strip debugging symbols from
       binaries produced for the build host. By default, :term:`BUILD_STRIP`
-- 
2.25.1


