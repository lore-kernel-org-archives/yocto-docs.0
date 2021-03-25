Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.2265.1616700892230792325
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 12:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from localhost (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7211DFF804;
	Thu, 25 Mar 2021 19:34:50 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] Quick build: checkout a branch instead of a fixed tag
Date: Thu, 25 Mar 2021 20:34:45 +0100
Message-Id: <20210325193445.204460-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Add guidelines for choosing a release
- Check-out a branch instead of a fixed tag
  This way it's possible to pull release updates later

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 63 ++++++++++++--------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index f68ad168b..7bba47ea9 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -106,42 +106,57 @@ commands to clone the Poky repository.
    Resolving deltas: 100% (323116/323116), done.
    Checking connectivity... done.
 
-Move to the ``poky`` directory and take a look at the tags:
+Go to :yocto_wiki:`Releases wiki page </Releases>`, and choose a release
+codename (such as ``&DISTRO_NAME_NO_CAP;``), corresponding to either the
+latest stable release or a Long Term Support release.
+
+Then move to the ``poky`` directory and take a look at existing branches:
 
 .. code-block:: shell
 
    $ cd poky
-   $ git fetch --tags
-   $ git tag
-   1.1_M1.final
-   1.1_M1.rc1
-   1.1_M1.rc2
-   1.1_M2.final
-   1.1_M2.rc1
+   $ git branch -a
+   .
+   .
+   .
+   remotes/origin/HEAD -> origin/master
+   remotes/origin/dunfell
+   remotes/origin/dunfell-next
+   .
+   .
+   .
+   remotes/origin/gatesgarth
+   remotes/origin/gatesgarth-next
+   .
    .
    .
+   remotes/origin/master
+   remotes/origin/master-next
    .
-   yocto-2.5
-   yocto-2.5.1
-   yocto-2.5.2
-   yocto-2.6
-   yocto-2.6.1
-   yocto-2.6.2
-   yocto-2.7
-   yocto_1.5_M5.rc8
-
-For this example, check out the branch based on the
-``&DISTRO_REL_TAG;`` release:
+   .
+   .
+
+
+For this example, check out the ``&DISTRO_NAME_NO_CAP;`` branch based on the
+``&DISTRO_NAME;`` release:
 
 .. code-block:: shell
 
-   $ git checkout tags/&DISTRO_REL_TAG; -b my-&DISTRO_REL_TAG;
-   Switched to a new branch 'my-&DISTRO_REL_TAG;'
+   $ git checkout -t origin/&DISTRO_NAME_NO_CAP; -b my-&DISTRO_NAME_NO_CAP;
+   Branch 'my-&DISTRO_NAME_NO_CAP;' set up to track remote branch '&DISTRO_NAME_NO_CAP;' from 'origin'.
+   Switched to a new branch 'my-&DISTRO_NAME_NO_CAP;'
 
 The previous Git checkout command creates a local branch named
-``my-&DISTRO_REL_TAG;``. The files available to you in that branch exactly
-match the repository's files in the ``&DISTRO_NAME_NO_CAP;`` development
-branch at the time of the Yocto Project &DISTRO_REL_TAG; release.
+``my-&DISTRO_NAME_NO_CAP;``. The files available to you in that branch
+exactly match the repository's files in the ``&DISTRO_NAME_NO_CAP;``
+release branch.
+
+Note that you can regularly type the following command in the same directory
+to keep your local files in sync with the release branch:
+
+.. code-block:: shell
+
+   $ git pull
 
 For more options and information about accessing Yocto Project related
 repositories, see the
-- 
2.25.1

