Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFB0C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 08:41:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2430.1785487310374232174
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 01:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XHPVa5VW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 012934E41046
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 08:41:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAA686039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 08:41:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2506F11C16588;
	Fri, 31 Jul 2026 10:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785487303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qn8zQcQ7EtlCpS+Tv69mD68ILm4xXxOiF1obccQKzhw=;
	b=XHPVa5VWdJf/hkfiGLfIlPXKoS2P6K6CWXTh47k7j/33KsMIrTWuUDWB8F06ZjxXphjErE
	XrUuM4x2oqDiXgUgjwx/UNH0Q3SdZQH5Z/gk2A9A4CODl0StG4MldYV6eaakhxJnaoERW+
	L96Ke8QIn8xgN2V034+AdHLmCrMKsSSmU6ki6yi7zQFXFpN7rmpcJOY09zsRcOZdaQPNGz
	W0RWNMGGn4uY4TYJQFq4HtSKNM7hrDJ8rdfPCfZOrKsZGZ23Xp/UiBbHG9/dyHVlORyh9D
	QZd77taN7RELIjF8uBMoyRWgHEVWNbuM4tmGE8Yil8ZOxbq2TnzBwM1lkvQhnw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 31 Jul 2026 10:41:36 +0200
Subject: [PATCH] docs-wide: remove CROPS references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-remove-crops-references-v1-1-530beef39baa@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW5hXdGVXiW6sO1YE7QrMyqB+
 O5OdflxOP9GCmEonauNBCsrl2yoTxWl55AfcHw3U/Ch8zF4J3iXFS5JmdQwQpAT1MXR910b27o
 PDdl7so0/v/Ll+rcutxfS/M3Rvh9NsGZhewAAAA==
X-Change-ID: 20260720-remove-crops-references-7f0865751823
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14967;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xZBVUz2+dy3lpejsJTBCKHNTp4PLJLgk6pWH2xLYgJg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqbF/FJiSrmpEdwKt4V2AF+p8NSLtUOMFHO8FIq
 NsD4/i08yuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamxfxQAKCRDRgEFAKaOo
 NuouEADJFiQPzXZlEwO2Q37B7z5JC8pacy9zDzRaDdL7760LdmzB0xjlO80nfUMFAJSGpoR0I+W
 Xwz3POZSOyUL6X++CxmnzFOlsi2JFOX30elE5eMrgslQAT6xaZYTv8d/Q9gi4qZsI53Qv1F6xhn
 ldaKml36eEFKBh8QHw10JMkgVmAZwYOkuDge96G6ZSr60tUe78TLMDguw6c07fqmzN8BDe6YBdP
 YZ1B8PAkRbyAQaP37A9qMQB/a2lqaOggGCfGvKpMoXJaBMRyN9ZA4RuC7vvJIN/ce7Pw/9uz1XT
 vkcpdR1D7ARknCgKsxDnj2zkRp8MifNG0fN4YHk74Qxo7YQh21M7rbni7efKaWtrhoftGBhStCO
 IP8O8wLx659SpcSQL7BOGmLwquf7xWfGaCoNARMiGzAXWWj+Kzy1UtGoCMyrEKENYZ4rIAqZR4z
 p629ewfYiWrLQVvM/9sC459C6onND0nu2ZKy8Jod6453+gnUKexbxcKLbjCbHjNl0xivNHfMWHS
 mE+9RSJ/MOU6QyHTXPVNY0USyGxFqu6M0cuEW2T8RDzNrglYuPUpMtGNhq6SQ1A/Q/Kq9rTjsXa
 +avynMXSJvf/eERQUgqeNuCFsuyuK+4XCy9So7QoKm2nNgY90tBwmOr1O9Arsiw19LR3VjYPdg3
 qqEv2At7K7yonkQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 08:41:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10203

The CROPS[1] project hasn't been updated in two years which makes it
incompatible with our current system requirements.

Remove references to CROPS from the documentation, and in most cases
replace them by mentioning that a container can be used (setup for it
left to the user).

Note that the project is working on reference containers[2] which may
replace this at some point (not confirmed).

