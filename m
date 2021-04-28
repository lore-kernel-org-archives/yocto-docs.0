Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.11832.1619616444187625594
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Apr 2021 06:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from localhost (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6C57A2000C;
	Wed, 28 Apr 2021 13:27:21 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: update references to Docker installation instructions
Date: Wed, 28 Apr 2021 15:27:11 +0200
Message-Id: <20210428132711.421123-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Docker installation URL on various plaforms, replacing
some URLs by the ones they now redirect to, renaming "Docker CE"
to "Docker Desktop" on Mac and Windows, and to "Docker Engine"
on GNU/Linux.

Stop mentioning "Docker Toolbox" which is now deprecated and
replaced by "Docker Desktop" on Mac and Windows.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/start.rst | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index f8c8637d47..18fd8ccf60 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -387,36 +387,28 @@ as your Yocto Project build host:
    software. Follow the instructions for your specific machine and the
    type of the software you need to install:
 
-   -  Install `Docker CE for
+   -  Install `Docker Desktop on
       Windows <https://docs.docker.com/docker-for-windows/install/#install-docker-desktop-on-windows>`__
       for Windows build hosts that meet requirements.
 
-   -  Install `Docker CE for
+   -  Install `Docker Desktop on
       MacOs <https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-desktop-on-mac>`__
       for Mac build hosts that meet requirements.
 
-   -  Install `Docker Toolbox for
-      Windows <https://docs.docker.com/toolbox/toolbox_install_windows/>`__
-      for Windows build hosts that do not meet Docker requirements.
-
-   -  Install `Docker Toolbox for
-      MacOS <https://docs.docker.com/toolbox/toolbox_install_mac/>`__
-      for Mac build hosts that do not meet Docker requirements.
-
-   -  Install `Docker CE for
-      CentOS <https://docs.docker.com/install/linux/docker-ce/centos/>`__
+   -  Install `Docker Engine on
+      CentOS <https://docs.docker.com/engine/install/centos/>`__
       for Linux build hosts running the CentOS distribution.
 
-   -  Install `Docker CE for
-      Debian <https://docs.docker.com/install/linux/docker-ce/debian/>`__
+   -  Install `Docker Engine on
+      Debian <https://docs.docker.com/engine/install/debian/>`__
       for Linux build hosts running the Debian distribution.
 
-   -  Install `Docker CE for
-      Fedora <https://docs.docker.com/install/linux/docker-ce/fedora/>`__
+   -  Install `Docker Engine for
+      Fedora <https://docs.docker.com/engine/install/fedora/>`__
       for Linux build hosts running the Fedora distribution.
 
-   -  Install `Docker CE for
-      Ubuntu <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`__
+   -  Install `Docker Engine for
+      Ubuntu <https://docs.docker.com/engine/install/ubuntu/>`__
       for Linux build hosts running the Ubuntu distribution.
 
 5. *Optionally Orient Yourself With Docker:* If you are unfamiliar with
-- 
2.25.1

