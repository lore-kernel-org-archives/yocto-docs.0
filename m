Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584D2C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 16:32:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1786.1684945929330512097
 for <docs@lists.yoctoproject.org>;
 Wed, 24 May 2023 09:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B09231042;
	Wed, 24 May 2023 09:32:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 27D603F6C4;
	Wed, 24 May 2023 09:32:08 -0700 (PDT)
From: ross.burton@arm.com
To: docs@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [RFC PATCH] WIP LICENSE_FLAGS_DETAILS documentation
Date: Wed, 24 May 2023 17:32:01 +0100
Message-Id: <20230524163201.3630288-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 May 2023 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3958

From: Ross Burton <ross.burton@arm.com>

---
 documentation/dev-manual/licenses.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-ma=
nual/licenses.rst
index 9629dc53293..805b40fd482 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -123,6 +123,13 @@ name and version (after variable expansion)::
=20
    LICENSE_FLAGS =3D "license_${PN}_${PV}"
=20
+It is possible to specify where to find more details for a specific lice=
nse
+using flags on the :term:`LICENSE_FLAGS_DETAILS` variable:
+
+  LICENSE_FLAGS_DETAILS[my-eula-license] =3D "https://example.com/eula"
+
+If set, this will be displayed to the user if the license hasn't been ac=
cepted.
+
 In order for a component restricted by a
 :term:`LICENSE_FLAGS` definition to be enabled and included in an image,=
 it
 needs to have a matching entry in the global
--=20
2.34.1