[1]: https://github.com/crops/poky-container/
[2]: https://lore.kernel.org/yocto/8286fd3b-1b05-47bf-95e4-0b9f0f5411cb@app.fastmail.com/

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst       |   7 +-
 documentation/bsp-manual/bsp.rst                   |   3 +-
 documentation/dev-manual/start.rst                 | 104 +--------------------
 .../overview-manual/development-environment.rst    |  16 ++--
 documentation/overview-manual/yp-intro.rst         |  36 ++-----
 documentation/sdk-manual/appendix-obtain.rst       |   3 +-
 6 files changed, 21 insertions(+), 148 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 2ffa3a6d8..c43c3ddca 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -21,11 +21,8 @@ build a reference embedded OS called Poky.
       you want to use Yocto Project on to build an image
       (:term:`Build Host`) is not
       a native Linux system, you can still perform these steps by using
-      CROss PlatformS (CROPS) and setting up a Poky container. See the
-      :ref:`dev-manual/start:setting up to use cross platforms (crops)`
-      section
-      in the Yocto Project Development Tasks Manual for more
-      information.
+      an :wikipedia:`OCI container <Open_Container_Initiative>` (using
+      `Docker <https://www.docker.com/>`__ or `Podman <https://podman.io/>`__).
 
    -  You may use version 2 of Windows Subsystem For Linux (WSL 2) to set
       up a build host using Windows 10 or later, Windows Server 2019 or later.
diff --git a/documentation/bsp-manual/bsp.rst b/documentation/bsp-manual/bsp.rst
index 25c1a2eb6..168d64e6e 100644
--- a/documentation/bsp-manual/bsp.rst
+++ b/documentation/bsp-manual/bsp.rst
@@ -147,8 +147,7 @@ section.
 #. *Set Up the Build Environment:* Be sure you are set up to use BitBake
    in a shell. See the ":ref:`dev-manual/start:preparing the build host`"
    section in the Yocto Project Development Tasks Manual for information on how
-   to get a build host ready that is either a native Linux machine or a machine
-   that uses CROPS.
+   to get a :term:`build host` ready.
 
 #. *Prepare the Source Repositories*:
 
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 44604595a..3b8e2334a 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -261,11 +261,10 @@ Preparing the Build Host
 This section provides procedures to set up a system to be used as your
 :term:`Build Host` for
 development using the Yocto Project. Your build host can be a native
-Linux machine (recommended), it can be a machine (Linux, Mac, or
-Windows) that uses `CROPS <https://github.com/crops/poky-container>`__,
-which leverages `Docker Containers <https://www.docker.com/>`__ or it
-can be a Windows machine capable of running version 2 of Windows Subsystem
-For Linux (WSL 2).
+Linux machine (recommended), it can be an :wikipedia:`OCI container
+<Open_Container_Initiative>` (such as `Docker <https://www.docker.com/>`__ or
+`Podman <https://podman.io/>`__), or it can be a Windows machine capable of
+running version 2 of Windows Subsystem For Linux (WSL 2).
 
 .. note::
 
