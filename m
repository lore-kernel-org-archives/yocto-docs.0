Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B275C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 10:55:49 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.6637.1667904944093560906
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 02:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mNN7ET37;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B2AB5E0004;
	Tue,  8 Nov 2022 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667904942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQKevOx0hOEc2qMY6xZeEQdE7pxy8zJIBXd0Gs2yIT0=;
	b=mNN7ET37HLg5UWr2ZNVm17kXivf328qW2BBBd7bBSGfPPKKM3nUOfP7l8zm3VJ0/ZwClkT
	LWw7Iuw7dD5B0ZNOgfHlhbSE6bjxhlBcjX3BmTPTiNR2rQiBtjgVdN4gXlYXOABV/ybeqT
	qsfCzOR0gFi9J2SAFyTRTib9PE/rIWakqcCBKBihz9fSjOPMMxnf5vxSwmKaUG9a0shxNt
	UjQ9oXiKhlnwEgRLp2f/jFn4bNdwjspjBGACLkOvY1iDdCTJcuBzAW09kj4j3h3KCol+QD
	6zIaeKD3R/mU3kJLVXUwiGohn/poQI5HcG6jj4fjjSq0L1fVDql+9r2g4dy+GQ==
Message-ID: <115b5e34-c672-006c-2cb1-32ca3c4f9ce6@bootlin.com>
Date: Tue, 8 Nov 2022 11:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Re: [docs] [PATCH 0/2] fix a couple of inconsistencies
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20221107-upstream-misc-fixes-v1-0-532ba173fc6f@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221107-upstream-misc-fixes-v1-0-532ba173fc6f@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Nov 2022 10:55:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3471

Hi Quentin

On 11/7/22 17:22, Quentin Schulz wrote:
> Fix some section naming inconsistency and a missing closing parenthesis.
>
> Cheers,
> Quentin
>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> ---
> Quentin Schulz (2):
>        docs: ref-manual: classes: fix section name for github-releases
>        docs: ref-manual: classes: add missing closing parenthesis


Thanks for the patches!
For both patches:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


