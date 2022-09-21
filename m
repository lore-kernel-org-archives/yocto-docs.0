Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6C5C6FA8B
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 20:25:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.11434.1663791907445205795
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 13:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TuQarAv0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6F55020005;
	Wed, 21 Sep 2022 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663791905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2W+E2K3L4iysjIZKTIm6Q5uNdR1TQJ79aKaAANgs71w=;
	b=TuQarAv0kQQgUs7yKtaCCSiaWDWoa9DHsA17wIgGsaIqtVuT1sja+jN5RGNwWuX+9MPVX1
	fwXV7QT49C5l9hk7aJvB/M3Kn1eeQLTzXVvhzySmJEjGSOfM3TgYAi/BawiLMFH0+EoAQC
	M8Sr3L9j5TMctOheJbA5XoHxSxoupkczWDAvWnYkirKT7tywU0OxFUVk4yK3RobGLCAFdz
	gkWUZV/UU/p0WTpVwyYTDuLv8mlPVL7Au/85SF7wERY8GylzWF+joBwLN0Us+2SxZuLUvo
	wHiCR69zmmPxlr8TQj8nlx61EvtPY6g2U59AwOOWGOun1QhnysHV09mHaEH9cQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: features.rst: add missing default distro features
Date: Wed, 21 Sep 2022 22:24:59 +0200
Message-Id: <20220921202459.150532-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Sep 2022 20:25:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3201

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Document default machine features defined in Poky, and which
were not listed in the documentation yet.

Took the values of DISTRO_FEATURES_DEFAULT and POKY_DEFAULT_DISTRO_FEATURES:
meta-poky/conf/distro/poky.conf:DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"

Also explain that extra layers can define their own features.

This addresses [YOCTO #14515]

---

Note that the list in the document still contains distro features which
are not part of the default ones:

api-documentation, cramfs, directfb, ipsec, keyboard, ldconfig, ppp, smbfs, systemd, usrmerge.
---
 documentation/ref-manual/features.rst | 43 +++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 8dfe29d66a..5e853caa2c 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -113,10 +113,15 @@ configuration level. See the
 information.
 
 This list only represents features as shipped with the Yocto Project
-metadata:
+metadata, as extra layers can define their own:
 
--  *alsa:* Include ALSA support (OSS compatibility kernel modules
-   installed if available).
+-  *3g:* Include support for cellular data.
+
+-  *acl:* Include
+   `Access Control List <https://en.wikipedia.org/wiki/Access-control_list>`__ support.
+
+-  *alsa:* Include `Advanced Linux Sound Architecture <https://en.wikipedia.org/wiki/Advanced_Linux_Sound_Architecture>`__
+   support (OSS compatibility kernel modules installed if available).
 
 -  *api-documentation:* Enables generation of API documentation during
    recipe builds. The resulting documentation is added to SDK tarballs
@@ -129,6 +134,10 @@ metadata:
 
 -  *cramfs:* Include CramFS support.
 
+-  *debuginfod:* Include support for getting ELF debugging information through
+   a :ref:`debuginfod <dev-manual/common-tasks:using the debuginfod server method>`
+   server.
+
 -  *directfb:* Include DirectFB support.
 
 -  *ext2:* Include tools for supporting for devices with internal
@@ -136,14 +145,25 @@ metadata:
 
 -  *ipsec:* Include IPSec support.
 
+-  *ipv4:* Include IPv4 support.
+
 -  *ipv6:* Include IPv6 support.
 
 -  *keyboard:* Include keyboard support (e.g. keymaps will be loaded
    during boot).
 
+-  *largefile:* Enable building applications with
+   `argefile support <https://en.wikipedia.org/wiki/Large-file_support>`__.
+
+-  *multiarch:* Enable building applications with multiple architecture
+   support.
+
 -  *ldconfig:* Include support for ldconfig and ``ld.so.conf`` on the
    target.
 
+-  *nfc:* Include support for
+   `Near Field Communication <https://en.wikipedia.org/wiki/Near-field_communication>`__.
+
 -  *nfs:* Include NFS client support (for mounting NFS exports on
    device).
 
@@ -162,6 +182,11 @@ metadata:
    ":ref:`dev-manual/common-tasks:testing packages with ptest`" section
    in the Yocto Project Development Tasks Manual.
 
+-  *seccomp:* Enables building applications with
+   `seccomp <https://en.wikipedia.org/wiki/Seccomp>`__ support, to
+   allow them to strictly restrict the system calls that they are allowed
+   to invoke.
+
 -  *smbfs:* Include SMB networks client support (for mounting
    Samba/Microsoft Windows shares on device).
 
@@ -180,6 +205,12 @@ metadata:
    directories into their respective counterparts in the ``/usr``
    directory to provide better package and application compatibility.
 
+-  *vfat:* Include `FAT filesystem <https://en.wikipedia.org/wiki/File_Allocation_Table>`__
+   support.
+
+-  *vulkan:* Include support for the
+   `Vulkan API <https://en.wikipedia.org/wiki/Vulkan>`__.
+
 -  *wayland:* Include the Wayland display server protocol and the
    library that supports it.
 
@@ -187,6 +218,12 @@ metadata:
 
 -  *x11:* Include the X server and libraries.
 
+-  *xattr:* Include support for
+   `extended file attributes <https://en.wikipedia.org/wiki/Extended_file_attributes>`__.
+
+-  *zeroconf:* Include support for
+   `zero configuration networking <https://en.wikipedia.org/wiki/Zero-configuration_networking>`__.
+
 .. _ref-features-image:
 
 Image Features
-- 
2.34.1


