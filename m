Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED0ED10F53
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:56:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13332.1764165401567474864
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=l8E+Nnv2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 796EF4E418EF;
	Wed, 26 Nov 2025 13:56:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48E0260721;
	Wed, 26 Nov 2025 13:56:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12AD9102F08EA;
	Wed, 26 Nov 2025 14:56:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764165398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SleUzdSmeszvPO1pR1cpQIlCfsYfgGeIR3NJ02HUdfY=;
	b=l8E+Nnv2uzfIasRAsvd29Q9RpdKAlSiPlPqVmw3x0bhHtD+oCMalzBZ5+SKSGoxGrn6wJn
	SFdW/AS9yGUun8LNTp0Yx8kXUT2y9RclT19JCihOXCDcY164YhaEtAfPF5app2pC7xstPl
	spRDfe9LBDBCe9TrMB2bLu+PRo3y6CXNfsLJ3Uo+JuuKE5xmPIQa27h/JWWkNQB+1OKbVs
	mZ9TA0ZnKXJAVrmAD++LnEUx8xtWbCkIERQElPyyzCNTg8k52zgXL0JQRcLCQA+rQOvT46
	Yy5l9T6ub0eJ5gf+UqCHaYsoMOenbjTe1YlcwwR7ErGDjAuTtpLhA0JTtvm1Xg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 14:56:36 +0100
Message-Id: <DEIOFUTRM2V0.JIF1QZ9G5L8Y@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <stondo@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v7] ref-manual: Document SPDX 3.0.1 variables
Cc: <peter.marko@siemens.com>, <adrian.freihofer@siemens.com>, "Stefano
 Tondo" <stefano.tondo.ext@siemens.com>
References: <20251126134546.63941-1-stondo@gmail.com>
In-Reply-To: <20251126134546.63941-1-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:56:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8144

Hi,

This applies.

I commented on the compression note in v6:

> > +      .. note::
> > +
> > +         SPDX 3.0.1 JSON files are not compressed by default, unlike t=
he
> > +         tar.zst format used in SPDX 2.2. You can compress the output
> > +         files manually::
> > +
> > +            zstd core-image-minimal-qemux86-64.rootfs.spdx.json
> > +
> > +         This typically achieves 94-97% compression ratios.
>=20
> Sorry, my previous comment was probably not clear. I thought you used a
> *built-in* way to compress the resulting JSON file and that it would be w=
orth
> mentioning it here.
>=20
> So I would remove this note, and perhaps contribute to OE-Core to add sup=
port
> for compression of this file, and then document that (if it doesn't exist
> already).

So I would simply remove the compression note.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


