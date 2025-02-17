Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2BDC021A4
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 09:19:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.47336.1739783970925577910
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 01:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y6DxJHqc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAE3F431ED;
	Mon, 17 Feb 2025 09:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739783969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLlRvdbz0QvDYw8QYRQlw+EAETeE12gFuv6c9uKzeMU=;
	b=Y6DxJHqcmGBjxzaB+losbv6Bt+xJ5CduJi6XbvD7lllnWFAuW+zDuDJiJWwaNDNBv1CL8h
	PyxOB84mu1U7ldFbLfQQhMCMDDp6FdB2CogwfzYsRG+UucBSuSC80QMCv0hN/KEEyPry0D
	tPYHJkek2fXTMKRvQw3TbR8HUTHXxqryI2I4psL8dkEpq7PVWRL2U6ZkKMCwRECc31Ghyo
	gD3jiYnQGuwzoAALha802uAtSR863dB6IR9UsdW0qtgRqnLbuUmn4Esp+Zaf/6Oo0vuXOM
	lFW2tDeOydTS5MlC1xcAeXB86SJ/uvdex2NmneYNUMQrLmkza33y5ktdaotNzg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Feb 2025 10:19:28 +0100
Message-Id: <D7ULY1H4W9AB.2T2VDW0HG52PR@bootlin.com>
Subject: Re: [docs] [PATCH 2/2] migration-guides: cover FIT_UBOOT_ENV
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250213220405.3920122-1-adrian.freihofer@siemens.com>
 <20250213220405.3920122-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250213220405.3920122-2-adrian.freihofer@siemens.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkedtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedvueetgeektefgjedthfffhfejudfhtedugeffvdetjeehffeiteduhfehffeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhpr
 hhojhgvtghtrdhorhhgpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 09:19:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6374

Hi Adrian,

On Thu Feb 13, 2025 at 11:04 PM CET, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> Add a hint for users using the UBOOT_ENV variable and the
> kernel-fitimage.bbclass.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/migration-guides/migration-5.2.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documenta=
tion/migration-guides/migration-5.2.rst
> index de2ea773e55..e945e17a9df 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -182,3 +182,7 @@ Miscellaneous changes
> =20
>  -  :term:`ZSTD_COMPRESSION_LEVEL` is now a plain integer number instead =
of a dash-prefixed
>     command-line option (e.g. it should be set to ``3`` rather than ``-3`=
`).
> +
> +-  :term:`UBOOT_ENV` is no longer handled by the ``kernel-fitimage.bbcla=
ss``.
> +   There is a new variable :term:`FIT_UBOOT_ENV` which is supposed to be=
 used
> +   for adding a U-Boot script to a ``fitImage``.

I'm confused. If UBOOT_ENV is no longer used/handled, why did you document =
it in
your previous patch? :)

If I understand this correctly, UBOOT_ENV is only handled in the u-boot rec=
ipe,
whereas FIT_UBOOT_ENV is handled in the kernel-fitimage class? Maybe rephra=
se
your sentence, so it doesn't seem like UBOOT_ENV is deprecated

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

