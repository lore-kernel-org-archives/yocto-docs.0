Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.2157.1603847918386591009
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 18:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=rCUj1qzw;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 840B020BE4BC; Tue, 27 Oct 2020 18:18:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 840B020BE4BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603847917;
	bh=NivR2+uCfxPRP8p47g2PpBPrErAkereWX84Gp3ShMv4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rCUj1qzwypxwcUd5q8GwcIvCURsFqNGL1h15zROte3fArI8Vu4xNC2ok7XBftiBXH
	 EUVXS3cg3JURgDgeAbLBJZFYyRVHyP/C9mbwVJgyx5ZqRl4jjWXBtFg9dpBK4+lR8q
	 Y+Lra2yXNywcxoPAP3mPRtxJKNK4WeilbYEFxyEc=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 5/7] ref-manual: add IMAGE_VERSION_SUFFIX variable
Date: Tue, 27 Oct 2020 18:18:33 -0700
Message-Id: <86a1a3c8796f47d34dd044b744780860ec17e842.1603839557.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add an entry to the variable glossary for IMAGE_VERSION_SUFFIX (which
was added in thud) and update the IMAGE_NAME and KERNEL_ARTIFACT_NAME
entries whose defaults use this variable.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/ref-variables.rst | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 176c94a..319f376 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -3121,11 +3121,11 @@ system and gives an overview of their function and contents.
    :term:`IMAGE_NAME`
       The name of the output image files minus the extension. This variable
       is derived using the :term:`IMAGE_BASENAME`,
-      :term:`MACHINE`, and :term:`DATETIME`
+      :term:`MACHINE`, and :term:`IMAGE_VERSION_SUFFIX`
       variables:
       ::
 
-         IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
+         IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
    :term:`IMAGE_OVERHEAD_FACTOR`
       Defines a multiplier that the build system applies to the initial
@@ -3329,6 +3329,14 @@ system and gives an overview of their function and contents.
       For more information about these types of images, see
       ``meta/classes/image_types*.bbclass`` in the :term:`Source Directory`.
 
+   :term:`IMAGE_VERSION_SUFFIX`
+      Version suffix that is part of the default :term:`IMAGE_NAME` and
+      :term:`KERNEL_ARTIFACT_NAME` values.
+      Defaults to ``"-${DATETIME}"``, however you could set this to a
+      version string that comes from your external build environment if
+      desired, and this suffix would then be used consistently across
+      the build artifacts.
+
    :term:`INC_PR`
       Helps define the recipe revision for recipes that share a common
       ``include`` file. You can think of this variable as part of the
@@ -3787,12 +3795,8 @@ system and gives an overview of their function and contents.
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
-      See the :term:`PKGE`, :term:`PKGV`, :term:`PKGR`, and :term:`MACHINE`
-      variables for additional information.
-
-      .. note::
-
-         The ``IMAGE_VERSION_SUFFIX`` variable is set to :term:`DATETIME`.
+      See the :term:`PKGE`, :term:`PKGV`, :term:`PKGR`, :term:`MACHINE`
+      and :term:`IMAGE_VERSION_SUFFIX` variables for additional information.
 
    :term:`KERNEL_CLASSES`
       A list of classes defining kernel image types that the
-- 
1.8.3.1

