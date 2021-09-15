Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.481.1631728737078241662
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 10:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id AEA88240002;
	Wed, 15 Sep 2021 17:58:55 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v3 3/5] ref-manual: improve "devtool check-upgrade-status" details
Date: Wed, 15 Sep 2021 19:58:40 +0200
Message-Id: <20210915175842.2998541-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org>
 <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Mention "devtool latest-version recipe" to process a single version
- Explain that the mechanism is controlled by the UPSTREAM_CHECK*
  variables, which are not referred to anywhere else in the manuals,
  except in the variable index.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../ref-manual/devtool-reference.rst          | 29 +++++++++++++------
 documentation/ref-manual/variables.rst        |  4 +--
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 5fd51569a3..2cf9fd43a3 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -328,12 +328,19 @@ Checking on the Upgrade Status of a Recipe
 Upstream recipes change over time. Consequently, you might find that you
 need to determine if you can upgrade a recipe to a newer version.
 
-To check on the upgrade status of a recipe, use the
-``devtool check-upgrade-status`` command. The command displays a table
-of your current recipe versions, the latest upstream versions, the email
-address of the recipe's maintainer, and any additional information such
-as commit hash strings and reasons you might not be able to upgrade a
-particular recipe.
+To check on the upgrade status of a recipe, you can use the
+``devtool latest-version recipe`` command, which quickly shows the current
+version and the latest version available upstream. To get such information
+for all available recipes, use the ``devtool check-upgrade-status`` command.
+The command displays a table of your current recipe versions, the latest
+upstream versions, the email address of the recipe's maintainer, and any
+additional information such as commit hash strings and reasons you might
+not be able to upgrade a particular recipe.
+
+This upgrade checking mechanism relies on the optional :term:`UPSTREAM_CHECK_URI`,
+:term:`UPSTREAM_CHECK_REGEX`, :term:`UPSTREAM_CHECK_GITTAGREGEX`,
+:term:`UPSTREAM_CHECK_COMMITS` and :term:`UPSTREAM_VERSION_UNKNOWN`
+variables which are defined in package recipes.
 
 .. note::
 
@@ -342,9 +349,10 @@ particular recipe.
       file.
 
    -  If the recipe is using the :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:git fetcher (\`\`git://\`\`)`
-      rather than a
-      tarball, the commit hash points to the commit that matches the
-      recipe's latest version tag.
+      rather than a tarball, the commit hash points to the commit that matches
+      the recipe's latest version tag, or in the absence of suitable tags,
+      to the latest commit (when :term:`UPSTREAM_CHECK_COMMITS` set to ``1``
+      in the recipe).
 
 As with all ``devtool`` commands, you can get help on the individual
 command::
@@ -393,6 +401,9 @@ satisfied.
    NOTE: busybox 1.29.2 1.30.0 Andrej Valek <andrej.valek@siemens.com>
    NOTE: dbus-test 1.12.10 1.12.12 Chen Qi <Qi.Chen@windriver.com>
 
+Last but not least, you may set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1``
+in a recipe when no way is found to determine its latest upstream version.
+
 .. _devtool-upgrading-a-recipe:
 
 Upgrading a Recipe
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2342846dc7..7545e708c6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8534,9 +8534,9 @@ system and gives an overview of their function and contents.
       You can perform a per-recipe check for what the latest upstream
       source code version is by calling ``devtool latest-version recipe``.
       If no combination of the :term:`UPSTREAM_CHECK_URI`, :term:`UPSTREAM_CHECK_REGEX`,
-      `UPSTREAM_CHECK_GITTAGREGEX` and :term:`UPSTREAM_CHECK_COMMITS` variables in
+      :term:`UPSTREAM_CHECK_GITTAGREGEX` and :term:`UPSTREAM_CHECK_COMMITS` variables in
       the recipe allows to determine such an latest upstream version,
-      you can set :term:`UPSTREAM_VERSION_UNKNOWN`` to ``1`` in the recipe
+      you can set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1`` in the recipe
       to acknowledge that the check cannot be performed.
       ::
 
-- 
2.25.1

