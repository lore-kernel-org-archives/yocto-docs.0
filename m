Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.5896.1630491175355607345
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 03:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:47340 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mLNEh-0005Pg-5c
	for docs@lists.yoctoproject.org; Wed, 01 Sep 2021 06:12:53 -0400
Date: Wed, 1 Sep 2021 06:12:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: small number of minor aesthetic tweaks
Message-ID: <3d5c2274-c862-de20-34ca-198d33559d2@crashcourse.ca>
MIME-Version: 1.0
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


Just a collection of:

  - grammar tweaks
  - space fixes
  - font changes

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 4a5011ea7..ff5305dcb 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -25,7 +25,7 @@ Creating Your Own Layer
 -----------------------

 It is very easy to create your own layers to use with the OpenEmbedded
-build system. The Yocto Project ships with tools that speed up creating
+build system, as the Yocto Project ships with tools that speed up creating
 layers. This section describes the steps you perform by hand to create
 layers so that you can better understand them. For information about the
 layer-creation tools, see the
@@ -843,8 +843,8 @@ the :term:`IMAGE_INSTALL` variable with the ``:append`` operator::

    IMAGE_INSTALL:append = " strace"

-Use of the syntax is important -
-specifically, the space between the quote and the package name, which is
+Use of the syntax is important; specifically, the leading space
+after the opening quote and before the package name, which is
 ``strace`` in this example. This space is required since the ``:append``
 operator does not add the space.

@@ -3517,9 +3517,9 @@ either by using Ctrl+d or closing the terminal window.
 Building
 ========

-This section describes various build procedures. For example, the steps
-needed for a simple build, a target that uses multiple configurations,
-building an image for more than one machine, and so forth.
+This section describes various build procedures, such as the steps
+needed for a simple build, building a target for multiple configurations,
+generating an image for more than one machine, and so forth.

 Building a Simple Image
 -----------------------
@@ -3575,8 +3575,10 @@ The following figure and list overviews the build process:
    .. note::

       A common practice is to use a different Build Directory for
-      different targets. For example, ``~/build/x86`` for a ``qemux86``
-      target, and ``~/build/arm`` for a ``qemuarm`` target.
+      different targets; for example, ``~/build/x86`` for a ``qemux86``
+      target, and ``~/build/arm`` for a ``qemuarm`` target. In any
+      event, it's typically cleaner to locate the build directory
+      somewhere outside of your source directory.

 3. *Make Sure Your* ``local.conf`` *File is Correct*: Ensure the
    ``conf/local.conf`` configuration file, which is found in the Build
@@ -3599,7 +3601,7 @@ The following figure and list overviews the build process:
    The target is the name of the recipe you want to build. Common
    targets are the images in ``meta/recipes-core/images``,
    ``meta/recipes-sato/images``, and so forth all found in the
-   :term:`Source Directory`. Or, the target
+   :term:`Source Directory`. Alternatively, the target
    can be the name of a recipe for a specific piece of software such as
    BusyBox. For more details about the images the OpenEmbedded build
    system supports, see the
@@ -3810,7 +3812,7 @@ Follow these steps to create an initramfs image:

    .. note::

-      It is recommended that you do bundle the initramfs image with the
+      It is recommended that you bundle the initramfs image with the
       kernel image to avoid circular dependencies between the kernel
       recipe and the initramfs recipe should the initramfs image include
       kernel modules.
@@ -4430,7 +4432,7 @@ directory:
          SRCREV = "${AUTOREV}"

       When a recipe sets :term:`SRCREV` to
-      ``${AUTOREV}``, the build system accesses the network in an
+      ``${``\ :term:`AUTOREV`\ ``}``, the build system accesses the network in an
       attempt to determine the latest version of software from the SCM.
       Typically, recipes that use :term:`AUTOREV` are custom or modified
       recipes. Recipes that reside in public repositories usually do not
@@ -7571,7 +7573,7 @@ Selecting a Device Manager
 The Yocto Project provides multiple ways to manage the device manager
 (``/dev``):

--  Persistent and Pre-Populated\ ``/dev``: For this case, the ``/dev``
+-  Persistent and Pre-Populated ``/dev``: For this case, the ``/dev``
    directory is persistent and the required device nodes are created
    during the build.

@@ -7581,7 +7583,7 @@ The Yocto Project provides multiple ways to manage the device manager
    configuration of device nodes is done in user space by a device
    manager like ``udev`` or ``busybox-mdev``.

-Using Persistent and Pre-Populated\ ``/dev``
+Using Persistent and Pre-Populated ``/dev``
 --------------------------------------------

 To use the static method for device population, you need to set the

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
