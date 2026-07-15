Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6DAC4450A
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4921.1784118610174142208
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 05:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Tdvzc2JT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 60869C2B9CD
	for <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 12:30:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73B816035C;
	Wed, 15 Jul 2026 12:30:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5977B11BD3B64;
	Wed, 15 Jul 2026 14:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784118606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PcpstM9Es9xCRiXzf+kANjoOKWQbVXo6n3cVHxFbnMk=;
	b=Tdvzc2JTRARQzon9dOfY/VI+OuvNQ9t9FXZOA/L3E4VQ5mpbbsrKMNijfXHxjyAHpw6P9Y
	/J4xq/1tnxBlH+KqBKzJ3Iif0elVvETek5iozhekGx/qYQrOJEYbVPpW5zNj75+ygCUP1B
	Bk1r3O+dIYkxBSYTOOMydC0IXebduLSQrLOUQ2nRtSecUC2CKBqa0h2E6JlBRVdEyuv9Sv
	yg9D9Jg7yKigI/9ikqKiqqY1aITvNjIIJFcZQdqTJ+EJytnkl6ENU2pBXd+6By69cVbKOp
	hoJvi0rE5KcGpfW9VEzpwT1+eZi9iu/hY8EQV1dpCSnKqM2u8nT6e55+0DgURQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 14:30:05 +0200
Message-Id: <DJZ59GPEP45R.20F3GW82NNSF3@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/8] conf.py: add linkcheck builder exclusions
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
 <20260710-linkcheck-v1-1-999168371d5e@bootlin.com>
 <a72acc48-890d-4a9e-8b22-5d02b5dee589@cherry.de>
In-Reply-To: <a72acc48-890d-4a9e-8b22-5d02b5dee589@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 12:30:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10072

Hi,

On Fri Jul 10, 2026 at 5:09 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 7/10/26 4:46 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> The linkcheck builder can be used to scout for broken links. By looking =
at
>> the output of:
>>=20
>>    grep -E -r --no-filename -o 'href=3D"http.://[^/"]+' | sort | uniq -c=
 | sort -nr
>>=20
>> from the HTML output directory, exclude links that are too frequent.
>
> Because they are too frequent it's impossible they are broken?=20
> Considering you fix links that are in this list later in this series, I=
=20
> don't think this holds. At least provide a proper justification because=
=20
> "too frequent" doesn't make sense.

I see your point. I did not want to hammer those websites, that is all. I'l=
l
drop this patch I think. Maybe I could add this but commented out, in case
someone also wants to apply those exclusions.

Antonin

