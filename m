Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A747C47089
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.4252.1665393876351190575
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=GpBg/7ZO;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id E356F20EC319; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E356F20EC319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393875;
	bh=s3aY4qMTe4DZaA3qPetwcrXqHo0R8SHhinCH4SSCg1A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GpBg/7ZOeA3thDO0AV+1/CiEqZ8EmWhVEnKLNYZ60UMTtPxEOB813ygL5zVHk9beU
	 YCWHs/3Ytup78gdY/WH4QWy10JlI8duuywvkMgcTLjjWmNAEAJutZ8y83Z+Sti5JGl
	 MNmwJEKEZ1nRpusmUHostRvDjkPvNagHor2ttu8o=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 03/34] ref-manual: expand documentation on image-buildinfo
 class
Date: Mon, 10 Oct 2022 02:23:49 -0700
Message-Id: 
 <168459f0d56b9c799885a9b241226bf630d68943.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3304

From: Paul Eggleton <paul.eggleton@microsoft.com>

Expand the documentation on the image-buildinfo class, and add variable
glossary entries for IMAGE_BUILDINFO_FILE, IMAGE_BUILDINFO_VARS and
SDK_BUILDINFO_FILE (latter is new in 4.1).

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst   | 18 ++++++++++++++++--
 documentation/ref-manual/variables.rst | 16 ++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 5e49613..cc0d212 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -881,8 +881,22 @@ Yocto Project Overview and Concepts Manual.
 ``image-buildinfo.bbclass``
 ===========================
 
-The ``image-buildinfo`` class writes information to the target
-filesystem on ``/etc/build``.
+The ``image-buildinfo`` class writes a plain text file containing
+build information to the target filesystem at ``${sysconfdir}/buildinfo``
+by default (as specified by :term:`IMAGE_BUILDINFO_FILE`.
+This can be useful for manually determining the origin of any given
+image. It writes out two sections:
+
+1. `Build Configuration`: a list of variables and their values (specified
+   by :term:`IMAGE_BUILDINFO_VARS`, which defaults to :term:`DISTRO` and
+   :term:`DISTRO_VERSION`)
+
+2. `Layer Revisions`: the revisions of all of the layers used in the
+   build.
+
+Additionally, when building an SDK it will write the same contents
+to ``/buildinfo`` by default (as specified by
+:term:`SDK_BUILDINFO_FILE`).
 
 .. _ref-classes-image_types:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8ea9834..8b0331c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3053,6 +3053,17 @@ system and gives an overview of their function and contents.
       material for Wic is located in the
       ":doc:`/ref-manual/kickstart`" chapter.
 
+   :term:`IMAGE_BUILDINFO_FILE`
+      When using the :ref:`image-buildinfo <ref-classes-image-buildinfo>` class,
+      specifies the file in the image to write the build information into. The
+      default value is "``${sysconfdir}/buildinfo``".
+
+   :term:`IMAGE_BUILDINFO_VARS`
+      When using the :ref:`image-buildinfo <ref-classes-image-buildinfo>` class,
+      specifies the list of variables to include in the `Build Configuration`
+      section of the output file (as a space-separated list). Defaults to
+      ":term:`DISTRO` :term:`DISTRO_VERSION`".
+
    :term:`IMAGE_CLASSES`
       A list of classes that all images should inherit. You typically use
       this variable to specify the list of classes that register the
@@ -6627,6 +6638,11 @@ system and gives an overview of their function and contents.
       The target architecture for the SDK. Typically, you do not directly
       set this variable. Instead, use :term:`SDKMACHINE`.
 
+   :term:`SDK_BUILDINFO_FILE`
+      When using the :ref:`image-buildinfo <ref-classes-image-buildinfo>` class,
+      specifies the file in the SDK to write the build information into. The
+      default value is "``/buildinfo``".
+
    :term:`SDK_CUSTOM_TEMPLATECONF`
       When building the extensible SDK, if :term:`SDK_CUSTOM_TEMPLATECONF` is set to
       "1" and a ``conf/templateconf.cfg`` file exists in the build directory
-- 
1.8.3.1


