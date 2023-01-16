Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA453C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 17:08:28 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.172582.1673888901177036205
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 09:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZIOQSjIh;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8F95D100009;
	Mon, 16 Jan 2023 17:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673888899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ohhkV9LzxQCQgi09956eLBqQYRbwvCPqtLYaW3FA3Hc=;
	b=ZIOQSjIhSppzIcHsoDYNt9AZFK8H6GnMVmW1CXH48axPoUv3PVSqSFHnymau4eWb2i049n
	LlbsmX2WcR/JAT22JoSWs11V4xbbtC7uESoMq5/4IU5Bd2T0kp5fsjTIdi2/tmxZpyfeOJ
	kfr39DzoOjXwXrp/KWjz8JY6BRNYo+bqgMhJ9WYGCLomKLam8V3T4XIPDgP7UGuR0VT+8v
	jhhITxUw+4rCZb4mkL4qn7F9Iajl3IX7y1f6ej3NyxfjkEfQ4oTxeZT2U+rmhs43KTQXtB
	y51gH21xIplBuogSW8tdiQx1RIbZ2WGLIhzj7r5TIn2sMR/M3YK1uPF7LR46bQ==
Message-ID: <2a2d305b-df74-479c-cf5d-5ef8cce215ee@bootlin.com>
Date: Mon, 16 Jan 2023 18:08:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: document Rust classes
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>
References: <20230113180932.1507356-1-michael.opdenacker@bootlin.com>
 <6rsfga2abu.fsf@pengutronix.de>
 <2a53087f-ebe5-e571-9731-cfc680ace44e@bootlin.com>
 <173AD6377FCD14EA.23170@lists.yoctoproject.org>
 <313f2f809ffb451062547e7c5438a82173549d09.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <313f2f809ffb451062547e7c5438a82173549d09.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Jan 2023 17:08:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3612


On 16.01.23 at 17:34, Richard Purdie wrote:
>
>>> I'd disagree on this one. If you read "src", what you pronounce ("S. R.
>>> C.") starts with a vowel, hence the use of "an".
>>>
>>> https://editorsmanual.com/articles/indefinite-article-a-an-with-abbreviations/
>>> seems to agree with me, but I'd be happy to be corrected!
>>>
>>> Thanks for the proofreading!
>> As a native speaker, it is definitely "a source" or "a src", "an src"
>> just sounds plain wrong to me!
> I was thinking a bit more about this, I think the reason is that you'd
> always pronounce this as "source", I'm not sure how you'd say "src" out
> loud! :)


That's what's difficult with English, there are so many different uses 
of it, and I'm saying "S. R. C." while you say "source" for "src".
Anyway, you win as a native speaker :)

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