@@ -349,101 +348,6 @@ the `Yocto Project BitBake
 <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
 extension accordingly.
 
-Setting Up to Use CROss PlatformS (CROPS)
------------------------------------------
-
-With `CROPS <https://github.com/crops/poky-container>`__, which
-leverages `Docker Containers <https://www.docker.com/>`__, you can
-create a Yocto Project development environment that is operating system
-agnostic. You can set up a container in which you can develop using the
-Yocto Project on a Windows, Mac, or Linux machine.
-
-Follow these general steps to prepare a Windows, Mac, or Linux machine
-as your Yocto Project build host:
-
-#. *Determine What Your Build Host Needs:*
-   `Docker <https://www.docker.com/what-docker>`__ is a software
-   container platform that you need to install on the build host.
-   Depending on your build host, you might have to install different
-   software to support Docker containers. Go to the Docker installation
-   page and read about the platform requirements in "`Supported
-   Platforms <https://docs.docker.com/engine/install/#installation-procedures-for-supported-platforms>`__"
-   your build host needs to run containers.
-
-#. *Choose What To Install:* Depending on whether or not your build host
-   meets system requirements, you need to install "Docker CE Stable" or
-   the "Docker Toolbox". Most situations call for Docker CE. However, if
-   you have a build host that does not meet requirements (e.g.
-   Pre-Windows 10 or Windows 10 "Home" version), you must install Docker
-   Toolbox instead.
-
-#. *Go to the Install Site for Your Platform:* Click the link for the
-   Docker edition associated with your build host's native software. For
-   example, if your build host is running Microsoft Windows Version 10
-   and you want the Docker CE Stable edition, click that link under
-   "Supported Platforms".
-
-#. *Install the Software:* Once you have understood all the
-   pre-requisites, you can download and install the appropriate
-   software. Follow the instructions for your specific machine and the
-   type of the software you need to install:
-
-   -  Install `Docker Desktop on
-      Windows <https://docs.docker.com/docker-for-windows/install/#install-docker-desktop-on-windows>`__
-      for Windows build hosts that meet requirements.
-
-   -  Install `Docker Desktop on
-      MacOs <https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-desktop-on-mac>`__
-      for Mac build hosts that meet requirements.
-
-   -  Install `Docker Engine on
-      CentOS <https://docs.docker.com/engine/install/centos/>`__
-      for Linux build hosts running the CentOS distribution.
-
-   -  Install `Docker Engine on
-      Debian <https://docs.docker.com/engine/install/debian/>`__
-      for Linux build hosts running the Debian distribution.
-
-   -  Install `Docker Engine for
-      Fedora <https://docs.docker.com/engine/install/fedora/>`__
-      for Linux build hosts running the Fedora distribution.
-
-   -  Install `Docker Engine for
-      Ubuntu <https://docs.docker.com/engine/install/ubuntu/>`__
-      for Linux build hosts running the Ubuntu distribution.
-
-#. *Optionally Orient Yourself With Docker:* If you are unfamiliar with
-   Docker and the container concept, you can learn more here -
-   https://docs.docker.com/get-started/.
-
-#. *Launch Docker or Docker Toolbox:* You should be able to launch
-   Docker or the Docker Toolbox and have a terminal shell on your
-   development host.
-
-#. *Set Up the Containers to Use the Yocto Project:* Go to
-   https://github.com/crops/docker-win-mac-docs/wiki and follow
-   the directions for your particular build host (i.e. Linux, Mac, or
-   Windows).
-
-   Once you complete the setup instructions for your machine, you have
-   the Poky, Extensible SDK, and Toaster containers available. You can
-   click those links from the page and learn more about using each of
-   those containers.
-
-Once you have a container set up, everything is in place to develop just
-as if you were running on a native Linux machine. If you are going to
-use the Poky container, see the
-":ref:`dev-manual/start:preparing the Poky reference distro`"
-section. If you are going to use the Extensible SDK container, see the
-":doc:`/sdk-manual/extensible`" Chapter in the Yocto
-Project Application Development and the Extensible Software Development
-Kit (eSDK) manual. If you are going to use the Toaster container, see
-the ":doc:`/toaster-manual/setup-and-use`"
-section in the Toaster User Manual. If you are a VSCode user, you can configure
-the `Yocto Project BitBake
-<https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
-extension accordingly.
-
 Setting Up to Use Windows Subsystem For Linux (WSL 2)
 -----------------------------------------------------
 
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 0921139bd..cdba7c50c 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -58,16 +58,12 @@ Project. Most find that it is best to have a native Linux machine
 function as the development host. However, it is possible to use a
 system that does not run Linux as its operating system as your
 development host. When you have a Mac or Windows-based system, you can
-set it up as the development host by using
-`CROPS <https://github.com/crops/poky-container>`__, which leverages
-`Docker Containers <https://www.docker.com/>`__. Once you take the steps
-to set up a CROPS machine, you effectively have access to a shell
+set it up as the development host by using an :wikipedia:`OCI container
+<Open_Container_Initiative>` (using `Docker <https://www.docker.com/>`__ or
+`Podman <https://podman.io/>`__). Once you take the steps
+to set up container, you effectively have access to a shell
 environment that is similar to what you see when using a Linux-based
