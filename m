Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209CCD0E6F8
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 14:53:20 +0000 (UTC)
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18736.1764082397125633760
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 06:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dG5KQ0H5HzxCw;
	Tue, 25 Nov 2025 15:53:14 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dG5KP3Yv3zrYS;
	Tue, 25 Nov 2025 15:53:13 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 25 Nov 2025 15:53:01 +0100
Subject: [PATCH 2/2] make sure Quick Build section and System Requirements
 are in sync
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-quick-start-requirements-common-v1-2-2c872b2fd45f@cherry.de>
References: <20251125-quick-start-requirements-common-v1-0-2c872b2fd45f@cherry.de>
In-Reply-To: <20251125-quick-start-requirements-common-v1-0-2c872b2fd45f@cherry.de>
To: docs@lists.yoctoproject.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 14:53:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8121

From: Quentin Schulz <quentin.schulz@cherry.de>

Right now, there are additional instructions that are missing in the
Quick Build section compared to the ones in System Requirements.

By including the exact same rST file for Ubuntu/Debian in both sections,
we can make sure both are kept in sync while still providing only
instructions for Ubuntu and not requiring the user to visit another
page.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/brief-yoctoprojectqs/index.rst       |  7 +----
 documentation/ref-manual/system-requirements.rst   | 33 +---------------------
 .../ubuntu-debian-host-packages-nodocs.rst         | 33 ++++++++++++++++++++++
 3 files changed, 35 insertions(+), 38 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 07bb4e1ca..cebc0d1b4 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -74,12 +74,7 @@ section in the Yocto Project Reference Manual for information.
 Build Host Packages
 ===================
 
-You must install essential host packages on your build host. The
-following command installs the host packages based on an Ubuntu
-distribution:
-
-.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
-   :language: shell
+.. include:: ../ref-manual/ubuntu-debian-host-packages-nodocs.rst
 
 .. note::
 
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 0860c7a3f..9ed29a1df 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -164,38 +164,7 @@ function.
 Ubuntu and Debian
 -----------------
 
-Here are the packages needed to build an image on a headless system
-with a supported Ubuntu or Debian Linux distribution:
-
-.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
-   :language: shell
-
-You also need to ensure you have the ``en_US.UTF-8`` locale enabled::
-
-   $ locale --all-locales | grep en_US.utf8
-
-If this is not the case, you can reconfigure the ``locales`` package to add it
-(requires an interactive shell)::
-
-   $ sudo dpkg-reconfigure locales
-
-.. note::
-
-   -  If you are not in an interactive shell, ``dpkg-reconfigure`` will
-      not work as expected. To add the locale you will need to edit
-      ``/etc/locale.gen`` file to add/uncomment the ``en_US.UTF-8`` locale.
-      A naive way to do this as root is::
-
-         $ echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
-         $ locale-gen
-
-   -  If your build system has the ``oss4-dev`` package installed, you
-      might experience QEMU build failures due to the package installing
-      its own custom ``/usr/include/linux/soundcard.h`` on the Debian
-      system. If you run into this situation, try either of these solutions::
-
-         $ sudo apt build-dep qemu
-         $ sudo apt remove oss4-dev
+.. include:: ubuntu-debian-host-packages-nodocs.rst
 
 Here are the packages needed to build Project documentation manuals:
 
diff --git a/documentation/ref-manual/ubuntu-debian-host-packages-nodocs.rst b/documentation/ref-manual/ubuntu-debian-host-packages-nodocs.rst
new file mode 100644
index 000000000..99a1ffdd7
--- /dev/null
+++ b/documentation/ref-manual/ubuntu-debian-host-packages-nodocs.rst
@@ -0,0 +1,33 @@
+Here are the packages needed to build an image on a headless system
+with a supported Ubuntu or Debian Linux distribution:
+
+.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
+   :language: shell
+
+You also need to ensure you have the ``en_US.UTF-8`` locale enabled::
+
+   $ locale --all-locales | grep en_US.utf8
+
+If this is not the case, you can reconfigure the ``locales`` package to add it
+(requires an interactive shell)::
+
+   $ sudo dpkg-reconfigure locales
+
+.. note::
+
+   -  If you are not in an interactive shell, ``dpkg-reconfigure`` will
+      not work as expected. To add the locale you will need to edit
+      ``/etc/locale.gen`` file to add/uncomment the ``en_US.UTF-8`` locale.
+      A naive way to do this as root is::
+
+         $ echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
+         $ locale-gen
+
+   -  If your build system has the ``oss4-dev`` package installed, you
+      might experience QEMU build failures due to the package installing
+      its own custom ``/usr/include/linux/soundcard.h`` on the Debian
+      system. If you run into this situation, try either of these solutions::
+
+         $ sudo apt build-dep qemu
+         $ sudo apt remove oss4-dev
+

-- 
2.52.0


