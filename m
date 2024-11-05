Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B24BD2B922
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 13:12:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.17703.1730812342566942961
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 05:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZFuf0PIc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDA22C0002;
	Tue,  5 Nov 2024 13:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730812340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZpX1pnMNgkij2RnNijW6EwMxJIB8EEQhoLd/nWhYrI=;
	b=ZFuf0PIcNmWLQORDsBax6lf86U2+C8AQ8l8GX/yHUUIoFubfBNtYyO1LXpNopgYQhC43gO
	e+Dy1QQnd1Jwo/8lMnCleiult6gCRM/wMISgzbH6WwblGySgRtSWDhw393ieW98Qq7KFTZ
	7zwbbNzA4vw3E52GM3eNMd9aovDifIWOmeYpOapH/wg3ul6zYNjQs4i6swZrwFHhTu3RJT
	J+TPfcby/Z5dqstQ9Az8Wo67XVCeag2drZzExoTYFl1Vnb/Z9CctNzxtw93uv90licLVJO
	ds2wQJ8eBbXOcvEvBIudHp2QXj5kiBCprKq0d4Dn6UYqNLpx0w9aaqKFtDNPNA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Nov 2024 14:12:19 +0100
Message-Id: <D5E9RNX36GZW.10MSD4UHMX2LR@bootlin.com>
Subject: Re: [docs] [PATCH v2 0/2] Add bblock documentation
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Julien Stephan" <jstephan@baylibre.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241104-add-bblock-documentation-v2-0-74a8a2cff0f8@baylibre.com>
In-Reply-To: <20241104-add-bblock-documentation-v2-0-74a8a2cff0f8@baylibre.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 13:12:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5678

Hi Julien,

On Mon Nov 4, 2024 at 4:59 PM CET, Julien Stephan wrote:
> Hello,
>
> The main purpose of this series is to add some information for the user
> the use VALE and SPHINXLINT on a subset of the documentation.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
> Changes in v2:
> - Fixed various typos reported by Ulrich =C3=96lmann  and Antonin Godard
> - Split series: bblock documetnation was sent into a separate series
> - Link to v1: https://lore.kernel.org/r/20241031-add-bblock-documentation=
-v1-0-32b89093bbda@baylibre.com
>
> ---
> Julien Stephan (2):
>       README: add instruction to run Vale on a subset
>       documentation: Makefile: add SPHINXLINTDOCS to specify subset to sp=
hinx-lint
>
>  documentation/Makefile | 23 ++++++++++++-----------
>  documentation/README   | 18 +++++++++++++++++-
>  2 files changed, 29 insertions(+), 12 deletions(-)
> ---
> base-commit: 9563855ccd92e21fb6f8320c96a3a83e115c947e
> change-id: 20241031-add-bblock-documentation-4a5f8cf9c6d2
>
> Best regards,

Looks good, thanks, this will be useful!

For the series:

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
Tested-by: Antonin Godard <antonin.godard@bootlin.com>

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


