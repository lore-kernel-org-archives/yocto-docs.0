Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.419.1631728739565983604
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 10:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2DE1BFF806;
	Wed, 15 Sep 2021 17:58:58 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v3 4/5] ref-manual: improve documentation for RECIPE_NO_UPDATE_REASON
Date: Wed, 15 Sep 2021 19:58:41 +0200
Message-Id: <20210915175842.2998541-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org>
 <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
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
index 2cf9fd43a3..8819879d2f 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -377,15 +377,10 @@ Following is a partial example table that reports on all the recipes.
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
index 7545e708c6..14ace91a85 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6132,6 +6132,13 @@ system and gives an overview of their function and contents.
       BitBake User Manual for additional information on tasks and
       dependencies.
 
+   :term:`RECIPE_NO_UPDATE_REASON`
+      If a recipe should not be replaced by a more recent upstream version,
+      putting the reason why in this variable in a recipe allows
+      ``devtool check-upgrade-status`` command to display it, as explained
+      in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
+      section.
+
    :term:`REQUIRED_DISTRO_FEATURES`
       When inheriting the
       :ref:`features_check <ref-classes-features_check>`
-- 
2.25.1

