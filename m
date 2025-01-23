Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98B6C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:33:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.13061.1737646400062408402
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 07:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f/jEyh/j;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E37061BF210;
	Thu, 23 Jan 2025 15:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737646398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5bALl/wQMdqqCRyiB0nH393c4DyGP95MbF3pZnbjnI=;
	b=f/jEyh/jjru6MlLgDIdtBoS+EbowShmZlzL1pkoppYjkJYOd5SBi0Wm/iVxeSmp3SzUcH/
	3RUANR87fB6PO00iTG40/FXVc4QVMuMsNscBCH2UVSlWhHWdNRGxwQMV1NOnQ7kQuoS4aK
	bn4g52BZBT6BpWe0Hvhrzvjpq3X8f4yA+rDp4mCpPuDt4Ogt3uLXCBDtl252pSg9CDW2CW
	umrHidXX/7ENcggZ+udwY0NE6mecLK3pkXxIPEO/cYpjppUzB8DvH9y2ztbJBGX7Jo/f7p
	6GtGuJpOvqF7bvze4cFZlRWchhoafr/0ZCnQLXlli6YaNrh5uW/xjHzk+Acy2g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jan 2025 16:33:17 +0100
Message-Id: <D79K8MV03N7R.30YY4NU4X55R2@bootlin.com>
Subject: Re: [docs] [PATCH] add basic b4 config file
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250123-b4-support-v1-1-03b4a18edfdf@cherry.de>
In-Reply-To: <20250123-b4-support-v1-1-03b4a18edfdf@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jan 2025 15:33:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6162

Hi Quentin,

On Thu Jan 23, 2025 at 3:31 PM CET, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> b4[1] is a very nice tool for mail-based contribution. A config[2] file
> exists to set up a few defaults. We can use it to set the Cc recipients
> to always add, in our case the mailing list.
>
> Because we do not have anything to check for now, disable needs-checking
> so patches can be sent without running b4 prep --check.
>
> Because we do not have any auto-to-cc support (and the implicit one
> using scripts/get_maintainer.pl cannot work for us), also disable
> needs-auto-to-cc so patches can be sent without running b4 prep
> --auto-to-cc.
>
> [1] https://pypi.org/project/b4/
> [2] https://b4.docs.kernel.org/en/latest/config.html
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> I'm wondering if we couldn't add some per-patch check as well, checking
> that the documentation builds for each for example. Could be added in a
> later patch though. Any idea?

I would agree but a docs build already takes a while, so I think a single d=
ocs
build for the b4-managed branch would be enough. Don't know if that's possi=
ble
though.

> ---
>  .b4-config | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/.b4-config b/.b4-config
> new file mode 100644
> index 0000000000000000000000000000000000000000..4f87f61b58519862da44fd9af=
6e6d0018edc7dc2
> --- /dev/null
> +++ b/.b4-config
> @@ -0,0 +1,3 @@
> +[b4]
> +  send-series-cc =3D docs@lists.yoctoproject.org

Why not send-series-to?
This is what we instruct users to do in the readme, and in the contributor
guide.

> +  prep-pre-flight-checks =3D disable-needs-auto-to-cc, disable-needs-che=
cking
>
> ---
> base-commit: 6b44257874858db3aa426d3e84a79c41cb4937a3
> change-id: 20240524-b4-support-d5e749251bba
>
> Best regards,


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

