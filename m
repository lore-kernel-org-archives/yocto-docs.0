Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.10345.1619892583096802624
 for <docs@lists.yoctoproject.org>;
 Sat, 01 May 2021 11:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:59916 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lcu3i-00028l-8A
	for docs@lists.yoctoproject.org; Sat, 01 May 2021 14:09:41 -0400
Date: Sat, 1 May 2021 14:09:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] sdk-manual: various cleanups to intro.rst
Message-ID: <f8833f4-34ab-98d2-ede1-881bf279ee60@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


Minutiae including grammar fixes, increased brevity and adding a
proper link to another SDK manual section.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index d966efea7..22af4bec1 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -8,8 +8,8 @@ eSDK Introduction
 =================

 Welcome to the Yocto Project Application Development and the Extensible
-Software Development Kit (eSDK) manual. This manual provides information
-that explains how to use both the Yocto Project extensible and standard
+Software Development Kit (eSDK) manual. This manual
+explains how to use both the Yocto Project extensible and standard
 SDKs to develop applications and images.

 .. note::
@@ -25,12 +25,13 @@ SDKs to develop applications and images.
 All SDKs consist of the following:

 -  *Cross-Development Toolchain*: This toolchain contains a compiler,
-   debugger, and various miscellaneous tools.
+   debugger, and various associated tools.

 -  *Libraries, Headers, and Symbols*: The libraries, headers, and
-   symbols are specific to the image (i.e. they match the image).
+   symbols are specific to the image (i.e. they match the image
+   against which the SDK was built).

--  *Environment Setup Script*: This ``*.sh`` file, once run, sets up the
+-  *Environment Setup Script*: This ``*.sh`` file, once sourced, sets up the
    cross-development environment by defining variables and preparing for
    SDK use.

@@ -48,14 +49,14 @@ time since that path cannot be dynamically altered. This is the reason
 for a wrapper around the ``populate_sdk`` and ``populate_sdk_ext``
 archives.

-Another feature for the SDKs is that only one set of cross-compiler
+Another feature of the SDKs is that only one set of cross-compiler
 toolchain binaries are produced for any given architecture. This feature
 takes advantage of the fact that the target hardware can be passed to
 ``gcc`` as a set of compiler options. Those options are set up by the
 environment script and contained in variables such as
 :term:`CC` and
 :term:`LD`. This reduces the space needed
-for the tools. Understand, however, that every target still needs a
+for the tools. Understand, however, that every target still needs its own
 sysroot because those binaries are target-specific.

 The SDK development environment consists of the following:
@@ -118,8 +119,8 @@ The Cross-Development Toolchain

 The :term:`Cross-Development Toolchain` consists
 of a cross-compiler, cross-linker, and cross-debugger that are used to
-develop user-space applications for targeted hardware. Additionally, for
-an extensible SDK, the toolchain also has built-in ``devtool``
+develop user-space applications for targeted hardwarer; in addition,
+the extensible SDK comes with built-in ``devtool``
 functionality. This toolchain is created by running a SDK installer
 script or through a :term:`Build Directory` that is based on
 your metadata configuration or extension for your targeted device. The
@@ -138,21 +139,19 @@ The QEMU Emulator
 -----------------

 The QEMU emulator allows you to simulate your hardware while running
-your application or image. QEMU is not part of the SDK but is made
-available a number of different ways:
+your application or image. QEMU is not part of the SDK but is
+automatically installed and available if you have done any one of
+the following:

--  If you have cloned the ``poky`` Git repository to create a
-   :term:`Source Directory` and you have
-   sourced the environment setup script, QEMU is installed and
-   automatically available.
+-  cloned the ``poky`` Git repository to create a
+   :term:`Source Directory` and sourced the environment setup script.

--  If you have downloaded a Yocto Project release and unpacked it to
-   create a Source Directory and you have sourced the environment setup
-   script, QEMU is installed and automatically available.
+-  downloaded a Yocto Project release and unpacked it to
+   create a Source Directory and sourced the environment setup
+   script.

--  If you have installed the cross-toolchain tarball and you have
-   sourced the toolchain's setup environment script, QEMU is also
-   installed and automatically available.
+-  installed the cross-toolchain tarball and
+   sourced the toolchain's setup environment script.

 SDK Development Model
 =====================
@@ -202,10 +201,9 @@ You just need to follow these general steps:

    .. note::

-      To use the root filesystem in QEMU, you need to extract it. See
-      the "
-      Extracting the Root Filesystem
-      " section for information on how to extract the root filesystem.
+      To use the root filesystem in QEMU, you need to extract it. See the
+      ":ref:`sdk-manual/appendix-obtain:extracting the root filesystem`"
+      section for information on how to do this extraction.

 3. *Develop and Test your Application:* At this point, you have the
    tools to develop your application. If you need to separately install


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
