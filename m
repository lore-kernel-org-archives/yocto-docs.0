Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A429FC531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 07:11:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18282.1784790711308410338
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 00:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CFRozXzk;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 176BA4E40EFC
	for <docs@lists.yoctoproject.org>; Thu, 23 Jul 2026 07:11:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E02E4602B8;
	Thu, 23 Jul 2026 07:11:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E13A11BD3D29;
	Thu, 23 Jul 2026 09:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784790708; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=26wDDRvLBQRGAsuQk9BYLgq27rRkvP318D9YsTl0kgE=;
	b=CFRozXzkTybaD662Ils4oInx64Bsa+3pmniSzUiCp+0AQmzy7Px+MsffjsbTBEUtAztSph
	2VJBOh+d8cbu5jzbHbRAzECYryWGjKfLwUi6BWNZRdjXnvC2tAKHHXJVgkeYSzjxSPCKdy
	FrV5Yi7InEU12ETULdMbBwI1Iw7dQzkPhDMmGqWpHFutpfJ3yCQpDyvdyYKZOv99dtBPuh
	GsqVnMGpQPsiRuqHKeOnye1zFciE1GOaKVyVc/3r1nE4HWRVBvGxdLNFWFwATTK4/XWu/s
	dwnCduAkhpgCTOL4LHDPwjArLMILMeU8gGch5RohkICCQLcJFaBU1xc3Hep2Xw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 09:11:46 +0200
Message-Id: <DK5RI3HUYURO.275CWPF60RK1O@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <JPEWhacker@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs][PATCH v2] migration-guide: Add guide for converting
 licenses
References: <20260721214707.2129954-1-JPEWhacker@gmail.com>
 <20260722144843.3413389-1-JPEWhacker@gmail.com>
In-Reply-To: <20260722144843.3413389-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jul 2026 07:11:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10116

Hi,

Merged on master-next with:

diff --git a/documentation/migration-guides/migration-6.1.rst b/documentati=
on/migration-guides/migration-6.1.rst
index a49cca270..025b8f709 100644
--- a/documentation/migration-guides/migration-6.1.rst
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -103,7 +103,7 @@ The changes required for the new expressions are as fol=
lows:
    Keep in mind that you can still have a common license file in
    :term:`LICENSE_PATH` and refer to it with a ``LicenseRef-`` license. No=
te
    that when you do this, you will also need to provide a
-   :term:`LIC_FILE_CHKSUM` value to point to your license file.
+   :term:`LIC_FILES_CHKSUM` value to point to your license file.
=20
 6. The generic ``PD`` (Public Domain) license is no longer allowed (since =
it is
    not a valid `SPDX License Identifier`_). Additionally, the meaning of

Antonin

