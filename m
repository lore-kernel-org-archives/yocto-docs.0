Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217E6C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 08:35:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.7305.1666254949312491152
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 01:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hLgKqylH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7DB45E000A;
	Thu, 20 Oct 2022 08:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666254946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=imQ51iU+urQ2w+TiNbu8MKuXKCmtLhcYVeTkBa+jwjk=;
	b=hLgKqylHkLv5vZlXiGrNjsJaGIhbgqtT5ym7hYFICuBSFSxqVMZxA48RSpYetxMvfF/CVf
	ivBuC3GG/uqc2/YUUSqjLUg4Ji2sMWB3vzrkjAJGLYTPr03HRM/OQJMdjayfXvn0AlEV0W
	nx7bVSOO9sqM6eSfdqD7+YATnheFgn1OmZQ8Jjfl+D7G6XVLtW1o4AncSkPEpB5IeI+Egv
	cFXFGhsLnGqNWBFnXQa+ky9wYjb2JOgTiiWA1vCoR9Fq/53vQMUvfEIEhr5PoAdZSsS0Tg
	+0N4nJdUgyXw97bsmth4JDVlYeDYemOzXx7FYM7dvthf/onc+dDbIFscreSFeA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH v2] manuals: updates for building on Windows (WSL 2)
Date: Thu, 20 Oct 2022 10:35:43 +0200
Message-Id: <20221020083543.23090-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <171FBA0239F0046E.18073@lists.yoctoproject.org>
References: <171FBA0239F0046E.18073@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 08:35:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3394

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Use the Wikipedia naming scheme: WSL 2 instead of WSLv2
- Take into account Windows Server 2019 and 2022 which are
  supported too.
- Improve some explanations

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reviewed-by: Quentin Schulz <foss@0leil.net>

---

Changes in V2:
- Now using "Windows 10 or later, or Windows Server 2019 or later"
  as suggested by Quentin Schulz.
---
 documentation/brief-yoctoprojectqs/index.rst  | 17 ++---
 documentation/dev-manual/start.rst            | 70 +++++++++----------
 documentation/overview-manual/yp-intro.rst    | 17 ++---
 .../ref-manual/system-requirements.rst        | 10 +--
 4 files changed, 50 insertions(+), 64 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 7ae0ddc349..100022ceba 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -25,18 +25,11 @@ build a reference embedded OS called Poky.
       in the Yocto Project Development Tasks Manual for more
       information.
 
-   -  You may use Windows Subsystem For Linux v2 to set up a build host
-      using Windows 10.
-
-      .. note::
-
-         The Yocto Project is not compatible with WSLv1, it is
-         compatible but not officially supported nor validated with
-         WSLv2, if you still decide to use WSL please upgrade to WSLv2.
-
-      See the :ref:`dev-manual/start:setting up to use windows
-      subsystem for linux (wslv2)` section in the Yocto Project Development
-      Tasks Manual for more information.
+   -  You may use version 2 of Windows Subsystem For Linux (WSL 2) to set
+      up a build host using Windows 10 or later, Windows Server 2019 or later.
+      See the :ref:`dev-manual/start:setting up to use windows subsystem for
+      linux (wsl 2)` section in the Yocto Project Development Tasks Manual
+      for more information.
 
 If you want more conceptual or background information on the Yocto
 Project, see the :doc:`/overview-manual/index`.
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 6816ce5846..23d5643d12 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -267,16 +267,16 @@ development using the Yocto Project. Your build host can be a native
 Linux machine (recommended), it can be a machine (Linux, Mac, or
 Windows) that uses `CROPS <https://github.com/crops/poky-container>`__,
 which leverages `Docker Containers <https://www.docker.com/>`__ or it
-can be a Windows machine capable of running Windows Subsystem For Linux
-v2 (WSL).
+can be a Windows machine capable of running version 2 of Windows Subsystem
+For Linux (WSL 2).
 
 .. note::
 
