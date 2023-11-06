Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C47C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:45:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.50932.1699267555230002110
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P9QhfpFk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3B58FF81A;
	Mon,  6 Nov 2023 10:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699267553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOtL9uzWhMGewPlQX0Z6IhQ4YX5GyXo73vDo32DjFzg=;
	b=P9QhfpFklDCdrtKSKFtKSiBFdui4HqyudbIx4sz0O/nPqtO9H8HglkFFX2cvb0w6ULq84i
	nvIaoMSmkCSQVHYKyWerNjGK/8tt36SPUJqoD+Fm4lZLm3ynkzOGiJg7ULv5T1LP2lIAfj
	T8Qak0ep+82g/xrWBMNLxpUc0KdS+EtV3CCvEoRpObLAZMEjytMV7J6Gq4pFI3cHZLZtJC
	8Xa25uAojVv3fa7nH8GCGkLvoRIh2TaFE53M/kWlaGyPh1sVXNeWB8UhY2wBxV1bpOrYpI
	3Tpi+igMH8k/oyPpuaSj65MCa/FJ3TiqfrNSdYOHOwk3NJXQgzxBQovs/Og+8A==
Message-ID: <07046b5a-869d-4c3f-8cc4-acdb7b387216@bootlin.com>
Date: Mon, 6 Nov 2023 11:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH 00/12] 4.3 release documentation
Content-Language: en-US
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <cover.1699266393.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:45:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4599

Hi Paul

On 06.11.23 at 11:29, Paul Eggleton wrote:
> This is not 100% complete, but I wanted to send what I have now so that
> we make progress and folks can review the changes so far.
>
> Cheers
> Paul
>
>
> The following changes since commit 8fb31b507c37d2c11e9dc98559bd7d145e1dce04:
>
>    bsp-guide: bsp.rst: update beaglebone example (2023-11-03 15:35:05 +0100)
>
> are available in the Git repository at:
>
>    https://git.yoctoproject.org/poky-contrib paule/4.3-release
>    https://git.yoctoproject.org/poky-contrib/log/?h=paule/4.3-release
>
> Paul Eggleton (12):
>    Remove references to apm in MACHINE_FEATURES
>    ref-manual: update SDK_NAME variable documentation
>    ref-manual: remove semicolons from *PROCESS_COMMAND variables
>    release-notes-4.3: fix some typos
>    release-notes-4.3: tweaks to existing text
>    release-notes-4.3: add CVEs, recipe upgrades, license changes,
>      contributors
>    release-notes-4.3: remove the Distribution section
>    release-notes-4.3: move new classes to Rust section
>    release-notes-4.3: feature additions
>    migration-4.3: remove some unnecessary items
>    migration-4.3: adjustments to existing text
>    migration-4.3: additional migration items
>
>   documentation/dev-manual/new-machine.rst      |   2 +-
>   .../migration-guides/migration-4.3.rst        | 118 ++-
>   .../migration-guides/release-notes-4.3.rst    | 704 +++++++++++++++++-
>   documentation/ref-manual/features.rst         |   2 -
>   documentation/ref-manual/variables.rst        |  51 +-
>   5 files changed, 801 insertions(+), 76 deletions(-)


Many thanks! I'm away traveling this week, but I should find some time 
this afternoon or evening to process them so that we can proceed with 
the release.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


