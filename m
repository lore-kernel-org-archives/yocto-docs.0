Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21897D33983
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 13:54:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.52390.1730123671183848708
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Oct 2024 06:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LG9xZQUF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A9BE1C0003;
	Mon, 28 Oct 2024 13:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730123669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGR8IRvocRQcqXDFD7bVdI+iNHsvf7iLwDfpNsSHd3w=;
	b=LG9xZQUFOMbXh3P8fXIWaJtGdNnilxVrjHUDVR5J6RKTdyosiIhdibZcbSAFfogf4W5r/v
	bUlRBS4T+wv4wqynh1KAnujrxoLU43qIiOBkscV+go9hgK/cf9Cb0vP3hDyLWs7JskY48g
	oTLYTzbj+XXJ4tlOW6gwa35+mrWvL6hQGePxs/vJjcgZ+QoFampQuDSwgdnFXqVVK/eqIc
	jdUfMQUdBHr7nx7gTl2kJ/0kM1C78DI3LM8zS3dXvhV7UJytNMsdYF5rwQj5j4/Uy55SGy
	ITqcocqysMH+pDlVTDaR+U1a6a8u7aSORbbD5wPWbckCNMbmFGSHFs0fSzmelg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Oct 2024 14:54:28 +0100
Message-Id: <D57HNKY70WR3.1HM1OVRDY4359@bootlin.com>
Subject: Re: [PATCH v2 0/2] Update the devtool quick reference document
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Quentin Schulz"
 <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241022-devtool-improvements-v2-0-9d2ebf9c5311@bootlin.com>
In-Reply-To: <20241022-devtool-improvements-v2-0-9d2ebf9c5311@bootlin.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Oct 2024 13:54:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5602

Hi Quentin,

On Tue Oct 22, 2024 at 10:37 AM CEST, Antonin Godard wrote:
> * Refresh command outputs from `devtool --help` and `devtool add
>   --help`.
> * Add some brief details on the subcommands that were previously
>   undocumented, and the more recent commands that weren't documented
>   yet.
> * The remaining subcommands are still present in devtool, so leave them
>   as-is.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - configure-help: Give an example of what the command will output for.
> - ide-sdk: mention that like deploy-target an ssh server must be running
>   on the target.
> - Link to v1: https://lore.kernel.org/r/20241017-devtool-improvements-v1-=
0-2bacc656fe39@bootlin.com

What do you think of this v2?

I took note of your suggestions and added them here.

Thanks in advance,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

