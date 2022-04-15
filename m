Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0060AC7114C
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:04 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.7392.1650029861606964058
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 06:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ivIn3kBk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 527DBFF808;
	Fri, 15 Apr 2022 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650029859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKFq04Bkj1pCKXkWhce/DYh5otbDi5aqjOzBVoFfLZI=;
	b=ivIn3kBkB7Qk5HOEG3RsLRp/NgJxGxd7z6pFosrRLdLwLHJB3jpLGCf2ERPvSpX+Taqbep
	LxAWXTLu7eKbifKvv/uQwook7AI6mrj0Jzf9NN019moO6hk/eF7gn5vCqg1S8hLuHUUxFO
	1bjNb2e3RzQ/mL4sZebE1qRYNPyuUNmHzEYPmJfZX5uPdrOG5S5Wxwr8dfmQJkh9p/vzhF
	OfMFo78gm3ABhd72Hx0asMrf+sFGbgp1d2acZe0/2vxxJ5t5R+7sgZeSjVLs7S5pLwKLHJ
	4EO99+ysCsHShhpzd3pHJjkEtHlXulDTSjOoSBzvTUjk41ZtVrRAjFaNKVvh/w==
Message-ID: <1d4f565f-c85a-db77-53e0-3b253b122e6b@bootlin.com>
Date: Fri, 15 Apr 2022 15:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH 3/3] docs: sphinx-static: switchers.js.in: improve
 obsolete version detection
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20220414113327.176534-1-foss+yocto@0leil.net>
 <20220414113327.176534-3-foss+yocto@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220414113327.176534-3-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2775

Hi Quentin,

On 4/14/22 13:33, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> Based on additional information per release, specifically with the
> obsolescence status of a release, the obsolescence detection can now be
> much smarter than just checking if the release is older than dunfell.
>
> This is required because with LTS (dunfell for example) releases, it is
> now possible to have LTS releases that are older than obsolete releases.
>
> This means obsolete releases need to be tracked and only the release
> version cannot be used as an indicator of obsolescence.
>
> Let's use the obsolete field of the per-release data in the all_versions
> dictionary to display correct warning messages.
>
> The warning message is first about outdated version if there's a newer
> one available (*even* if it is for an obsolete release, e.g. 3.0.1 will
> say it's outdated and should select 3.0.4 version instead), then if the
> version is the last of the release, show a warning message if the
> release is obsolete.
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  documentation/sphinx-static/switchers.js.in | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)


Thanks for the whole patch series.
The changes seem to make sense.
I merged them into master-next.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


