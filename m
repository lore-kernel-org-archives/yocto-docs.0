Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE8BD5CC8B
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 10:32:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.11717.1730284322058222932
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 03:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=G3eQaxsp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95D94240006;
	Wed, 30 Oct 2024 10:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730284319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8zuQfR/LZGnkgB1HLstVcCj5YJfxF/C80OT7E8CNh/k=;
	b=G3eQaxspSw1D4X810QGe3Mp0OUj8hn0+707Yt754xNGCHPklJVdude4O+eetc4iLkT+v1o
	DfigG0wxgBuVQEGZvJhXXL6umbkloWOSuSuaIB1T8dd5B50qmyJlm3TRh6A4C8xlvAvoBG
	ZegZ5slnHFvdsN09YFNe0pSg9YEsIShD67m+qzewXcrKaNUMs8blCZZju6Db4OueRhnlce
	D1P1aL+HNEkJidBhSwUpEtOPn+aPCZ7xz/D8k3v+Ls475TarwpgwzVBjVYep/MBJCGp9hx
	tdTN5IWBgHGy7wTiSxioZquZAogf4U9nKVN8k+IhnyzeISPab4s3a7l/X03kHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Oct 2024 11:31:59 +0100
Message-Id: <D592LMQ2JRAV.2HSI6XNGJR2L2@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] conf.py: add a bitbake_git extlink
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241030-layer-confs-v1-0-0f7dcf460e27@bootlin.com>
 <20241030-layer-confs-v1-1-0f7dcf460e27@bootlin.com>
 <502402c8-3d16-46b6-b0ca-d2b8d92fd9ff@cherry.de>
In-Reply-To: <502402c8-3d16-46b6-b0ca-d2b8d92fd9ff@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 10:32:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5619

Hi Quentin,

On Wed Oct 30, 2024 at 11:21 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/30/24 10:23 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> To make references to the bitbake repo, add an extlink for it and use it
>> in the docs with ":bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`=
".
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> I believe we could also migrate a few oe_git to bitbake_git now across
> the docs?
>
> git grep 'oe_git.*bitbake' should help you identify those.

Surely, I think there is also a lot of `poky_git` usage while it should be
`oe_git`=E2=80=A6 I have a note to fix that in my todo. :)

> Thanks!
> Quentin

Thank you,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

