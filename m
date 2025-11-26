Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019E5D10F44
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12333.1764162011071467115
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=fPb10hpI;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 94ECE1A1D54
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66D2460721;
	Wed, 26 Nov 2025 13:00:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2259E102F08EA;
	Wed, 26 Nov 2025 14:00:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fa3IMirSg2PYs3zxhv31exIT8vTsCIRSfpYCbBgR/SA=;
	b=fPb10hpITqivsapk87ujqmrNFMGsQXy4+UzxdkBiyG0s0fhOoFtYE7N5wv9/kRpxEYO9Wn
	sjCj2m+jQGOxK02DWMsmBHooCot5L08vAv7RgoLt/0eIgrrC8f85u07C+SD1f2H/0aC/pH
	TbH7PKLvu2WAt7fooSXMSsnLhEkCAqT3WPuENKJEBaOeFQ+zoC6edNXExa86/RYPfSvV8u
	FhBQX6sRFnyohT/g5iB0VejYJrUdHf0kJ2bLB7pgprVFqlJGnl8wRmYws+UF2cX/Oorgkz
	qneEvh3b3shvH9CFoUotNUqDrZ0q9S+6Xhtg1HciArvfH7JsNxGGKQ1R/MfKWw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 4.0.31
Date: Wed, 26 Nov 2025 13:51:23 +0100
Message-ID: <176416145968.617433.1554200021595894890.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114080240.2521216-1-chee.yang.lee@intel.com>
References: <20251114080240.2521216-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8129


On Fri, 14 Nov 2025 16:02:40 +0800, chee.yang.lee@intel.com wrote:
>=20


Applied, thanks!

[1/1] migration-guides: add release notes for 4.0.31
      commit: 992d0725e8b4fdcdc2e9a101ce51ebef94a00112

Best regards,
--=20


