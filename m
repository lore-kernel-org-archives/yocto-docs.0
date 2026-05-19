Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3469BCD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 08:46:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16904.1779180395626675278
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 01:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hYDZvqzT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8752E4E42CF0;
	Tue, 19 May 2026 08:46:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B5BB606E9;
	Tue, 19 May 2026 08:46:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DD7E11AF87C0;
	Tue, 19 May 2026 10:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779180393; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zm4xDx1XyqkwFwiyIkI1Oo2OcfXRKyJZEdcD8HxoFZg=;
	b=hYDZvqzTZfyZ8btVC38eDnKdNNIFkLqJCzeWWCz9J4/I8CdvxMp53Z5K8026QOntfgw7d8
	LTBsLuFhIrWrCBKnWyTXIeyJ+y637f5tsORVIgA0s0J0fPQVYAJIuBkRPS1xxRs1bMaVKC
	+NLZ8sVHkh1eWidUvKNah+ocDlfGz+wE7lgihFOgY3f6G26s/cphdxa8e/yi/vnV37/Yg+
	xGcm5xPDCH/W4deSmVBOQct2oxy8NG7K1FmyuU+TfOl0T8T4uD4w5SSgcmE10FdwIM0+4f
	pgQ5r9g+PxwGXDTZunWiDToctk+yj4WGFeGm2tU9c30VXBIL2DaY1mM35yR0fQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 10:46:31 +0200
Message-Id: <DIMIT89CT2DQ.HEFWCBFNO54V@bootlin.com>
Subject: Re: [docs] [PATCH 2/4] release-note-6.0: update several section
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
References: <20260519011715.972400-1-chee.yang.lee@intel.com>
 <20260519011715.972400-2-chee.yang.lee@intel.com>
In-Reply-To: <20260519011715.972400-2-chee.yang.lee@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 08:46:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9483

Hi,

Merged with the following formatting/wording fixes:

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documen=
tation/migration-guides/release-notes-6.0.rst
index e539ebf38..6f8801012 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -125,7 +125,7 @@ New Features / Enhancements in |yocto-ver|
       analysis of recipes (using the recipe SBOM, meaning building the
       software provided by the recipe is not needed), which uses the
       `sbom-cve-check <github.com/bootlin/sbom-cve-check>`__ tool internal=
ly.
-      This also obsoletes the cve-check class.
+      This also obsoletes the ``cve-check`` class.
       (:oecore_rev:`e2518b1eaabef13c9f8d44b52b8ec9d4dd4ed916`,
       :oecore_rev:`00de455f8d3aeca880129d23e8cfb7e246404699`)
=20
@@ -192,9 +192,9 @@ New Features / Enhancements in |yocto-ver|
=20
 -  Global configuration changes:
=20
-   -  Changes in DISTRO_FEATURES default values and how DISTRO_FEATURES &
-      MACHINE_FEATURES are provided, see :doc:`/migration-guides/migration=
-6.0`
-      for more information.
+   -  Changes in :term:`DISTRO_FEATURES` default values and how
+      :term:`DISTRO_FEATURES` and :term:`MACHINE_FEATURES` are provided, s=
ee
+      :doc:`/migration-guides/migration-6.0` for more information.
=20
    -  ``base-passwd``: Add a ``clock`` group as `systemd` version v258 int=
roduces
       this group to `enable applications like linuxptp to open clocks with=
out
@@ -762,21 +762,20 @@ New Features / Enhancements in |yocto-ver|
 Known Issues in |yocto-ver|
 ---------------------------
=20
-Referencing an unset variable in DISTRO_FEATURES causes DISTRO_FEATURES_NA=
TIVE
-and DISTRO_FEATURES_NATIVESDK to be set incorrectly. The leads to confusin=
g
-errors, such as
+Referencing an unset variable in :term:`DISTRO_FEATURES` causes
+:term:`DISTRO_FEATURES_NATIVE` and :term:`DISTRO_FEATURES_NATIVESDK` to be=
 set
+incorrectly. The leads to confusing errors, such as:
=20
-  - Nothing PROVIDES 'libseccomp-native'
+-  ``Nothing PROVIDES 'libseccomp-native'``
=20
-  - Required build target 'glibc' has no buildable providers.
+-  ``Required build target 'glibc' has no buildable providers.``
=20
-To resolve these errors, ensure that all variables used in DISTRO_FEATURES=
 are
-set. Variables may be set to an empty string if not needed.
-
-A fix for this issue is in progress and should be included in Yocto
-Project 6.0.1. See :yocto_bugs:`Yocto bug #16275 </show_bug.cgi?id=3D16275=
>`
-for further details.
+To resolve these errors, ensure that all variables referenced in
+:term:`DISTRO_FEATURES` are set. Variables may be set to an empty string i=
f not
+needed.
=20
+A fix for this issue is in progress and should be included in Yocto Projec=
t
+6.0.1. See Yocto bug :yocto_bug:`16275` for further details.
=20
 Recipe License changes in |yocto-ver|
 -------------------------------------

Thanks,
Antonin

