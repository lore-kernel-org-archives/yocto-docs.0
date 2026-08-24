Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAB3C61CE4
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 07:23:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11378.1787556192410421070
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 00:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TUPt9MfV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 952BF4E41384;
	Mon, 24 Aug 2026 07:23:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6311560378;
	Mon, 24 Aug 2026 07:23:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C969711C789BA;
	Mon, 24 Aug 2026 09:23:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787556186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IvU0OXhfsSm7YOMy6aArfj3C0ZbdPGWHq1wvC7CXfuM=;
	b=TUPt9MfVX/txnDlij6TCoCNYET6yz+A0oNnCBwx0LTTZK8m5RUjjk/1mUGcgafQ3xiwjfm
	/F1lqB4P77bzDZLTUdM5j/++OSRn1ijxR4NI1Y3qG1DsdXGpZSxuSeUM1bigVoWLggAaua
	p88l82+scejfsDKU6tz2a6/UHGOmJ/sOcoi+jCfFm5igXUB0nH07iZjNeuJnjA/61DjQxW
	6CkoMrw738c2AZ6F53MX/pVsQHEU7ZpuUpMkxIhyYrnq/CtNSHoRBcv1Dj5UZDSzVFUaom
	g4OwyOa5PpGgg/WT8eykbMcLVLbvpmuIsxfBes7dcUOaggtqHcOeSfayLmE+7Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 09:23:04 +0200
Message-Id: <DKWZS6EH0VLX.3HZYRXJU2T015@bootlin.com>
To: <quentin.schulz@cherry.de>, <daiane.angolini@foundries.io>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/features.rst: fix some cross
 references
Cc: "Daiane Angolini" <daiane.angolini@oss.qualcomm.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260814202800.1106393-1-daiane.angolini@oss.qualcomm.com>
 <e51f6266-a770-4275-9d2e-418dbcaf94de@cherry.de>
In-Reply-To: <e51f6266-a770-4275-9d2e-418dbcaf94de@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 07:23:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10324

Hi,

On Fri Aug 21, 2026 at 4:37 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Daiane,
>
> On 8/14/26 10:28 PM, Daiane Angolini via lists.yoctoproject.org wrote:
>> The text does not match the cross reference, so change that.
>>=20
>
> Yeah I'm not sure why we keep doing that. We already provide a link so=20
> I'm not sure what this helps with. But eh, better fix it like you did so=
=20
> at least it matches. We can always decide to get rid of those later on.=
=20
> I wouldn't be surprised if we have other mismatches in other places in=20
> the documentation.

I agree, removing those is probably the right thing to do.

Antonin

