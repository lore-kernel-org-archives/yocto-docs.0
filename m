Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD20C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 07:26:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.14659.1713511588856346010
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Apr 2024 00:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=G2dt/qxW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4EDBE0002;
	Fri, 19 Apr 2024 07:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713511587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+S52NBbKwbSli2GKNpx79Thsdjwu/tq7xfqU4XzC6s=;
	b=G2dt/qxWIfEYGj2/UM+BRsMdOTuDUjt4IkfZQkkxlhSjfrOv+hrRxZM4xJDIyzmw7GmIUl
	DclykDGSJDsAWXnFbnXwSLtVyav4Amo2j5ckvrNFqO2ON0vuZU6sVNgocGCTg7CuCLDZ76
	bEgK+wC7+nCsG/doBIOwfEFjMxfyY2aTSVYACLwS6gq5BVq4LpnwNCutMztBiMDA2WJ0v9
	ijODhE2CjNykYh8lvdEd7PCEdtq3l7jsLklnva3DfKhsY6+reW//GXvCWxpy08o6ZBmzIz
	0Px2qsYBUYaMd/we3+srX6Mwsp0bQx2rs9cP7Zyf3tTb0j2CipY/R46jXzdHtQ==
Message-ID: <acb0f3b9-18fe-4b9c-a75c-33f2dda7b37e@bootlin.com>
Date: Fri, 19 Apr 2024 09:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/2] Add a few missed new features for 5.0
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1713464653.git.bluelightning@bluelightning.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <cover.1713464653.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Apr 2024 07:26:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5168

Hi Paul

On 4/18/24 at 20:27, Paul Eggleton wrote:
> Add a few new features in 5.0 that I missed in the previous patchset.
> Apologies for being last-minute!
>
>
> The following changes since commit 0cdc0afd3332459d30cfc8f4c2e62bdcc23f5ed5:
>
>    release-notes: additional features and one known issue for 5.0 (2024-04-15 17:39:29 +0200)
>
> are available in the Git repository at:
>
>    https://git.yoctoproject.org/poky-contrib paule/5.0-extras
>    https://git.yoctoproject.org/poky-contrib/log/?h=paule/5.0-extras
>
> Paul Eggleton (2):
>    variables: add USERADD_DEPENDS
>    release-notes: add a few more new features
>
>   .../migration-guides/release-notes-5.0.rst    | 32 +++++++++++++++++--
>   documentation/ref-manual/variables.rst        |  6 ++++
>   2 files changed, 36 insertions(+), 2 deletions(-)


That wasn't too late, many thanks for everything!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


