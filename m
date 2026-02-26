Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9785AFD8FCE
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 15:38:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72915.1772120282498364064
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 07:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rnYww7wt;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3923C1A156C
	for <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 15:38:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3A635FDEB
	for <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 15:37:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1A4B103693E7;
	Thu, 26 Feb 2026 16:37:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772120279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XCcb7lJoWxI/OSXlYbYjQL/oYZe5FGdKbW8Rlj3trY4=;
	b=rnYww7wth+5aqR5OMu24SGBXgg7resTM9gXCbHQaa8F1il2NCGp4uFnebOdpVRSiiJJbSo
	fHS7MqAadqatvgxNhd686dGTjKuXaXKAmBbFYvhWZM3WnFyxfzKCVyR2eQaN1jAkh6Z/EV
	GlRV1GjH5ueN63Cv7UTXUwiQINc6YMNCIISfzToHLO7Fm77LbZlPmk2CZJ5VwoAPZ7BIkB
	0c0WX5yeyblBeZ8LoSzqowThE+to19ntjVe1fq8zHuc/AknNUmAoDYk1s/IvrWP/ilbqYp
	Ugq2Ze5eFP0UBksY5m0k6iwejVz62iCa24qv5FEJytG4nafQKljjooUt79rk9Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 16:37:57 +0100
Message-Id: <DGP07KSCENHB.3DRO1OJWUBQLZ@bootlin.com>
Subject: Re: [PATCH v2 1/3] tools/fetch-releases-json: add to fetch and
 format releases.json
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Antonin Godard"
 <antonin.godard@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <docs@lists.yoctoproject.org>
References: <20260226-releases-json-v2-0-6ba4a3b37b24@bootlin.com>
 <20260226-releases-json-v2-1-6ba4a3b37b24@bootlin.com>
In-Reply-To: <20260226-releases-json-v2-1-6ba4a3b37b24@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 15:38:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8999

On Thu Feb 26, 2026 at 3:00 PM CET, Antonin Godard wrote:
[...]
> diff --git a/documentation/releases.json b/documentation/releases.json
> new file mode 100644
> index 000000000..f12cbbaa2
> --- /dev/null
> +++ b/documentation/releases.json
> @@ -0,0 +1,623 @@
> +[
> +  {
> +    "series_version": "6.0",
> +    "original_release_date": "",
> +    "latest_release_date": "",
> +    "release_codename": "Wrynose",
> +    "latest_tag": "",
> +    "releases": [
> +      "6.0_M1"
> +    ],
> +    "status": "Active Development",
> +    "download": "",
> +    "series": "current"
> +  },
> +  {
> +    "series_version": "5.3",
> +    "original_release_date": "2025-11-26T17:14:07+00:00",
> +    "latest_release_date": "2026-01-09T15:00:43+00:00",
> +    "release_codename": "Whinlatter",
> +    "latest_tag": "5.3.1",
> +    "releases": [
> +      "5.3",
> +      "5.3.1"
> +    ],
> +    "status": "Stable Release until May 2026",
> +    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto=
-5.3.1",
> +    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/=
yocto-5.3.1/RELEASENOTES",
> +    "series": "previous"

Sorry, I sent a modified version of this file that I was using for local
testing, and forgot to revert. I will fix this in the next iteration or whe=
n
merging.

Antonin

