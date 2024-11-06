Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D8ED44D44
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 10:30:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.42571.1730889006508368631
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 02:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BpedB8cO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CB23FF80A;
	Wed,  6 Nov 2024 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730889004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BCDkd4SU5F+VwPPcICxXUPMFnmmy1GzhA+yFpZqBiUI=;
	b=BpedB8cOTboy1f0HaxbwkBGO6TVJK81vc1V+kPYvF/DWlpHuXmTtVhneaBinEgtoUXxQxG
	mC7jCr3uE1iAI8XDZNucctj9x/rjkKHs0he28Ko5OaXX/KTE56KWIJSoeNPwzqQJMkspNu
	kovqkwbApCgoCJdAlT37EM1Z3j507gIX6340GlTRTdpCXtEGKGG2mfo0rkHQOzclvFoQJz
	vT2wBzS/DUTL174H5pZjMlGyflWAJatXlZofYEvuQXQyZ4ClSDCAXsWVwtRTG6wiv+TB/c
	gyFXZtOiC9lU40a/Fy8jg8Qh4qFfb3e/ZckC+eLTIv9MGVkksq1+MHTcBZ4jYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 11:30:04 +0100
Message-Id: <D5F0XZ9II0MN.2U9C8IQFOD6MU@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Julien Stephan" <jstephan@baylibre.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v4 2/3] ref-manual: variables: add
 SIGGEN_LOCKEDSIGS* variables
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241106-add-bblock-documentation-v4-0-9f24dfe69243@baylibre.com> <20241106-add-bblock-documentation-v4-2-9f24dfe69243@baylibre.com>
In-Reply-To: <20241106-add-bblock-documentation-v4-2-9f24dfe69243@baylibre.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 10:30:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5695

Hi Julien,

On Wed Nov 6, 2024 at 10:02 AM CET, Julien Stephan wrote:
[...]
> +     Then you can look at files in ``build/stamps/<arch>/bc`` and search=
 for the

Didn't notice before, but it should be ``tmp/stamps/<arch>/bc``, right?

> +     file: ``<PV>.do_compile.sigdata.09772aa4532512baf96d433484f27234d4b=
7c11dd9cda0d6f56fa1b7ce6f25f0``.
> +

Also, how about s/search for the file/look for files like:/.
The current phrasing makes it look like this is only valid for `do_compile`=
.

Otherwise, this looks good to me, thanks!

Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


