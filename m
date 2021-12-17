Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E58C433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 14:04:23 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.6462.1639749862007784470
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Dec 2021 06:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1E156100011;
	Fri, 17 Dec 2021 14:04:19 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: prepare for release 3.5
Date: Fri, 17 Dec 2021 15:04:15 +0100
Message-Id: <20211217140415.49840-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 150
X-GND-Status: SPAM
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 14:04:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2305

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/index.rst      |  1 +
 .../migration-guides/migration-3.5.rst        | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 documentation/migration-guides/migration-3.5.rst

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index 287b553195..6472cc2848 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   migration-3.5
    migration-3.4
    migration-3.3
    migration-3.2
diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
new file mode 100644
index 0000000000..c63c9dff05
--- /dev/null
+++ b/documentation/migration-guides/migration-3.5.rst
@@ -0,0 +1,37 @@
+Release 3.5 (kirkstone)
+=======================
+
+This section provides migration information for moving to the Yocto
+Project 3.5 Release (codename "kirkstone") from the prior release.
+
+Recipe changes
+--------------
+
+- Because of the uncertainty in future default branch names in git repositories,
+  it is now required to add a branch name to all URLs described
+  by ``git://`` and ``gitsm://`` :term:`SRC_URI` entries. For example::
+
+     SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
+
+  A :oe_git:`convert-srcuri </openembedded-core/tree/scripts/contrib/convert-srcuri.py>`
+  script to convert your recipes is available in :term:`OpenEmbedded-Core (OE-Core)`
+  and in :term:`Poky`.
+
+- Because of `GitHub dropping support for the git:
+  protocol <https://github.blog/2021-09-01-improving-git-protocol-security-github/>`,
+  recipes now need to use ``;protocol=https`` at the end of GitHub
+  URLs. The same script as above can be used to convert the recipes.
+
+- The :term:`TOPDIR` variable and the current working directory are no longer modified
+  when parsing recipes. Any code depending on that behaviour will no longer worked as
+  expected (we don't know of any).
+
+- BitBake no longer supports ``append``, ``prepend`` and ``remove`` operators
+  combined with the ``+=``, ``=+``, ``.=``, ``=.`` and ``?=`` operators.
+  Such operations should be made using ``=`` alone. This means that
+  a leading space may need to be explicitly added.
+
+- :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
+  which use ``PKG:xxx`` renaming such as :ref:`debian.bbclass <ref-classes-debian>`.
+  Doing this will produce an error.
+
-- 
2.25.1


