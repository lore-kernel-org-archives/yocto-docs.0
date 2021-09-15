Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.5498.1631700759068628908
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 03:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A7D9320012;
	Wed, 15 Sep 2021 10:12:37 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/4] ref-manual: improve documentation for RECIPE_NO_UPDATE_REASON
Date: Wed, 15 Sep 2021 12:12:18 +0200
Message-Id: <20210915101219.2198566-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915101219.2198566-1-michael.opdenacker@bootlin.com>
References: <20210915101219.2198566-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This add a description of this variable to the variable index,
and clarifies the explanations given in the devtool reference
section.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/devtool-reference.rst | 13 ++++---------
 documentation/ref-manual/variables.rst         |  7 +++++++
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 5a0d6c25ae..761c7cb738 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -375,15 +375,10 @@ Following is a partial example table that reports on all the recipes.
 Notice the reported reason for not upgrading the ``base-passwd`` recipe.
 In this example, while a new version is available upstream, you do not
 want to use it because the dependency on ``cdebconf`` is not easily
-satisfied.
-
-.. note::
-
-   When a reason for not upgrading displays, the reason is usually
-   written into the recipe using the ``RECIPE_NO_UPDATE_REASON``
-   variable. See the
-   :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb>`
-   recipe for an example.
+satisfied. Maintainers can explicit the reason that is shown by adding
+the :term:`RECIPE_NO_UPDATE_REASON` variable to the corresponding recipe.
+See :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb>`
+for an example.
 
 ::
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 74d04dfd49..ecad6acfff 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6132,6 +6132,13 @@ system and gives an overview of their function and contents.
       BitBake User Manual for additional information on tasks and
       dependencies.
 
+   :term:`RECIPE_NO_UPDATE_REASON`
+      If a recipe should not be replaced by a more recent upstream version,
+      setting this variable in a recipe allows to explain the reason why in
+      the output of the ``devtool check-upgrade-status`` command, as explained
+      in the ":ref:`ref-manual/devtool-reference:checking on the upgrade Status of a recipe`"
+      section.
+
    :term:`REQUIRED_DISTRO_FEATURES`
       When inheriting the
       :ref:`features_check <ref-classes-features_check>`
-- 
2.25.1

