Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC296C4167D
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4271.1665393877464287461
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=WF0ZCuzG;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 0FB5E20F0682; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0FB5E20F0682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393877;
	bh=Lpl+CCTuGs026nfpe1JIwWn0TNl49iykbdZPlcghWgI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WF0ZCuzGh8MGb3Nuqks1JUZ4aITbWFNeIIO0Kh5LD5Rzh/j5zSeuIJ62z9PALt/Pn
	 SOl+ErSv/za1favEMDDq1cN3/T/0BD8LL5SsOOuqSsKlx4kuXg6HvUuhyzYnYNPXKu
	 I65kLkBfa44/RmLHm+gVYTcSeKzpC5rGG5JCRPJg=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 26/34] ref-manual: add missing features
Date: Mon, 10 Oct 2022 02:24:12 -0700
Message-Id: 
 <fc009a1f60d44ae2fa0fb9a92162884d362bc230.1665392836.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3329

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add missing IMAGE_FEATURES, DISTRO_FEATURES and MACHINE_FEATURES items.
Additionally, add a note that DISTRO_FEATURES doesn't have any impact on
the kernel configuration so that users are aware they have to take care
of that as well. (I thought the same was true of MACHINE_FEATURES, but
it seems we have a couple of isolated cases where that will adjust the
kernel configuration - few enough that I suspect they might have slipped
in and thus probably shouldn't be documented yet.)

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/features.rst | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index dad871d..ea4d257 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -72,6 +72,8 @@ Project metadata:
 
 -  *phone:* Mobile phone (voice) support
 
+-  *qemu-usermode:* QEMU can support user-mode emulation for this machine
+
 -  *qvga:* Machine has a QVGA (320x240) display
 
 -  *rtc:* Machine has a Real-Time Clock
@@ -112,6 +114,13 @@ configuration level. See the
 :term:`COMBINED_FEATURES` variable for more
 information.
 
+.. note::
+
+   :term:`DISTRO_FEATURES` is normally independent of kernel configuration,
+   so if a feature specified in :term:`DISTRO_FEATURES` also relies on
+   support in the kernel, you will also need to ensure that support is
+   enabled in the kernel configuration.
+
 This list only represents features as shipped with the Yocto Project
 metadata, as extra layers can define their own:
 
@@ -143,6 +152,9 @@ metadata, as extra layers can define their own:
 -  *ext2:* Include tools for supporting for devices with internal
    HDD/Microdrive for storing files (instead of Flash only devices).
 
+-  *gobject-introspection-data:* Include data to support
+   `GObject Introspection <https://gi.readthedocs.io/en/latest/>`__.
+
 -  *ipsec:* Include IPSec support.
 
 -  *ipv4:* Include IPv4 support.
@@ -155,23 +167,38 @@ metadata, as extra layers can define their own:
 -  *multiarch:* Enable building applications with multiple architecture
    support.
 
+-  *ld-is-gold:* Use the `gold <https://en.wikipedia.org/wiki/Gold_(linker)>`__
+   linker instead of the standard GCC linker (bfd).
+
 -  *ldconfig:* Include support for ldconfig and ``ld.so.conf`` on the
    target.
 
+-  *lto:* Enable `Link-Time Optimisation <https://gcc.gnu.org/wiki/LinkTimeOptimization>`__.
+
 -  *nfc:* Include support for
    `Near Field Communication <https://en.wikipedia.org/wiki/Near-field_communication>`__.
 
 -  *nfs:* Include NFS client support (for mounting NFS exports on
    device).
 
+-  *nls:* Include National Language Support (NLS).
+
 -  *opengl:* Include the Open Graphics Library, which is a
    cross-language, multi-platform application programming interface used
    for rendering two and three-dimensional graphics.
 
+-  *overlayfs:* Include `OverlayFS <https://docs.kernel.org/filesystems/overlayfs.html>`__
+   support.
+
+-  *pam:* Include `Pluggable Authentication Module (PAM) <https://en.wikipedia.org/wiki/Pluggable_authentication_module>`__
+   support.
+
 -  *pci:* Include PCI bus support.
 
 -  *pcmcia:* Include PCMCIA/CompactFlash support.
 
+-  *polkit:* Include `Polkit <https://en.wikipedia.org/wiki/Polkit>`__ support.
+
 -  *ppp:* Include PPP dialup support.
 
 -  *ptest:* Enables building the package tests where supported by
@@ -179,6 +206,13 @@ metadata, as extra layers can define their own:
    ":ref:`dev-manual/common-tasks:testing packages with ptest`" section
    in the Yocto Project Development Tasks Manual.
 
+-  *pulseaudio:* Include support for
+   `PulseAudio <https://www.freedesktop.org/wiki/Software/PulseAudio/>`__.
+
+-  *selinux:* Include support for
+   `Security-Enhanced Linux (SELinux) <https://en.wikipedia.org/wiki/Security-Enhanced_Linux>`__
+   (requires `meta-selinux <https://layers.openembedded.org/layerindex/layer/meta-selinux/>`__).
+
 -  *seccomp:* Enables building applications with
    `seccomp <https://en.wikipedia.org/wiki/Seccomp>`__ support, to
    allow them to strictly restrict the system calls that they are allowed
@@ -270,6 +304,9 @@ Here are the image features available for all images:
        just disables the mechanism which forces an non-empty password for the
        root user.
 
+-  *lic-pkgs:* Installs license packages for all packages installed in a
+   given image.
+
 -  *overlayfs-etc:* Configures the ``/etc`` directory to be in ``overlayfs``.
    This allows to store device specific information elsewhere, especially
    if the root filesystem is configured to be read-only.
@@ -294,6 +331,12 @@ Here are the image features available for all images:
    section in the Yocto Project Development Tasks Manual for more
    information.
 
+-  *read-only-rootfs-delayed-postinsts:* when specified in conjunction
+   with ``read-only-rootfs``, specifies that post-install scripts are
+   still permitted (this assumes that the root filesystem will be made
+   writeable for the first boot; this feature does not do anything to
+   ensure that - it just disables the check for post-install scripts.)
+
 -  *splash:* Enables showing a splash screen during boot. By default,
    this screen is provided by ``psplash``, which does allow
    customization. If you prefer to use an alternative splash screen
@@ -301,6 +344,11 @@ Here are the image features available for all images:
    different package name (or names) within the image recipe or at the
    distro configuration level.
 
+-  *stateless-rootfs:*: specifies that the image should be created as
+   stateless - when using ``systemd``, ``systemctl-native`` will not
+   be run on the image, leaving the image for population at runtime by
+   systemd.
+
 -  *staticdev-pkgs:* Installs static development packages, which are
    static libraries (i.e. ``*.a`` files), for all packages installed in
    a given image.
@@ -351,6 +399,8 @@ these valid features is as follows:
 -  *tools-testapps:* Installs device testing tools (e.g. touchscreen
    debugging).
 
+-  *weston:* Installs Weston (reference Wayland environment).
+
 -  *x11:* Installs the X server.
 
 -  *x11-base:* Installs the X server with a minimal environment.
-- 
1.8.3.1


