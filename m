Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD75C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:47:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30970.1787816849140186098
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 00:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PkcC54fF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5715D1A185C
	for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C4BF602B8
	for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D71711C78383;
	Thu, 27 Aug 2026 09:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787816842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bBqDS7V6ig3/4qNJTGikIrilU/nyJXYfuTOdVbIpEJk=;
	b=PkcC54fFGx74UbHZiFqCRAKF+qOliLV/SP8dpDq+FwBf4cmdykgetcUDfQoeFujH6EhQTe
	zRrgPsySiwYl9KhNttMx5ZUWDDTmZCe4afDv+OfAgMBexTjJ6nHkFSd1vny4w6NWKIr4ED
	LrojlniDkv99ULDJKpF0w/0I/v3XdAEs94nOKPkV6S2/DOJzq3bhG2fUbIlQQif4RPY3t9
	y0+/3u+xZt9CBDNIR4SnpKFAd9sDSpWNeum38Uv/HjUE4HSMYkGGQrAvVLrTkrtFl+5brg
	tY/ek8plKN1DvQ69R/gFlQZ0eWd8tSQ1U0jFNZBLWfPbzrKBlGWFhWDW7lmIuQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Aug 2026 09:46:58 +0200
Subject: [PATCH 2/4] docs-wide: fix USERMOD_PARAMS -> USERMOD_PARAM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-missing-variables-v1-2-7ec8b525b23b@bootlin.com>
References: <20260827-missing-variables-v1-0-7ec8b525b23b@bootlin.com>
In-Reply-To: <20260827-missing-variables-v1-0-7ec8b525b23b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3579;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ThO6JrfiD9tOK6eopUuBQlbL9zK6o+6Lj+827vmRRoQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqj+t/kq6x83EnLy5wltAWTwMTBAZ2PEpNQuhve
 3Mfw5EoNYSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCao/rfwAKCRDRgEFAKaOo
 NgcuEAC99anqmrZtfUQxbvZ3FRUIXxAVJABgDSZaxGOCH8BoyTobikkz18l8Plh7BZEKsJCxVlM
 0TnHM91JUO7to4l2L6ZIprGKzj8YX/mmjg/Q4syNmAHBcnagHS7zz+hfECo2jmb8c/Z/ZCnFutI
 HZ0s2HUx6Ja7RtrjxggPuqHVbWBkHw7c/Aur55d17u5WoDeN1dt/QlThNkh5vZXpLRbPCPIVh4x
 jzpaLbDa8s5YuvlCkIDNM7dSVkrNyaMHZHNiRjMbaRD/TayGbyZWChU+SdI8A+s9WNktrXDCBZ4
 PDj0k0UAfqC+cyhzmHEh1fZGj/EHCjSFRw5QYZySVuvRlx4mKHM4Pts/Nl1e1IvHyFiu1ZmKw3v
 qidBCY9cAnIrML4VCUCeCrdf+WxUx+gnf/BU3mOtbJLzKTEcIvGaeUEI6WJb3n2eLF3svWj607F
 w0FBJE6oZYNxejUnZeEACc2SMcP4F9VTk/JW556ZoxIg6/0wSoHxKO/t3mCyvFb999cpQdqYOpq
 2BR8Cex1XadDv+ACJnfK5Hb29OnZ5iDpZHITqG1F7JUIHMOY8qTxpSKKGttKTA1/jBh2hgfs0Pb
 bWoN79zFiZHpWAGQ5LZvPV+jzTMe+duZ3IYQMLF/oO0bCaacSc8/rW9gy9Qzb2++vjJeEBNmqDa
 b2krVV3RcJwG6sw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10374

There is a typo in the documentation: the variable is named
USERMOD_PARAM, not USERMOD_PARAMS.

Fixes: 85eeb215978a ("ref-manual/variables.rst: document the USERMOD_PARAMS variable")
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.1.rst     | 4 ++--
 documentation/migration-guides/release-notes-6.1.rst | 2 +-
 documentation/ref-manual/variables.rst               | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/migration-guides/migration-6.1.rst b/documentation/migration-guides/migration-6.1.rst
index 025b8f709..f0e0ce14c 100644
--- a/documentation/migration-guides/migration-6.1.rst
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -36,7 +36,7 @@ See :ref:`all supported distributions <system-requirements-supported-distros>`.
 
 .. _ref-migration-6-1-groupmems:
 
-useradd: replace :term:`GROUPMEMS_PARAM` assignments to :term:`USERMOD_PARAMS`
+useradd: replace :term:`GROUPMEMS_PARAM` assignments to :term:`USERMOD_PARAM`
 ------------------------------------------------------------------------------
 
 The ``groupmems`` command is removed from the ``shadow`` recipe starting from
@@ -44,7 +44,7 @@ version 4.20. The same functionality provided by ``groupmems`` can be achieved
 with the ``usermod`` command.
 
 Assignments made to the :term:`GROUPMEMS_PARAM` variable can be converted to use
-:term:`USERMOD_PARAMS`, by replacing::
+:term:`USERMOD_PARAM`, by replacing::
 
    GROUPMEMS_PARAM:${PN} = "--add user --group group1; \
                             --add user --group group2"
diff --git a/documentation/migration-guides/release-notes-6.1.rst b/documentation/migration-guides/release-notes-6.1.rst
index 021af5d57..fc7fd279e 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -99,7 +99,7 @@ New Features / Enhancements in |yocto-ver|
       several recipes to replace ``${nonarch_base_libdir}/firmware``
       (:oecore_rev:`2b75c7ba5e3aa6fc57d7b4afe59e2277b4d87de1`)
 
-   -  :ref:`ref-classes-useradd`: Add support for the :term:`USERMOD_PARAMS`
+   -  :ref:`ref-classes-useradd`: Add support for the :term:`USERMOD_PARAM`
       variable, acting as a replacement of the :term:`GROUPMEMS_PARAM` variable
       (:oecore_rev:`b8da733ab12c64503a353d5ceb2eb63fed95d851`,
       :oecore_rev:`cec67e24ac94554e092f8ab18b42e09b4feba77e`)
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ae9cbfddf..a806f907e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3956,7 +3956,7 @@ system and gives an overview of their function and contents.
       ``groupadd``, see :manpage:`groupadd(8)`.
 
    :term:`GROUPMEMS_PARAM`
-      Deprecated in favor of :term:`USERMOD_PARAMS`. See
+      Deprecated in favor of :term:`USERMOD_PARAM`. See
       :ref:`ref-migration-6-1-groupmems` for more information.
 
    :term:`GRUB_GFXSERIAL`
@@ -12599,7 +12599,7 @@ system and gives an overview of their function and contents.
       Additionally, you should also set the
       :term:`USERADD_ERROR_DYNAMIC` variable.
 
-   :term:`USERMOD_PARAMS`
+   :term:`USERMOD_PARAM`
       When a recipe inherits the :ref:`ref-classes-useradd` class, this variable
       specifies for a package what parameters should be passed to the ``usermod``
       command if you wish to modify a user when the package is installed.

-- 
2.55.0


