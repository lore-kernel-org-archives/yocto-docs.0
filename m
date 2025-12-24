Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E49E776FE
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123739.1766593937983446850
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sdXrw7MZ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 470CF4E41D8E
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 061486073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F33F102F0CD4;
	Wed, 24 Dec 2025 17:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/WV1VM6qL4Eei5VCCpZaR1LG/xORxtjP4ChxaBiN934=;
	b=sdXrw7MZTQUfk0lhtIvmN2dK7wyKCM1BeFZKh5fd8O1Ccnq1bB8n0RDUr9uSflrxS7zxWt
	e64KQI9G228B9skFc+9MZuGvJnOC5gtVIkRJv8FXTDd+cfiDOD3gREJ0Kffn8LPNSsLan1
	bQibPWFx8ERCCrHoANhg6PZtv6f6qxxHqxVdTcIXhk7SzSlYqZu5DIQ2AWUulJ62hgGj79
	69Xb6EnAoENRKdeMFZ5AdJNa9v/06r9Cn0DU76lto/KfbXPuCUPP/+mQL/kMxOl6g3Hw9M
	gQYok/xs6QfdB/t7zlESKhdszvudPUzwFTs/KSPgPRGiHGSe1O3UsZo47G8Kzg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:06 +0100
Subject: [PATCH 40/53] dev-manual/packages.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-40-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EPCa9C7yxCx05IP3i8YHKGbklM4tP03LJPiuC1Ochik=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVuI0PkG6vyOB0m9wP4wfEwoUmlnIYbj6zJg
 nXZS3C6Dt6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbgAKCRDRgEFAKaOo
 Nk6MD/4uXvKt2295FrzbvOCuHcB2hb+phgkjgj7/WtC5FbX6Fjn065sB5g6x+c00gv+8MVw1yEl
 pgwk5+AJI0ZVRcy7jqD9keC2nbwALQJlnrIv5byO1IMCFRMebQnU46OCPrqVb5dO9pQ9GE0B48U
 0oOBr31IV2hCVWwSByQlH4m6fo4XHrJZClKVKeCIks9eX24BtQKqr5NGY/kgM2tli3V8qCSv+Du
 zE1uJZXhRAfxcVg0l3X5tKoiAnfWEy3t4tQCK29k3aanfG19WfODKz4EfmywpXuS+KAr76yakQg
 6xIZS8mD9cnGLQpKwhtc0ckATEH7EO2y/B6UR1QCz7PiyYsNkS0WW/tt4/6J+2vSIqEM4BaOkGz
 swX8z/Td0Ni6vbrCJluvlbn593AswlfkpwH4iGUrWSbYr+Vu/QqGE8PupCeQ3n0V03iWKa42FEZ
 yyhAx03Wa4Tr64lo1nkp6/1kF4lpJoOBT+yF3hsZTLHXK7PfUZ8A5twb6dYerZNi3syEFjTbE/o
 RpRTKERnm5dKYysidaZHAYtEqT1PsRGqalj6MzM5FrUWZIYWi6tDkwTE2vi+1Lgqx8Yi16ijjet
 vQYVOT7P1YE7SHuHytULBiyNWenlPKMR96DqiJxPu40U84mihfa5nM1s2f4h+FilZy+5QbYiJtH
 DuMSRHSfeBYqaJg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8369

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/packages.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 8bd48c8e8..a27c076c3 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -362,7 +362,7 @@ multiple times if you have more than one set of modules to package.
 
 For more examples that show how to use ``do_split_packages``, see the
 ``connman.inc`` file in the ``meta/recipes-connectivity/connman/``
-directory of the ``poky`` :ref:`source repository <overview-manual/development-environment:yocto project source repositories>`. You can
+directory of :term:`OpenEmbedded-Core (OE-Core)`. You can
 also find examples in ``meta/classes-recipe/kernel.bbclass``.
 
 Here is a reference that shows ``do_split_packages`` mandatory and
@@ -543,7 +543,7 @@ to use. In your configuration, you use the
 variable to specify the format:
 
 #. Open the ``local.conf`` file inside your :term:`Build Directory` (e.g.
-   ``poky/build/conf/local.conf``).
+   ``project/build/conf/local.conf``).
 
 #. Select the desired package format as follows::
 
@@ -637,10 +637,10 @@ Lighttpd, or Nginx), take the appropriate steps to do so.
 
 From within the :term:`Build Directory` where you have built an image based on
 your packaging choice (i.e. the :term:`PACKAGE_CLASSES` setting), simply start
-the server. The following example assumes a :term:`Build Directory` of ``poky/build``
+the server. The following example assumes a :term:`Build Directory` of ``project/build``
 and a :term:`PACKAGE_CLASSES` setting of ":ref:`ref-classes-package_rpm`"::
 
-   $ cd poky/build/tmp/deploy/rpm
+   $ cd project/build/tmp/deploy/rpm
    $ python3 -m http.server
 
 Target Setup

-- 
2.51.0


