Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27748C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 13:47:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.15902.1710856048146668476
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 06:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GZ5sk+dM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D911B240006;
	Tue, 19 Mar 2024 13:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710856046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAw4uvCynxiLVYvjlj/mUXA9qSUngnBPJTnXU8phny8=;
	b=GZ5sk+dMI0wC0gmK3hkvCwhrBsK+1qr70EvQAdhK8OEgugRxziCw7hO9+svJRGy8JkAyc1
	+X6v7wb1OeaeKltBEOHq69+CXzN6+jpRuugNm9tRGg8ka3naVoVDPnPiVe0dbLO3v8Kcno
	7fylVCCZeWuSoHrPsMGcLq6InA6/4S5nUpygqTQ26qijkSLXdwb8DvMJd66aUFPMF/GJSb
	OzqumSFP3mefGtZ/DnB0WmyyMpxWvqGCos/uQQMJPsIqB+MYhWfCg8TaC9GkVizvc9uFXX
	6DK4cBdg76J2H5feDqi485o1DJrGcAvX0SAsY6GJdkG21FqHySFCwbEMa5ezQA==
Message-ID: <4f5c2176-a334-4d06-96b8-241e63f6c547@bootlin.com>
Date: Tue, 19 Mar 2024 14:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/3] dev-manual: improve descriptions of 'bitbake
 -S printdiff'
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20240318150211.1192651-1-alex@linutronix.de>
 <97f79f51-0fff-4c81-85bc-faf3468259cb@bootlin.com>
 <CANNYZj_Q4YBQ4KkkCiiQ76-HbpoMwtGbsYVhGHNHdTf98J64Yg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj_Q4YBQ4KkkCiiQ76-HbpoMwtGbsYVhGHNHdTf98J64Yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Mar 2024 13:47:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4995


On 3/19/24 at 11:50, Alexander Kanavin wrote:
> On Tue, 19 Mar 2024 at 10:27, Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>>> -      (e.g. in the shared state cache) and then run ``bitbake-diffsigs``
>>> -      over the matches to determine the stamps and delta where these two
>>> -      stamp trees diverge.
>>> +      BitBake to try to establish the most recent signature match it can
>>
>> s/it can/it can find/ ?
>> IMHO it would clarify the sentence.
>> If you agree, I can make the change directly, no need for a new submission.
> I think 'it can' can simply be dropped from both paragraphs without
> loss of meaning?

Oh right, that's the simplest solution indeed!
Done. Merged into "master-next". Thanks again.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


