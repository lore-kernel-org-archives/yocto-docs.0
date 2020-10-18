Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.26038.1603043881766167873
 for <docs@lists.yoctoproject.org>;
 Sun, 18 Oct 2020 10:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.8
Received: from localhost.localdomain (80-110-110-8.cgn.dynamic.surfer.at [80.110.110.8])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 434F16000B;
	Sun, 18 Oct 2020 17:57:59 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 2/3] docs: dev-manual-common-tasks: remove paragraph about race when missing DEPENDS
Date: Sun, 18 Oct 2020 19:57:11 +0200
Message-Id: <20201018175712.23800-2-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201018175712.23800-1-foss@0leil.net>
References: <20201018175712.23800-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Missing DEPENDS were an issue before rocko (2.4) because of a shared global
sysroot. Since then, every recipe has its own sysroot, it is not possible
to build successfully a recipe without all DEPENDS. Therefore, races in
tasks possibly triggered by missing DEPENDS are a thing of the past.

This paragraph is misleading and can be safely removed.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 23 ++++++-------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 0df5e1e4c..75ef5c98c 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -1612,25 +1612,16 @@ Within a recipe, you specify build-time dependencies using the
 :term:`DEPENDS` variable. Although
 nuances exist, items specified in ``DEPENDS`` should be names of other
 recipes. It is important that you specify all build-time dependencies
-explicitly. If you do not, due to the parallel nature of BitBake's
-execution, you can end up with a race condition where the dependency is
-present for one task of a recipe (e.g.
-:ref:`ref-tasks-configure`) and
-then gone when the next task runs (e.g.
-:ref:`ref-tasks-compile`).
+explicitly.
 
 Another consideration is that configure scripts might automatically
 check for optional dependencies and enable corresponding functionality
-if those dependencies are found. This behavior means that to ensure
-deterministic results and thus avoid more race conditions, you need to
-either explicitly specify these dependencies as well, or tell the
-configure script explicitly to disable the functionality. If you wish to
-make a recipe that is more generally useful (e.g. publish the recipe in
-a layer for others to use), instead of hard-disabling the functionality,
-you can use the
-:term:`PACKAGECONFIG` variable
-to allow functionality and the corresponding dependencies to be enabled
-and disabled easily by other users of the recipe.
+if those dependencies are found. If you wish to make a recipe that is
+more generally useful (e.g. publish the recipe in a layer for others to
+use), instead of hard-disabling the functionality, you can use the
+:term:`PACKAGECONFIG` variable to allow functionality and the
+corresponding dependencies to be enabled and disabled easily by other
+users of the recipe.
 
 Similar to build-time dependencies, you specify runtime dependencies
 through a variable -
-- 
2.26.2

