Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BC8C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 09:51:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.18523.1665568269688009360
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 02:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fLu15Qt0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 36C8DC0009;
	Wed, 12 Oct 2022 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665568267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acMe+4O/zQD8Hhi1zhusZoAo27nNCoT7IoUvOpiL144=;
	b=fLu15Qt044zfe/DJnowaC/VioydMVjDYzl3b7dIv6+XinGC37Ev6NrO8ErEV2nDpc/xiJ7
	Ns0FTxHPe5uD4ipnJ5yOn7rvmP1BjWrYux7XcoBYYGBs9F+aUiybKmWUCMQ/zXFKYXrq0b
	juwQJl10E7qFvFc0wegXnHAshmTC/CkcCnYyFq40v3HQVVa+XAX6tfuacHQgZ2InupCckh
	Bjgz/HjMfV1X6M6ojOxmApsY0qTSllwK7fVRsgdKHmt7Mxx4lY9+9Ryq6BnI15wmL/52NS
	sbkpEIL6y5Au553DrSW/uaL8tBfLyTTsoK34hi94kCTb38zUJy5j14C1iajjSA==
Message-ID: <5b424ec2-56b6-835f-0f74-8f93bf30b374@bootlin.com>
Date: Wed, 12 Oct 2022 11:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 17/34] ref-manual: add info on
 buildtools-make-tarball
Content-Language: en-US
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <ca1f1cd15307cd97fa4ccba564a7c8ba7f4f29e6.1665392835.git.paul.eggleton@linux.microsoft.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <ca1f1cd15307cd97fa4ccba564a7c8ba7f4f29e6.1665392835.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Oct 2022 09:51:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3353


On 10/10/22 11:24, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>
> This is not perfect, but at least covers the use case and the new
> tarball that we are providing. Note that the --make-only option to
> install-buildtools is a currently pending patch.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>


I'm also holding this patch, and will update the commit message when 
your patch to OE-core has been accepted.

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