-   The Yocto Project is not compatible with
-   `Windows Subsystem for Linux v1 <https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux>`__.
-   It is compatible but not officially supported nor validated with
-   WSLv2. If you still decide to use WSL please upgrade to
-   `WSLv2 <https://docs.microsoft.com/en-us/windows/wsl/install-win10>`__.
+   The Yocto Project is not compatible with version 1 of
+   `Windows Subsystem for Linux <https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux>`__.
+   It is compatible but neither officially supported nor validated with
+   WSL 2. If you still decide to use WSL please upgrade to
+   `WSL 2 <https://learn.microsoft.com/en-us/windows/wsl/install>`__.
 
 Once your build host is set up to use the Yocto Project, further steps
 are necessary depending on what you want to accomplish. See the
@@ -441,35 +441,36 @@ Kit (eSDK) manual. If you are going to use the Toaster container, see
 the ":doc:`/toaster-manual/setup-and-use`"
 section in the Toaster User Manual.
 
-Setting Up to Use Windows Subsystem For Linux (WSLv2)
+Setting Up to Use Windows Subsystem For Linux (WSL 2)
 -----------------------------------------------------
 
-With `Windows Subsystem for Linux
-(WSLv2) <https://docs.microsoft.com/en-us/windows/wsl/wsl2-about>`__,
+With `Windows Subsystem for Linux (WSL 2)
+<https://learn.microsoft.com/en-us/windows/wsl/>`__,
 you can create a Yocto Project development environment that allows you
 to build on Windows. You can set up a Linux distribution inside Windows
 in which you can develop using the Yocto Project.
 
-Follow these general steps to prepare a Windows machine using WSLv2 as
+Follow these general steps to prepare a Windows machine using WSL 2 as
 your Yocto Project build host:
 
-1. *Make sure your Windows 10 machine is capable of running WSLv2:*
-   WSLv2 is only available for Windows 10 builds > 18917. To check which
-   build version you are running, you may open a command prompt on
-   Windows and execute the command "ver".
-   ::
+1. *Make sure your Windows machine is capable of running WSL 2:*
+
+   While all Windows 11 and Windows Server 2022 builds support WSL 2,
+   the first versions of Windows 10 and Windows Server 2019 didn't.
+   Check the minimum build numbers for `Windows 10
+   <https://learn.microsoft.com/en-us/windows/wsl/install-manual#step-2---check-requirements-for-running-wsl-2>`__
+   and for `Windows Server 2019
+   <https://learn.microsoft.com/en-us/windows/wsl/install-on-server>`__.
+
+   To check which build version you are running, you may open a command
+   prompt on Windows and execute the command "ver"::
 
       C:\Users\myuser> ver
 
       Microsoft Windows [Version 10.0.19041.153]
 
-   If your build is capable of running
-   WSLv2 you may continue, for more information on this subject or
-   instructions on how to upgrade to WSLv2 visit `Windows 10
-   WSLv2 <https://docs.microsoft.com/en-us/windows/wsl/wsl2-install>`__
-
-2. *Install the Linux distribution of your choice inside Windows 10:*
-   Once you know your version of Windows 10 supports WSLv2, you can
+2. *Install the Linux distribution of your choice inside WSL 2:*
+   Once you know your version of Windows supports WSL 2, you can
    install the distribution of your choice from the Microsoft Store.
    Open the Microsoft Store and search for Linux. While there are
    several Linux distributions available, the assumption is that your
@@ -478,31 +479,28 @@ your Yocto Project build host:
    making your selection, simply click "Get" to download and install the
    distribution.
 
-3. *Check your Linux distribution is using WSLv2:* Open a Windows
+3. *Check which Linux distribution WSL 2 is using:* Open a Windows
    PowerShell and run::
 
       C:\WINDOWS\system32> wsl -l -v
       NAME    STATE   VERSION
       *Ubuntu Running 2
 
-   Note the version column which says the WSL version
-   being used by your distribution, on compatible systems, this can be
-   changed back at any point in time.
+   Note that WSL 2 supports running as many different Linux distributions
+   as you want to install.
 
