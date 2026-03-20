Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2DB108B8EE
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:44:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9796.1774003461703627642
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 03:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KuCaBXOE;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 992291A2F11;
	Fri, 20 Mar 2026 10:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70080600E0;
	Fri, 20 Mar 2026 10:44:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E44C510450B96;
	Fri, 20 Mar 2026 11:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003459; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zmMfJ2nVTEc3T7NILJs6SMHxSekxKhDUULh/BPqV01I=;
	b=KuCaBXOELNjrvkjLaebobn3ffybSbCWx/AtYXvQz7/16KVCjUipCd4NKj/Gfes8lri2koY
	w3K17sjv5AFCpFRRv0XNr+feI6JdrQdkk84N82nEXGwkks59JO/mx7eTVDvGYdUNIceYq/
	QYHebF2kKi8JsaEMxItgrfwDow2annVga+Vi983bmR12YRToop2IfRq6x8nPsBH59ovTDQ
	uq2EsLYav/qr2AX6wXHRcmvi9UN4Lg4pOPX3TcOIejjk+myiiAPNYQoeDY/isndxZNbUtV
	fpOIaPvHdruL4+Y4pdMWBGO+m7yCRT/kKB6TPil7qHFVq38mORAta1Y7iSY0Lg==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 11:44:17 +0100
Message-Id: <DH7JQPJL9D74.1L6371MBQQPAJ@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 6/8] migration-guides: update 6.0 (Wrynose)
 release notes
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
 <20260302-release-notes-6-0-v1-6-9662dee58591@bootlin.com>
 <d76013e1-535b-4cf8-a83c-11a1cf093bd2@cherry.de>
In-Reply-To: <d76013e1-535b-4cf8-a83c-11a1cf093bd2@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:44:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9100

Hi,

On Thu Mar 5, 2026 at 12:42 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
[...]
>> +-  Support for the `CVS` fetcher (:bitbake_rev:`5427500e4f23`).
>> +
>
> Missing verb. I'm assuming we want "was dropped" here.
>
> Also, I'm hoping we won't have sha collision on the first 12 hex digits.=
=20
> Wondering if we should't put the whole sha instead of only the first 12=
=20
> hex digits?

Ideally I would have preferred to be able to pass-in the full hash and have=
 only
the short one be displayed, but I don't think this is possible with the ext=
links
extension. If we come up with an idea later, I think we could always script
something and replace the current references with full hashes?

I put 12 digits as a reasonable limit which also doesn't clutter the readin=
g
too much.

Thanks for the other reviews! I'll send a v2 shortly.

Antonin

