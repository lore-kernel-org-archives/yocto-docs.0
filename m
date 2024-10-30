Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9004D5CC87
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 10:13:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.11483.1730283194290228233
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 03:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YaxV10PV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A0ABC0006;
	Wed, 30 Oct 2024 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730283192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/gDiCaJ8ISglbfqlC8UQaT87PHX4l3SgYCmUfMhtiM=;
	b=YaxV10PVHGndGXYvha1kYatOhR3aTiQe5XpFzF/sni18WEHTlJDMcIH3yeOoFiow+QJQy8
	xh2BK+Z/FJKut9cMzU3JZ/PF112hbtA6twQ8BHhc5hlNaqvxTpUISndRLpxNlI+jdTN+lR
	U9JDQ6wYsi42/jz6Z8Byt9LUf45kA78ASN1xmry2ajAUmNM9A3PR9YISQyLGyp3EEcP2AU
	Yw5SKQYH2XIly39Ar2kziLYXuWEisW2nz04Cp9ajeUxSJUDvzw8xnXDj4tmM6WdxtMhFc9
	FKwgm44KnPeyXxcPWFmJedAP61AtFX8ct7bTFxXukYDvl+SjMfL42SdGSdWzEQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Oct 2024 11:13:11 +0100
Message-Id: <D59278VT5C0S.1CGDMIH17XBAH@bootlin.com>
Subject: Re: [PATCH v2 0/2] Update the devtool quick reference document
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241022-devtool-improvements-v2-0-9d2ebf9c5311@bootlin.com>
 <D57HNKY70WR3.1HM1OVRDY4359@bootlin.com>
 <a70748b9-de58-40e1-a033-b6b1e5412a1f@cherry.de>
In-Reply-To: <a70748b9-de58-40e1-a033-b6b1e5412a1f@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 10:13:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5615

Hi Quentin,

On Mon Oct 28, 2024 at 3:27 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/28/24 2:54 PM, Antonin Godard wrote:
>> Hi Quentin,
>>
>> On Tue Oct 22, 2024 at 10:37 AM CEST, Antonin Godard wrote:
>>> * Refresh command outputs from `devtool --help` and `devtool add
>>>    --help`.
>>> * Add some brief details on the subcommands that were previously
>>>    undocumented, and the more recent commands that weren't documented
>>>    yet.
>>> * The remaining subcommands are still present in devtool, so leave them
>>>    as-is.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>> Changes in v2:
>>> - configure-help: Give an example of what the command will output for.
>>> - ide-sdk: mention that like deploy-target an ssh server must be runnin=
g
>>>    on the target.
>>> - Link to v1: https://lore.kernel.org/r/20241017-devtool-improvements-v=
1-0-2bacc656fe39@bootlin.com
>>
>> What do you think of this v2?
>>
>
> Looking good. I'm a bit wary of giving my Reviewed-by on things I've
> never used though.
>
> This looks like valid Sphinx and English to me, so that's how far I can
> go for this review :)
>
> Cheers,
> Quentin

Thanks for the review!
And I'll add the `ref-classes-autotools` suggestion from the other mail.

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

