Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.6909.1631709948270704097
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 05:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 77BE020000B;
	Wed, 15 Sep 2021 12:45:46 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 2/4] ref-manual: improve "devtool check-upgrade-status" details
Date: Wed, 15 Sep 2021 14:45:32 +0200
Message-Id: <20210915124534.2201062-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915124534.2201062-1-michael.opdenacker@bootlin.com>
References: <16A4FF61F6C3D5CE.26939@lists.yoctoproject.org>
 <20210915124534.2201062-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Mention "devtool latest-version recipe" to process a single version
- Explain that the mechanism is controlled by the UPSTREAM_CHECK*
  variables, which are not referred to anywhere else in the manuals,
  except in the variable index.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/devtool-reference.rst | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 5fd51569a3..e07af2817d 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -328,12 +328,18 @@ Checking on the Upgrade Status of a Recipe
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
+:term:`UPSTREAM_CHECK_REGEX` and :term:`UPSTREAM_CHECK_GITTAGREGEX` variables
+which are defined in package recipes.
 
 .. note::
 
-- 
2.25.1

