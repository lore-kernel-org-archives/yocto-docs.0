Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8134D5E14C
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 13:14:15 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22132.1765890853490863361
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 05:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=noSoUP2s;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 12151C19D32
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 13:13:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80A866071C;
	Tue, 16 Dec 2025 13:14:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD26911943531;
	Tue, 16 Dec 2025 14:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765890851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dAwceTvtIyzbbZyD+uc2uGnENFHiZDha29AX7TewzKU=;
	b=noSoUP2s/LSIFY8iIGCDl/74pFGLx+2+59KSQeKyDDCiTSl96RgzcOPyFnTL9SaUUPfJe4
	oPoDrui3YRr1rsQOTR2ZV1JIKKxDrAw0RVO99gDvRWxqYMZ+oODgxRK0R7Wooqp7bhX9yV
	f1c9vMNfhwW6HcBGdjj7Tk8LPjbNACGBE8oDUjSPX3jOzlb2SR6IN4327g8JmfXF5u9fc4
	lXBI52bYyZpfcNSxWMLXOY3FEkA77O3wqR/qdfmGUiEj9DUhHL7nD0F/C5kWONrbRZIooQ
	oVmz1BNBarUpd+cM6lRLTNyc5cjFWSHrCfUBwxpC3uqJF4hnqk3HKADCA+ATFQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 14:14:08 +0100
Message-Id: <DEZO28AYNP0Z.21MXJG3T9YF8O@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] ref-manual/variables.rst: document the
 IMAGE_CONTAINER_NO_DUMMY variable
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20251212-image-container-v1-0-fb6586d06813@bootlin.com>
 <20251212-image-container-v1-1-fb6586d06813@bootlin.com>
 <1f26c158-7fdc-4b2a-b841-8a66d0344b25@cherry.de>
 <DEZL0HHNAFLA.YE9GBFBU3LZ3@bootlin.com>
 <bfb7bfd2-1d86-4e05-8ff7-c86b16ab0261@cherry.de>
In-Reply-To: <bfb7bfd2-1d86-4e05-8ff7-c86b16ab0261@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 13:14:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8287

Hi,

On Tue Dec 16, 2025 at 12:01 PM CET, Quentin Schulz wrote:
[...]
>  From patch 2, image-container isn't to be inherited manually, but=20
> IMAGE_FSTYPES needs to have "container" in it. Though the end result is=
=20
> the same... not sure it's worth the complexity in the docs. Or maybe=20
> just remove everything after "image recipe" (keep the paragraph below=20
> here though...). Or say "by adding "container" to=20
> :term:`IMAGE_FSTYPES`"? See also first sentence in this suggested=20
> section ("When an image recipe inherits..."), probably would need the=20
> same clarification.

Yes, just realized this=E2=80=A6 I'm reworking the class and variable docum=
entation, to
say that IMAGE_FSTYPES is enough to use this class.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