-4. *Optionally Orient Yourself on WSL:* If you are unfamiliar with WSL,
-   you can learn more here -
+4. *Optionally Get Familiar with WSL:* You can learn more on
    https://docs.microsoft.com/en-us/windows/wsl/wsl2-about.
 
 5. *Launch your WSL Distibution:* From the Windows start menu simply
    launch your WSL distribution just like any other application.
 
-6. *Optimize your WSLv2 storage often:* Due to the way storage is
-   handled on WSLv2, the storage space used by the underlying Linux
+6. *Optimize your WSL 2 storage often:* Due to the way storage is
+   handled on WSL 2, the storage space used by the underlying Linux
    distribution is not reflected immediately, and since BitBake heavily
    uses storage, after several builds, you may be unaware you are
-   running out of space. WSLv2 uses a VHDX file for storage, this issue
-   can be easily avoided by manually optimizing this file often, this
-   can be done in the following way:
+   running out of space. As WSL 2 uses a VHDX file for storage, this issue
+   can be easily avoided by regularly optimizing this file in a manual way:
 
    1. *Find the location of your VHDX file:*
 
@@ -556,14 +554,14 @@ your Yocto Project build host:
 
 .. note::
 
-   The current implementation of WSLv2 does not have out-of-the-box
+   The current implementation of WSL 2 does not have out-of-the-box
    access to external devices such as those connected through a USB
    port, but it automatically mounts your ``C:`` drive on ``/mnt/c/``
    (and others), which you can use to share deploy artifacts to be later
    flashed on hardware through Windows, but your build directory should
    not reside inside this mountpoint.
 
-Once you have WSLv2 set up, everything is in place to develop just as if
+Once you have WSL 2 set up, everything is in place to develop just as if
 you were running on a native Linux machine. If you are going to use the
 Extensible SDK container, see the ":doc:`/sdk-manual/extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 4e3b7c3250..8b476f43c4 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -584,20 +584,15 @@ Build Host runs, you have several choices.
    ":ref:`dev-manual/start:setting up to use cross platforms (crops)`"
    section in the Yocto Project Development Tasks Manual.
 
--  *Windows Subsystem For Linux (WSLv2):* You may use Windows Subsystem
-   For Linux v2 to set up a Build Host using Windows 10.
+-  *Windows Subsystem For Linux (WSL 2):* You may use Windows Subsystem
+   For Linux version 2 to set up a Build Host using Windows 10 or later,
+   or Windows Server 2019 or later.
 
-   .. note::
-
-      The Yocto Project is not compatible with WSLv1, it is compatible
-      but not officially supported nor validated with WSLv2, if you
-      still decide to use WSL please upgrade to WSLv2.
-
-   The Windows Subsystem For Linux allows Windows 10 to run a real Linux
+   The Windows Subsystem For Linux allows Windows to run a real Linux
    kernel inside of a lightweight virtual machine (VM).
 
-   For information on how to set up a Build Host with WSLv2, see the
-   ":ref:`dev-manual/start:setting up to use windows subsystem for linux (wslv2)`"
+   For information on how to set up a Build Host with WSL 2, see the
+   ":ref:`dev-manual/start:setting up to use windows subsystem for linux (wsl 2)`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Toaster:* Regardless of what your Build Host is running, you can use
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index acc97c9d08..2a6d444040 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -74,12 +74,12 @@ distributions:
       the supported platforms listed below.
 
    -  You may use Windows Subsystem For Linux v2 to set up a build host
-      using Windows 10, but validation is not performed against build
-      hosts using WSLv2.
+      using Windows 10 or later, or Windows Server 2019 or later, but validation
+      is not performed against build hosts using WSL 2.
 
-   -  The Yocto Project is not compatible with WSLv1, it is
-      compatible but not officially supported nor validated with
-      WSLv2, if you still decide to use WSL please upgrade to WSLv2.
+      See the
+      :ref:`dev-manual/start:setting up to use windows subsystem for linux (wsl 2)`
+      section in the Yocto Project Development Tasks Manual for more information.
 
    -  If you encounter problems, please go to :yocto_bugs:`Yocto Project
       Bugzilla <>` and submit a bug. We are
-- 
2.34.1


