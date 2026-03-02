Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1744EA4E09
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 14:13:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.161268.1772460827635427860
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 06:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vwfaEHbc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6AED21A1F34;
	Mon,  2 Mar 2026 14:13:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F7935FE89;
	Mon,  2 Mar 2026 14:13:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 892C3103692BB;
	Mon,  2 Mar 2026 15:13:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772460824; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=16En4K9C/JDOtbR6uwWyACNiK+S9Tyyk5tLx+8iwlL0=;
	b=vwfaEHbcyb2HZ/HOX7mgFpm/88mxb7Jp4TGMdBNNWqNyqgKkNRpZkMO7gxxk0es1p2tNGW
	awcrb2QJVuJr1zyeXr5RVTwo1SjSZKA9adUyJykvniCgg2PvwrWxWt1K828zXNr05CLFK+
	Py+Ri9rT3qkNXpsaE24mKiuAAZI0COO9uYCEchsRmonQrtWb3sFhJ1W9fWfsWeJavadKli
	XNEVXbPC3cfuM/pL83RyUq1RgNI01FQ+zqSO1ZHuaKBXgLTgB5rR4+1nYybtHBJSnciJQI
	qGvmw7/KOix4lAr2xqfNykACHrzWrrpb4nYHG6Fc4AAXep93Cz2/vMu+gEx35g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:13:42 +0100
Message-Id: <DGSCX90IHTVN.3BM597DYW8Y4G@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] should dynamic layers be documented other than as
 BBFILES_DYNAMIC?
References: <16cf1ee4-14bc-061c-dac3-3d3ee539cd64@crashcourse.ca>
In-Reply-To: <16cf1ee4-14bc-061c-dac3-3d3ee539cd64@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 14:13:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9044

Hi,

On Mon Mar 2, 2026 at 1:21 PM CET, Robert P. J. Day wrote:
>
>   colleague asked about dynamic layers, went to point him at the
> relevant part of the docs only to notice that it is not documented
> anywhere in the main body of the docs, only via the BBFILES_DYNAMIC
> variable in the variables glossary:
>
> https://docs.yoctoproject.org/ref-manual/variables.html#term-BBFILES_DYNA=
MIC
>
>   i don't care for the idea of the documentation of some feature being
> restricted to a short entry in the reference material; IMNSHO, any
> "reference" content should be brief and refer the reader to the
> "official" explanation somewhere else in the documentation.
>
>   if there was a "proper" place in the YP docs to cover dynamic
> layers, where theoretically would that be?

I would say the Development Tasks Manual, in a new document called
documentation/dev-manual/dynamic-layers.rst: "Creating Dynamic Layers".

Patches welcome!

Antonin

