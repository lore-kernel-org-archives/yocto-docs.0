Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.7455.1603885001959132275
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 04:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Lr/aIs9F;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 507BE20B36E7; Wed, 28 Oct 2020 04:36:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 507BE20B36E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603884997;
	bh=crvMQlVtS3pLMk3QIFhJM9iFOIhMU9VwZQBXFH2E4tc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Lr/aIs9Fk3rKxivP/6Uw4cIbUnG1moZ+bTYuuPeiklNNNsxmPcAm+xxL2UqE0o4tF
	 PG2hDdEeo6QFcJHx1FNiPPu1teVefln519oNx8DG9m061rEI8EGKCvA9hOP8DU11Gh
	 aKWgiHuhaJelJjJM7CM9/fBpYJMgpry33pWoYFnc=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/3] ref-manual: add migration info about MLPREFIX changes
Date: Wed, 28 Oct 2020 04:36:25 -0700
Message-Id: <56d81b92fd0667340158c42cde120f4409aa4678.1603884913.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1603884913.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603884913.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a migration subsection on the need to add MLPREFIX to conditional
package dependencies in gatesgarth.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/migration-3.2.rst | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/documentation/ref-manual/migration-3.2.rst b/documentation/ref-manual/migration-3.2.rst
index 3c0ea7b..b536f8e 100644
--- a/documentation/ref-manual/migration-3.2.rst
+++ b/documentation/ref-manual/migration-3.2.rst
@@ -75,6 +75,37 @@ pseudo will throw an ``abort()`` and direct you to a `wiki page <https://wiki.yo
 that explains how to deal with this.
 
 
+.. _migration-3.2-multilib-mlprefix:
+
+``MLPREFIX`` now required for multilib when runtime dependencies conditionally added
+------------------------------------------------------------------------------------
+
+In order to solve some previously intractable problems with runtime
+dependencies and multilib, a change was made that now requires the :term:`MLPREFIX`
+value to be explicitly prepended to package names being added as
+dependencies (e.g. in :term:`RDEPENDS` and :term:`RRECOMMENDS` values)
+where the dependency is conditionally added.
+
+If you have anonymous python or in-line python conditionally adding
+dependencies in your custom recipes, and you intend for those recipes to
+work with multilib, then you will need to ensure that ``${MLPREFIX}``
+is prefixed on the package names in the dependencies, for example
+(from the ``glibc`` recipe): ::
+
+    RRECOMMENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
+
+This also applies when conditionally adding packages to :term:`PACKAGES` where
+those packages have dependencies, for example (from the ``alsa-plugins`` recipe): ::
+
+    PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
+    ...
+    RDEPENDS_${PN}-pulseaudio-conf += "\
+            ${MLPREFIX}libasound-module-conf-pulse \
+            ${MLPREFIX}libasound-module-ctl-pulse \
+            ${MLPREFIX}libasound-module-pcm-pulse \
+    "
+
+
 .. _migration-3.2-packagegroup-core-device-devel:
 
 packagegroup-core-device-devel no longer included in images built for qemu* machines
-- 
1.8.3.1

