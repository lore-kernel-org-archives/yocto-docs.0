Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66C8C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 15:43:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.24708.1713195823113666540
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 08:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pwQMeHVx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1EC3E0005;
	Mon, 15 Apr 2024 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713195821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YND7hsY4SuNo+w3/LjyuhPDzG4nwEuizajvH1Riqn1k=;
	b=pwQMeHVx4ZGLDItG2xJtuqsA4vc8ZUd1D8Jb+KdWRF55kwSOm2UeOlJo8NAMEHktqIOA7S
	vdllTQruPaKcnymvMvWyp/trrjioTLHL1AxIMAZ5NuWV3h72JXTiktonzKH+LgNzEhve5E
	F1chYmGARadsFFHOlsHNfe8JJSTTL5/eoaw82zmz3UWPh6QB/2HGBUiO2c6157RgDDIdCg
	nYFSEB6EaT8oj0zZTE7lyJ20K+1GiTXO0QeQSvp4LxpEQjBSZA8JLP5okwzW6pCAIIeaDB
	hdzyNLRxMGr4OPDfmhNfYLlJjKysb7vbL+CAFarYniU6Vw7IEft29UF1at9Gow==
Message-ID: <6e6756bb-baf6-4075-86e7-f542693d533e@bootlin.com>
Date: Mon, 15 Apr 2024 17:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH 0/9] Updates for the 5.0 release
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <cover.1713127068.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 15:43:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5158

Hi Paul

Many thanks for all these updates!

On 4/14/24 at 22:43, Paul Eggleton wrote:
> Updates for the 5.0 release on top of master-next, including release
> notes and migration guide, as well as adjustments for the rest of the
> documentation. I think we are still missing a few changes but
> unfortunately I've run out of time. Thanks to all who added content
> ahead of me though!


If you're thinking about extra changes, just describe them briefly and 
we'll see what we can do :)

>
>
> The following changes since commit 4b839c460867d685584134dbd322cd9b20f2ae6d:
>
>    release-notes-5.0: various additions and improvements (2024-04-12 15:08:40 +0200)
>
> are available in the Git repository at:
>
>    https://git.yoctoproject.org/poky-contrib paule/5.0-release
>    https://git.yoctoproject.org/poky-contrib/log/?h=paule/5.0-release
>
> Paul Eggleton (9):
>    ref-manual: Add virtual-slash QA check
>    ref-manual: add new python classes
>    classes: cve_check: add note about remote patches
>    variables: add TARGET_DBGSRC_DIR
>    dev-manual: update reference to sstate-cache-management script
>    dev-manual: update custom distribution section
>    release-notes: Add CVEs, recipe upgrades and contributors for 5.0
>    migration: Extend migration guide for 5.0
>    release-notes: additional features and one known issue for 5.0
>
>   .../dev-manual/custom-distribution.rst        |  34 +-
>   documentation/dev-manual/disk-space.rst       |   2 +-
>   .../migration-guides/migration-5.0.rst        |  62 +-
>   .../migration-guides/release-notes-5.0.rst    | 635 +++++++++++++++++-
>   documentation/ref-manual/classes.rst          |  31 +
>   documentation/ref-manual/qa-checks.rst        |   8 +
>   documentation/ref-manual/variables.rst        |   4 +
>   7 files changed, 757 insertions(+), 19 deletions(-)

For all changes, after sometimes minor tweaks
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
And merged into master-next.
Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


