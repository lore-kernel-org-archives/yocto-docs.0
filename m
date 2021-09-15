Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.408.1631728732160600382
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 10:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5D642100003;
	Wed, 15 Sep 2021 17:58:49 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v3 1/5] ref-manual: document UPSTREAM_CHECK_COMMITS and UPSTREAM_VERSION_UNKNOWN
Date: Wed, 15 Sep 2021 19:58:38 +0200
Message-Id: <20210915175842.2998541-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org>
 <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5caada6260..d06ef5a632 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8483,6 +8483,18 @@ system and gives an overview of their function and contents.
       install initscripts package them in the main package for the recipe,
       you rarely need to set this variable in individual recipes.
 
+   :term:`UPSTREAM_CHECK_COMMITS`
+      You can perform a per-recipe check for what the latest upstream
+      source code version is by calling ``devtool latest-version recipe``. If
+      the recipe source code is provided from Git repositories, but
+      releases are not identified by Git tags, set :term:`UPSTREAM_CHECK_COMMITS`
+      to ``1`` in the recipe, and the OpenEmbedded build system
+      will compare the latest commit with the one currently specified
+      by the recipe (:term:`SRCREV`).
+      ::
+
+         UPSTREAM_CHECK_COMMITS = "1"
+
    :term:`UPSTREAM_CHECK_GITTAGREGEX`
       You can perform a per-recipe check for what the latest upstream
       source code version is by calling ``bitbake -c checkpkg`` recipe. If
@@ -8518,6 +8530,18 @@ system and gives an overview of their function and contents.
 
          UPSTREAM_CHECK_URI = "recipe_url"
 
+   :term:`UPSTREAM_VERSION_UNKNOWN`
+      You can perform a per-recipe check for what the latest upstream
+      source code version is by calling ``devtool latest-version recipe``.
+      If no combination of the :term:`UPSTREAM_CHECK_URI`, :term:`UPSTREAM_CHECK_REGEX`,
+      `UPSTREAM_CHECK_GITTAGREGEX` and :term:`UPSTREAM_CHECK_COMMITS` variables in
+      the recipe allows to determine such an latest upstream version,
+      you can set :term:`UPSTREAM_VERSION_UNKNOWN`` to ``1`` in the recipe
+      to acknowledge that the check cannot be performed.
+      ::
+
+         UPSTREAM_VERSION_UNKNOWN = "1"
+
    :term:`USE_DEVFS`
       Determines if ``devtmpfs`` is used for ``/dev`` population. The
       default value used for :term:`USE_DEVFS` is "1" when no value is
-- 
2.25.1

