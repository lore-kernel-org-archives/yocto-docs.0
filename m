Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2469DC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 10:44:44 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.8924.1707821081952059027
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Feb 2024 02:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nHeuzEbJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4787CE000C;
	Tue, 13 Feb 2024 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707821080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZMfjDRGrBYOE0WsOWzaqcPx4+ZHpeg7up8nRNwlQ0c=;
	b=nHeuzEbJdwLON+g5yhX9unQusS+waqyCLSsw8W6SDg0UW5ofo9tNeJHrI13+YPPPyx5+EX
	WyQDaWsEtMdWguE1yRunV6tjc176GNRDmLFl0Vgf5l6x4M/OL/LPI7opvRsm85sJJnhv5o
	T12fChFRjxIgcnyRlTmRumQI7u1nLtAv/bskCMlOKf+ejAyhgUJ97DU/+LGcExagOormVR
	u4hzks3OmBfcrmz4Hi+8p4GV463Rc5r6GlCqPwgJJztxIo+sTt1X6Ug+lqnqaPG7sxAIYh
	sYjm0bShhy5QEqa8kzKU5ggmsDvZEXUAs7gJTFvnxjCg/UrXwHPMoPqZiLGseA==
Message-ID: <ad02cb09-e65a-49e8-855a-3306958936b4@bootlin.com>
Date: Tue, 13 Feb 2024 11:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: suppress excess use of "following" word
Content-Language: en-US
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
References: <20240209165251.2080708-1-michael.opdenacker@bootlin.com>
 <13d89168-f3ca-4b1e-a95d-9ab2e91c13c0@bytesatwork.ch>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <13d89168-f3ca-4b1e-a95d-9ab2e91c13c0@bytesatwork.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Feb 2024 10:44:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4832

Hi Daniel,

Thanks for the review!

On 2/12/24 at 14:22, Daniel Ammann wrote:
> Hi Michael
>
> I think some of these might be simplified even more, e.g.
>
> -Following are the requirements for a released BSP that conform to the
> +Here are the requirements for a released BSP that conform to the
>  Yocto Project:
>
>  The requirements for a released BSP that conform to the Yocto Project
>  are:


You are right. Some of these can be indeed further simplified, 
especially the ones with "Here are the" and when the final "are" 
wouldn't be to far at the end of the sentence.

I'm sending a new iteration soon.

Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


