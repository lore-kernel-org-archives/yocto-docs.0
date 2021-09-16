Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.251.1631809896809790185
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 09:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 711E020002;
	Thu, 16 Sep 2021 16:31:35 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v4 3/5] ref-manual: improve "devtool check-upgrade-status" details
Date: Thu, 16 Sep 2021 18:31:29 +0200
Message-Id: <20210916163129.24479-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16A55A6689FB2BAD.27526@lists.yoctoproject.org>
References: <16A55A6689FB2BAD.27526@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Mention "devtool latest-version recipe" to process a single version
- Explain that the mechanism is controlled by the UPSTREAM_CHECK*
  variables, which are not referred to anywhere else in the manuals,
  except in the variable index.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../ref-manual/devtool-reference.rst          | 36 ++++++++++++++-----
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 5fd51569a3..3e06864f76 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -328,23 +328,37 @@ Checking on the Upgrade Status of a Recipe
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
+version and the latest version available upstream. To get a more global
+picture, use the ``devtool check-upgrade-status`` command, which takes a
+list of recipes as input, or no arguments, in which case it checks all
+available recipes. This command will only print the recipes for which
+a new upstream version is available. Each such recipe will have its current
+version and latest upstream version, as well as the email of the maintainer
+and any additional information such as the commit hash or reason for not
+being able to upgrade it, displayed in a table.
+
+This upgrade checking mechanism relies on the optional :term:`UPSTREAM_CHECK_URI`,
+:term:`UPSTREAM_CHECK_REGEX`, :term:`UPSTREAM_CHECK_GITTAGREGEX`,
+:term:`UPSTREAM_CHECK_COMMITS` and :term:`UPSTREAM_VERSION_UNKNOWN`
+variables in package recipes.
 
 .. note::
 
+   -  Most of the time, the above variables are unnecessary. They are only
+      required when upstream does something unusual, and default
+      mechanisms cannot find the new upstream versions.
+
    -  For the ``oe-core`` layer, recipe maintainers come from the
       :yocto_git:`maintainers.inc </poky/tree/meta/conf/distro/include/maintainers.inc>`
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
@@ -393,6 +407,10 @@ satisfied.
    NOTE: busybox 1.29.2 1.30.0 Andrej Valek <andrej.valek@siemens.com>
    NOTE: dbus-test 1.12.10 1.12.12 Chen Qi <Qi.Chen@windriver.com>
 
+Last but not least, you may set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1``
+in a recipe when there's currently no way to determine its latest upstream
+version.
+
 .. _devtool-upgrading-a-recipe:
 
 Upgrading a Recipe
-- 
2.25.1

