Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFFBD5CC8F
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:17:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18419.1765876615314369140
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 01:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=05KD088i;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C42EC4E41C26
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 09:16:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B15E6071C;
	Tue, 16 Dec 2025 09:16:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51B411194323A;
	Tue, 16 Dec 2025 10:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765876612; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nNILvmnuiecTKfFiOcqeGYe/KC2zUK4zdF7Djbv5Tt0=;
	b=05KD088i8C3bKFcr+HYYvHIC3fjJuN3piKfNX3PsemvtAFevi0AunnB6nn8YDt3KRuWXhq
	vgBkzNhpRpDvnbkstVk77barH5SNPEKOjtygEKP1yWaA5iz5ph6Sp+vFI6viYl59kkGEHD
	DWlPU6dtaNBuAuVrXNfBr5ftEJRuaJ90LnKXfbOWF6J2qgK/QS1K+AYOc2TT6fyOBsSlJ2
	g55x+8LpwM0scmgyOEAaFnwh9Hktg+nvJMv0YScHQy8s8jj5pcULxlCEaIUCra48ElmA13
	kD8LV9atXsEDdOzs7x+Z4Ih1W5fVWi4ufiOldV6/KtnG5RNLR5vJftukGa8/aQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 10:16:51 +0100
Message-Id: <DEZJ0K8SO4YV.DMIZK58TXWP5@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3 4/5] ref-manual/system-requirements.rst: fix
 AlmaLinux PDF build
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com> <20251212-build-docs-container-tlmgr-v3-4-a45c1ce6d8f7@bootlin.com> <96896a0e-f1fc-45ef-8416-c3fe8af9f71a@cherry.de>
In-Reply-To: <96896a0e-f1fc-45ef-8416-c3fe8af9f71a@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 09:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8278

Hi,

On Fri Dec 12, 2025 at 12:47 PM CET, Quentin Schulz wrote:
[...]
>> --- a/documentation/tools/containerfiles/Containerfile.almalinux
>> +++ b/documentation/tools/containerfiles/Containerfile.almalinux
>> @@ -1 +1 @@
>> -Containerfile.dnf
>> \ No newline at end of file
>> +Containerfile.stream
>> \ No newline at end of file
>
> Any reason for switching the symlink here? In the end=20
> Containerfile.stream is a symlink to Containerfile.dnf I believe so... wh=
y?

Indeed, I was still reasoning like in my previous version of the series, wh=
ere
Containerfile.stream was a separate file. I will switch this locally and me=
rge
to master-next, as I think we've dealt with the other issues.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


