Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22801F44879
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158229.1775832231305827240
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=12dB7nsz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D6B09C5C1A5
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA189603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 207FF10450078;
	Fri, 10 Apr 2026 16:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832228; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mxMeFJAj5ukRv5w99mgSGFa2d3s/CJuFsdhW/YJX+7c=;
	b=12dB7nszBvxys9SEz01t5k19zmXUlDGj0JiRPxqGtE2Tbt0I2uv2LqPnCDFPQbeeYJWJfK
	VmQn1OrEaB5cwtNAb9Ins9VVIqMnf+7y3EIw9ZcoMVF/ACe5wCZmbZI/5e9qTqWdYYYinV
	oaxnDwYjzDh8lH1LBKQuzM57sqY+uoGIzB3K8ckHfnGNQPsJ1iPjcWg4IJPSAHw45THsu5
	PNB4fhPmlenF3G00VRTRiWEQ8BXWsBPUK2hVNukVwsJorTumhvcMMsoXUeLtuTWo99NZno
	/jyQAoVL/9OgmZGSaElNVdjpTSKRZ49L9AEUkQTZ2BoiSQGce3uQo0MMqjUJ4Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:42 +0200
Subject: [PATCH 18/18] migration-guides/migration-6.0.rst: tidy up the file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260410-second-release-notes-6-0-v1-18-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2869;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=V4TY6+TVC3kWkbvjnWvLl0MEjAzUe143LK52bAt5sQo=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGnZDJmjD81/Os0l3GVHuS2OzMiGLmQMpC+ODpxAlf0qGC4vx
 IkCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJp2QyZAAoJENGAQUApo6g2+RsP/0gp
 H6aemlBlZmNOQGGSuIAXd+nqoSRXTnfyTao7lUYAULgQ6Z90O6Feqia62uHJNdlCWodfTRQWvSU
 48IDqlX5kHaOJ4qS+XcLTIL5G3nKalmRbdPI0J/9hPMzPpzxIvL6o1CsRl0YBRWQi0gZDEFR1ZK
 n9Odly4kVPwa2q3q6dbj7DMqjyP+74gckMJ2F3YsrPrJHAcyj+qZRWeoBe4crIver4ZozM4tzTX
 XjmpL6OiBDTlJ4YLeFE9/1lAspR/jokQv4iHwYTUVuds2InGh31CGPCbBipoAJcJqwP53PZycer
 XHdVNPo71lFh86O+9E5EB7WYWpcHJkIIWmoZlqi5rOlNzY/nE8y9eI+SyGIRd7rdMaJX8v2Sslr
 iVXkLqudlAQSpUVO+SrOgxT43RZ5HjtyqrWBEigFtXmYfzwV4nrdymY8DfZM8ApWKxeVJPIBCi6
 pj1Wq+Ihv0Yo65GSihMmP1k9UGtKh9akGFjiXAPjD0pq7OMM5TDublX1B27ojRPtcsCDZL3Wb82
 emHZ/P5j1nTp7+BiY3Li0kBDLZNOM7bFPAyB+usJY5UJhXfQAMfc2iW7r3aGayX91r3lFP16Wbo
 gW+Zy1fLsYTKnbli4dn4tfZSAfkyRa31yHkn/hO8N9d5/Ncm8Bo/iZy2quvATDtywlGOgmK7VHx
 YpdPD
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9246

Fill in the missing pieces of the file, remove empty sections, and make
the "Support for SysVinit compatibility in systemd was dropped" its own
section as it was alone in "systemd changes".

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.0.rst | 32 +++++++-----------=
------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documenta=
tion/migration-guides/migration-6.0.rst
index 8008c547d..42c688a89 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -30,7 +30,7 @@ See also the list of new features and enhancements of t=
he previous releases:
 Supported kernel versions
 -------------------------
=20
-The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
+The :term:`OLDEST_KERNEL` setting is 5.15 in this release, meaning that
 out the box, older kernels are not supported. See :ref:`4.3 migration no=
tes
 <migration-4.3-supported-kernel-versions>` for details.
=20
@@ -40,11 +40,16 @@ Supported distributions
 Compared to the previous releases, running BitBake is supported on new
 GNU/Linux distributions:
=20
--  XXX
+-  Fedora 43
+-  openSUSE Leap 16.0
+-  Ubuntu 26.04 (LTS)
=20
 On the other hand, some earlier distributions are no longer supported:
=20
--  XXX
+-  Fedora 39
+-  Fedora 40
+-  Fedora 41
+-  openSUSE Leap 15.5
=20
 See :ref:`all supported distributions <system-requirements-supported-dis=
tros>`.
=20
@@ -348,14 +353,8 @@ For example, here is the content of the :term:`OpenE=
mbedded-Core (OE-Core)`
    =E2=94=9C=E2=94=80=E2=94=80 sdimage-bootpart.wks
    =E2=94=94=E2=94=80=E2=94=80 systemd-bootdisk.wks
=20
-Rust language changes
----------------------
-
-systemd changes
----------------
-
 Support for SysVinit compatibility in systemd was dropped
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+---------------------------------------------------------
=20
 Support for the :wikipedia:`SysVinit <UNIX_System_V>` compatibility in
 :wikipedia:`systemd <Systemd>` was dropped.
@@ -371,14 +370,6 @@ Users are advised to switch to one init manager or t=
he other entirely.
=20
 See commit :oecore_rev:`d9ec9e20eebc062d084dd76b59d665994e0cb51b` for mo=
re information.
=20
-Recipe changes
---------------
-
-Removed variables
------------------
-
-The following variables have been removed:
-
 Removed recipes
 ---------------
=20
@@ -422,11 +413,6 @@ The following classes have been removed in this rele=
ase:
 -  ``oelint``: remove as most of the checks done by this class are done =
in other
    areas of code now, making this class obsolete.
=20
-Removed features
-----------------
-
-The following features have been removed in this release:
-
 Miscellaneous changes
 ---------------------
=20

--=20
2.53.0


