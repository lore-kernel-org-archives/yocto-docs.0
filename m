Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44D8C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 19:03:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.628.1633547005364489933
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 12:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2443640002;
	Wed,  6 Oct 2021 19:03:22 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: replace "apt-get" by "apt"
Date: Wed,  6 Oct 2021 21:03:19 +0200
Message-Id: <20211006190319.963605-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 19:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1932

Modern Debian based distros (such as Ubuntu) now
use "apt" instead of "apt-get"

Also make sure "apt" is invoked with root privileges (mandatory)

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst     |  2 +-
 documentation/dev-manual/common-tasks.rst        |  6 +++---
 documentation/ref-manual/system-requirements.rst | 10 +++++-----
 documentation/toaster-manual/setup-and-use.rst   |  2 +-
 documentation/toaster-manual/start.rst           |  2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 74167befad..c299df3b6a 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -80,7 +80,7 @@ distribution:
 
 .. code-block:: shell
 
-  $ sudo apt-get install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
+  $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
 
 .. note::
 
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 71e5d6ef57..45834361bf 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -5874,7 +5874,7 @@ system image files much faster.
       use the tool without specifying ``PATH`` even from the root
       account::
 
-         $ sudo apt-get install bmap-tools
+         $ sudo apt install bmap-tools
 
    -  If you are unable to install the ``bmap-tools`` package, you will
       need to build Bmaptool before using it. Use the following command::
@@ -7066,7 +7066,7 @@ to fetch the repository information:
 
 .. code-block:: none
 
-  # apt-get update
+  # sudo apt update
 
 After this step,
 ``apt`` is able to find, install, and upgrade packages from the
@@ -8249,7 +8249,7 @@ might be significant in human-readable form. Here is an example::
 
 
    Alternatively, you can install ``python3-git`` using the appropriate
-   distribution package manager (e.g. ``apt-get``, ``dnf``, or ``zipper``).
+   distribution package manager (e.g. ``apt``, ``dnf``, or ``zipper``).
 
 To see changes to the build history using a web interface, follow the
 instruction in the ``README`` file
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 5e5c105d62..d12e8dfbe3 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -120,23 +120,23 @@ supported Ubuntu or Debian Linux distribution:
       its own custom ``/usr/include/linux/soundcard.h`` on the Debian
       system. If you run into this situation, try either of these solutions::
 
-         $ sudo apt-get build-dep qemu
-         $ sudo apt-get remove oss4-dev
+         $ sudo apt build-dep qemu
+         $ sudo apt remove oss4-dev
 
    -  For Debian-8, ``python3-git`` and ``pylint3`` are no longer
-      available via ``apt-get``.
+      available via ``apt``.
       ::
 
          $ sudo pip3 install GitPython pylint==1.9.5
 
 -  *Essentials:* Packages needed to build an image on a headless system::
 
-      $ sudo apt-get install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
+      $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
 
 -  *Documentation:* Packages needed if you are going to build out the
    Yocto Project documentation manuals::
 
-      $ sudo apt-get install make python3-pip
+      $ sudo apt install make python3-pip
       &PIP3_HOST_PACKAGES_DOC;
 
    .. note::
diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
index 4f71b58418..0da8326926 100644
--- a/documentation/toaster-manual/setup-and-use.rst
+++ b/documentation/toaster-manual/setup-and-use.rst
@@ -211,7 +211,7 @@ Be sure you meet the following requirements:
 
 -  If you are using Ubuntu, run the following::
 
-      $ sudo apt-get install apache2 libapache2-mod-wsgi-py3 mysql-server python3-pip libmysqlclient-dev
+      $ sudo apt install apache2 libapache2-mod-wsgi-py3 mysql-server python3-pip libmysqlclient-dev
 
 -  If you are using Fedora or a RedHat distribution, run the
    following::
diff --git a/documentation/toaster-manual/start.rst b/documentation/toaster-manual/start.rst
index c687a82531..cab5d1f673 100644
--- a/documentation/toaster-manual/start.rst
+++ b/documentation/toaster-manual/start.rst
@@ -18,7 +18,7 @@ to run the Yocto Project. To do this, follow the instructions in the
 the Yocto Project Development Tasks Manual. For Ubuntu/Debian, you might
 also need to do an additional install of pip3. ::
 
-   $ sudo apt-get install python3-pip
+   $ sudo apt install python3-pip
 
 Establishing Toaster System Dependencies
 ========================================
-- 
2.25.1


