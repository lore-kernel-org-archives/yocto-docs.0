Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3902.1600300775881340173
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 2C7B460002;
	Wed, 16 Sep 2020 23:59:33 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 10/16] sphinx: fix incorrect indentations
Date: Thu, 17 Sep 2020 01:59:00 +0200
Message-Id: <20200916235906.243174-10-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 .../brief-yoctoprojectqs/brief-yoctoprojectqs.rst      | 10 +++++-----
 .../overview-manual/overview-manual-concepts.rst       | 10 +++++-----
 .../overview-manual/overview-manual-yp-intro.rst       |  4 +---
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index 08d49d1e2..6d65cf8fd 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -65,11 +65,11 @@ following requirements:
    -  Python 3.5.0 or greater.
    -  gcc 5.0 or greater.
 
-   If your build host does not meet any of these three listed version
-   requirements, you can take steps to prepare the system so that you
-   can still use the Yocto Project. See the
-   :ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`
-   section in the Yocto Project Reference Manual for information.
+If your build host does not meet any of these three listed version
+requirements, you can take steps to prepare the system so that you
+can still use the Yocto Project. See the
+:ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`
+section in the Yocto Project Reference Manual for information.
 
 Build Host Packages
 ===================
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index 9230527b7..935c01805 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -1948,11 +1948,11 @@ The following list explains the previous example:
       addtask do_deploy_setscene
 
   ``sstate_setscene()`` takes the flags above as input and accelerates the ``do_deploy`` task
-   through the shared state cache if possible. If the task was
-   accelerated, ``sstate_setscene()`` returns True. Otherwise, it
-   returns False, and the normal ``do_deploy`` task runs. For more
-   information, see the ":ref:`setscene <bitbake:bitbake-user-manual/bitbake-user-manual-execution:setscene>`"
-   section in the BitBake User Manual.
+  through the shared state cache if possible. If the task was
+  accelerated, ``sstate_setscene()`` returns True. Otherwise, it
+  returns False, and the normal ``do_deploy`` task runs. For more
+  information, see the ":ref:`setscene <bitbake:bitbake-user-manual/bitbake-user-manual-execution:setscene>`"
+  section in the BitBake User Manual.
 
 -  The ``do_deploy[dirs] = "${DEPLOYDIR} ${B}"`` line creates
    ``${DEPLOYDIR}`` and ``${B}`` before the ``do_deploy`` task runs, and
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index 823c96d88..c83290ed5 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -391,9 +391,7 @@ activities using the Yocto Project:
 
    .. note::
 
-      AutoBuilder is based on
-      buildbot
-      .
+      AutoBuilder is based on buildbot.
 
    A goal of the Yocto Project is to lead the open source industry with
    a project that automates testing and QA procedures. In doing so, the
-- 
2.26.2

