Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.5489.1631700749609488984
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 03:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D1EE42000C;
	Wed, 15 Sep 2021 10:12:27 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/4] ref-manual: remove checkpkg task
Date: Wed, 15 Sep 2021 12:12:16 +0200
Message-Id: <20210915101219.2198566-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It doesn't exist any more and its functionality is now taken care
of by "devtool check-upgrade-status"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/tasks.rst     | 31 --------------------------
 documentation/ref-manual/variables.rst |  4 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index ecc701856c..4edae33392 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -438,37 +438,6 @@ Manually Called Tasks
 These tasks are typically manually triggered (e.g. by using the
 ``bitbake -c`` command-line option):
 
-.. _ref-tasks-checkpkg:
-
-``do_checkpkg``
----------------
-
-Provides information about the recipe including its upstream version and
-status. The upstream version and status reveals whether or not a version
-of the recipe exists upstream and a status of not updated, updated, or
-unknown.
-
-To check the upstream version and status of a recipe, use the following
-devtool commands::
-
-   $ devtool latest-version
-   $ devtool check-upgrade-status
-
-See the ":ref:`ref-manual/devtool-reference:\`\`devtool\`\` quick reference`"
-chapter for more information on
-``devtool``. See the ":ref:`devtool-checking-on-the-upgrade-status-of-a-recipe`"
-section for information on checking the upgrade status of a recipe.
-
-To build the ``checkpkg`` task, use the ``bitbake`` command with the
-"-c" option and task name::
-
-   $ bitbake core-image-minimal -c checkpkg
-
-By default, the results are stored in :term:`$LOG_DIR <LOG_DIR>` (e.g.
-``$BUILD_DIR/tmp/log``).
-
-.. _ref-tasks-checkuri:
-
 ``do_checkuri``
 ---------------
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5caada6260..74d04dfd49 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8485,7 +8485,7 @@ system and gives an overview of their function and contents.
 
    :term:`UPSTREAM_CHECK_GITTAGREGEX`
       You can perform a per-recipe check for what the latest upstream
-      source code version is by calling ``bitbake -c checkpkg`` recipe. If
+      source code version is by calling ``devtool latest-version recipe``. If
       the recipe source code is provided from Git repositories, the
       OpenEmbedded build system determines the latest upstream version by
       picking the latest tag from the list of all repository tags.
@@ -8508,7 +8508,7 @@ system and gives an overview of their function and contents.
 
    :term:`UPSTREAM_CHECK_URI`
       You can perform a per-recipe check for what the latest upstream
-      source code version is by calling ``bitbake -c checkpkg`` recipe. If
+      source code version is by calling ``devtool latest-version recipe``. If
       the source code is provided from tarballs, the latest version is
       determined by fetching the directory listing where the tarball is and
       attempting to find a later tarball. When this approach does not work,
-- 
2.25.1

