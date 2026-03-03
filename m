Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E47EC142C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:59:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15685.1772535592443640901
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 02:59:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wSwIBbI1;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 867781A2346
	for <docs@lists.yoctoproject.org>; Tue,  3 Mar 2026 10:59:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 589B55FF29;
	Tue,  3 Mar 2026 10:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DEE3B10369694;
	Tue,  3 Mar 2026 11:59:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772535590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=maPpO3HsIUPHTWM0CXdFi/TFifQCSnrECMBG7mJj6uo=;
	b=wSwIBbI1/IDIbdm9A8aA8IytbOiBXV+X4B1EEUnu/7o7/T4CiLGY1gNqlJTNyXBac9vpVd
	oDfK3EswZ+cJmCZZZp6h3Y8mGaCE3V4der6H0XcUv+bJWNbJmkIeJ8BVk0WYwmQ+oJXubg
	7r4YNmTcx5ZLt+wBRaa0VpDV0DwNnRpi2GbZclIsi1j2NW6nXMmm73V0r9n4aaZl1FOo8P
	GYrStNDt+5H8LvinkaR4exigrkn/Ptp/L/EwluNWWsT4+Hck86mrU/ns+S2ZYDzz02iTEC
	BP+ePoX2ALfQsNg483QlT66/mXeuPcWhwPK5UQFESFelIBsLoBFRXfcsBn0IgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 11:59:48 +0100
Message-Id: <DGT3FBURVDJ8.3S9VMOJ2UAY8L@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <ticotimo@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: document PTEST_RUNNER_TIMEOUT
 variable
Cc: "Tim Orling" <tim.orling@konsulko.com>
References: <20260227200241.66128-1-tim.orling@konsulko.com>
In-Reply-To: <20260227200241.66128-1-tim.orling@konsulko.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Mar 2026 10:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9046

Hi,

On Fri Feb 27, 2026 at 9:02 PM CET, Tim Orling via lists.yoctoproject.org w=
rote:
[...]
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 208b5e43d..587f67cc6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7793,6 +7793,20 @@ system and gives an overview of their function and=
 contents.
>        For more information, see
>        the :ref:`ref-classes-ptest-python-pytest` class documentation.
> =20
> +   :term:`PTEST_RUNNER_TIMEOUT`
> +      Specifies the timeout in seconds for each ptest suite executed by
> +      ``ptest-runner`` during :ref:`ref-classes-testimage` runtime testi=
ng.
> +      The default value is ``"450"`` (7.5 minutes).
> +
> +      This variable is set in the :ref:`ref-classes-testimage` class and=
 can
> +      be overridden in image recipes to adjust the timeout for specific
> +      images or multiconfig variants. For example, in ``core-image-ptest=
``::
> +
> +         PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi =3D "600"

Could you explain why you're using the :virtclass-mcextend-python3-cffi ove=
rride
here? Seems like a complicated example for this variable's description, but=
 if
it is needed, we might want to explain it?

Antonin

