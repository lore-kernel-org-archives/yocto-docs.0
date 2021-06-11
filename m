Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web09.4944.1623392807869343851
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 23:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 2008C6004E
	for <docs@lists.yoctoproject.org>; Fri, 11 Jun 2021 08:26:39 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: docs@lists.yoctoproject.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [PATCH 2/2] ref-manual: variables: document IMGDEPLOYDIR
Date: Fri, 11 Jun 2021 08:26:13 +0200
Message-Id: <20210611062613.188300-3-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611062613.188300-1-dwagenknecht@emlix.com>
References: <20210611062613.188300-1-dwagenknecht@emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

DEPLOY_DIR_IMAGE has been replaced by IMGDEPLOYDIR for most use cases
since OE-Core rev 6d969bacc718e21a5246d4da9bf9639dcae29b02. Document
IMGDEPLOYDIR and add a note to DEPLOY_DIR_IMAGE about it.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 documentation/ref-manual/variables.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 2e859c718..8b41a1fe1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1673,6 +1673,11 @@ system and gives an overview of their function and=
 contents.
       resides within the :term:`Build Directory` as
       ``${DEPLOY_DIR}/images/${MACHINE}/``.
=20
+      It is usually not used directly in recipes, but filled with the co=
ntents
+      of :term:`DEPLOYDIR` by the :ref:`deploy <ref-classes-deploy>` cla=
ss or
+      with the contents of :term:`IMGDEPLOYDIR` by the :ref:`image
+      <ref-classes-image>` class.
+
       For more information on the structure of the Build Directory, see
       ":ref:`ref-manual/structure:the build directory - \`\`build/\`\``"=
 section.
       For more detail on the contents of the ``deploy`` directory, see t=
he
@@ -3324,6 +3329,18 @@ system and gives an overview of their function and=
 contents.
       desired, and this suffix would then be used consistently across
       the build artifacts.
=20
+   :term:`IMGDEPLOYDIR`
+      When inheriting the :ref:`image <ref-classes-image>` directly or
+      through the :ref:`core-image <ref-classes-core-image>` class, the
+      ``IMGDEPLOYDIR`` points to a temporary work area for deployed file=
s
+      that is set in the ``image`` class as follows::
+
+         IMGDEPLOYDIR =3D "${WORKDIR}/deploy-${PN}-image-complete"
+
+      Recipes inheriting the ``image`` class should copy files to be
+      deployed into ``IMGDEPLOYDIR``, and the class will take care of
+      copying them into :term:`DEPLOY_DIR_IMAGE` afterwards.
+
    :term:`INC_PR`
       Helps define the recipe revision for recipes that share a common
       ``include`` file. You can think of this variable as part of the
--=20
2.25.1

