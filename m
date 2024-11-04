Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90806D111BC
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 08:08:31 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.52929.1730707706621061046
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 00:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XFbgim9a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71802240007;
	Mon,  4 Nov 2024 08:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730707704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGdxjSy2cr7yNeZF2YA41GPKxBcPAFiqjfCLFz9tA5k=;
	b=XFbgim9aMHo5PKHGYL/ZjTJB5o6/a47qT2aRf1Cs1I5HkLX4ywvsv4F618a/bAHb2ahGDl
	S0IZl5PnQeWs4NmR2pm/clXgq/Kqk27yjVxKvJ1GegyefO4WEjicQ46u6ahj2uBHU7CZSy
	qlr2d7JpKJZ5x3Sok0WAzJe386OMBTKIy0lMCGJY8QZYYhK447KpywynmoPqKfWeZPWtD0
	cSdPCYIeGh6Lovw4dwrS8s2jxj3jdTTN9lwbRkUe6xNwvBZivPkWCxNLFkNKmIvyekDYUu
	oTYyebaZW3Q3jwH8XUkMgz2je+m3wWEuxOwmLjX1HTNJrXHegzg1Cp2cle0c7g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 09:08:24 +0100
Message-Id: <D5D8OF2L37VT.22HW45UY464VB@bootlin.com>
Subject: Re: [docs] docs.yoctoproject.org appears to be broken
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Mark Hatle" <mark.hatle@kernel.crashing.org>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <daa37959-b3cd-4cd5-a6a6-e7c3814ec5ae@kernel.crashing.org>
In-Reply-To: <daa37959-b3cd-4cd5-a6a6-e7c3814ec5ae@kernel.crashing.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 08:08:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5645

Hi Mark,

On Sat Nov 2, 2024 at 8:47 PM CET, Mark Hatle wrote:
> I was searching for the documentation for the NVD API KEY when I noticed =
that I=20
> wasn't able to switch to different versions of the document.
>
> https://docs.yoctoproject.org
>
> Then try to switch to 'Unable (dev)' nothing happens.
>
> Going to https://docs.yoctoproject.org/dev/ lets me review the 'dev' docs=
, so=20
> the docs themselves are there, it's only the selection that appears to be=
 broken.
>
> --Mark

Thanks for reporting that, I'll try to see what went wrong there.

Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