-development host. For the steps needed to set up a system using CROPS,
-see the
-":ref:`dev-manual/start:setting up to use cross platforms (crops)`"
-section in
-the Yocto Project Development Tasks Manual.
+development host.
 
 If your development host is going to be a system that runs a Linux
 distribution, you must still take steps to prepare the system
@@ -87,7 +83,7 @@ are several ways of working in the Yocto Project environment:
    which uses
    BitBake, in a command-line environment from a shell on your
    development host. You can accomplish this from a host that is a
-   native Linux machine or from a host that has been set up with CROPS.
+   native Linux machine or from a container.
    Either way, you create, modify, and build images and applications all
    within a shell-based environment using components and tools available
    through your Linux distribution and the Yocto Project.
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 6e8b72249..ef7e66d03 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -287,13 +287,6 @@ Development Tools
 Here are tools that help you develop images and applications using
 the Yocto Project:
 
--  *CROPS:* `CROPS <https://github.com/crops/poky-container/>`__ is an
-   open source, cross-platform development framework that leverages
-   `Docker Containers <https://www.docker.com/>`__. CROPS provides an
-   easily managed, extensible environment that allows you to build
-   binaries for a variety of architectures on Windows, Linux and Mac OS
-   X hosts.
-
 -  *devtool:* This command-line tool is available as part of the
    extensible SDK (eSDK) and is its cornerstone. You can use ``devtool``
    to help build, test, and package software within the eSDK. You can
@@ -513,9 +506,9 @@ Linux.
    Build Appliance was useful as a way to try out development in the
    Yocto Project environment.
 
-#. *CROPS:* The final and best solution available now for developing
-   using the Yocto Project on a system not native to Linux is with
-   :ref:`CROPS <overview-manual/yp-intro:development tools>`.
+#. *CROPS:* Used to be a solution available for developing
+   using the Yocto Project on a system not native to Linux (see
+   https://github.com/crops/poky-container).
 
 Development Methods
 ===================
@@ -549,25 +542,10 @@ Build Host runs, you have several choices.
    ":ref:`dev-manual/start:setting up a native linux host`"
    section in the Yocto Project Development Tasks Manual.
 
--  *CROss PlatformS (CROPS):* Typically, you use
-   `CROPS <https://github.com/crops/poky-container/>`__, which leverages
-   `Docker Containers <https://www.docker.com/>`__, to set up a Build
-   Host that is not running Linux (e.g. Microsoft Windows or macOS).
-
-   .. note::
-
-      You can, however, use CROPS on a Linux-based system.
-
-   CROPS is an open source, cross-platform development framework that
-   provides an easily managed, extensible environment for building
-   binaries targeted for a variety of architectures on Windows, macOS,
-   or Linux hosts. Once the Build Host is set up using CROPS, you can
-   prepare a shell environment to mimic that of a shell being used on a
-   system natively running Linux.
-
-   For information on how to set up a Build Host with CROPS, see the
-   ":ref:`dev-manual/start:setting up to use cross platforms (crops)`"
-   section in the Yocto Project Development Tasks Manual.
+-  *OCI Containers:* Typically, you use an :wikipedia:`OCI container
+   <Open_Container_Initiative>` (with `Docker <https://www.docker.com/>`__ or
+   `Podman <https://podman.io/>`__ for example), to set up a :term:`Build
+   Host` that is not running Linux (e.g. Microsoft Windows or macOS).
 
 -  *Windows Subsystem For Linux (WSL 2):* You may use Windows Subsystem
    For Linux version 2 to set up a Build Host using Windows 10 or later,
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index a6f2da052..24a8e17b3 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -96,8 +96,7 @@ build the SDK installer. Follow these steps:
 #. *Set Up the Build Environment:* Be sure you are set up to use BitBake
    in a shell. See the ":doc:`/dev-manual/start`" section
    in the Yocto Project Development Tasks Manual for information on how
-   to get a build host ready that is either a native Linux machine or a
-   machine that uses CROPS.
+   to get a :term:`build host` ready.
 
 #. *Make Sure You Are Building an Installer for the Correct Machine:*
    Check to be sure that your :term:`MACHINE` variable in the ``local.conf``

---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260720-remove-crops-references-7f0865751823


