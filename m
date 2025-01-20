Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696AAC02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 09:09:52 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.33179.1737364185865027843
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jan 2025 01:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ivp63V4T;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C49381BF20D;
	Mon, 20 Jan 2025 09:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737364184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MqmsJvSrthvF5e/Q1WVSkRvcAYf2zXBevycB+BntJ94=;
	b=ivp63V4Ty8/uSwud5PXB7/7MRWobEj6TYF1GMYbjXL2l6tH0rqHEYxRDKjIBA1Y2wl98ML
	jSqHWiCMHQrm0TBCLVF5V0fvH8jGnqJawmSLK5H+ky+BsonsQ5RCpZPo4V7BBmsDkvxHBe
	0YX+h2cDsbmq0Gs/TaUbumcpftdzuyeQTw1RXSmLqxHbv9lQqn+QElA//OqqNqMlBYjHOk
	8n4LC8vFYzaisZiOyPwCuo+PQfdkbLKYlqa15wRjbOyYO5iQUi0jBivv8kUt6ydezIhVTs
	bBLr3FieBcbuEQK5RNpLYKlvEkSRl0AKucol4x5EslEqa52/F5OEEkmjyZkXMw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jan 2025 10:09:43 +0100
Message-Id: <D76S7BJG6S41.3F0POQAXRA1D1@bootlin.com>
Subject: Re: [docs] [PATCH v3] ref-manual: add documentation for the barebox
 class
Cc: <yocto@pengutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250119221005.1586540-1-ejo@pengutronix.de>
In-Reply-To: <20250119221005.1586540-1-ejo@pengutronix.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jan 2025 09:09:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6152

Hi Enrico,

On Sun Jan 19, 2025 at 11:10 PM CET, Enrico J=C3=B6rns wrote:
> This adds the initial documentation for the newly added barebox.bbclass
> to the Reference Manual's class list.
> It also adds the two most notable variables to the variable list.
>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
> v2 -> v3:
>   - use three spaces for code block indentation
>   - start barebox class variable descriptions with
>     "When using the :ref:`ref-classes-barebox` class, .."
>     and adapt paragraphs accordingly.
>
>  documentation/ref-manual/classes.rst   | 37 ++++++++++++++++++++++++++
>  documentation/ref-manual/variables.rst | 29 ++++++++++++++++++++
>  2 files changed, 66 insertions(+)

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

