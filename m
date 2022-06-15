Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A01CCA473
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 14:45:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.5632.1655304327443275693
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 07:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kIc263Tv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 51FCB24000D;
	Wed, 15 Jun 2022 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655304325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=454jE+J0XwuuKT1y0JOLkCjn96fnxxy7b7hWv3eqpuI=;
	b=kIc263Tveu8mZdeUaH5OLYZJPjLdM2JrBS94ZkS6FHdBsEE23GzX0aMMFTrcRo+UXCa1ex
	577C/kW10xpdJZ4D17aDq1L5aFMrlUIPkTtY8bFa8fR3CVmd9xrxSX/GiJF5IIeCMFTmXp
	aQeXALj23Yxz7LrKuna5GTw4h2wmxAo54hYzgAGE7dUaSFhbzXgkyZeJvhICeKdSdOHErC
	u6zPwNk1L1sloG3wAVMMFK9IKcT3SANPZDdrkPdnpSHRvsPS1ZtCQXjo9QRnM8ECgrdt/6
	RcRWqKsNPurIZ4F+WuN7vUuOX8sDgrXbz5pWftOT9zHFdqr8Ygak4UPEjMfLtw==
Message-ID: <3a9b5e55-a08b-63f0-66ac-8a79aa155500@bootlin.com>
Date: Wed, 15 Jun 2022 16:45:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] doc: Makefile: publish pdf and epub versions too
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <16F8C055A720EC59.22184@lists.yoctoproject.org>
 <37b58867-3670-aa38-0bea-d800ce73e5ba@bootlin.com>
 <9a0a57e5f81321816ee07cf0f18c33d1b73d7283.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <9a0a57e5f81321816ee07cf0f18c33d1b73d7283.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jun 2022 14:45:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3007

Hi Richard,

Thanks for the feedback!

On 6/15/22 13:40, Richard Purdie wrote:
> On Wed, 2022-06-15 at 11:14 +0200, Michael Opdenacker via
> lists.yoctoproject.org wrote:
>> On 6/15/22 11:12, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> [YOCTO #14357]
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>>>    documentation/Makefile | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/documentation/Makefile b/documentation/Makefile
>>> index 9fb6814c8f..e013f68e7f 100644
>>> --- a/documentation/Makefile
>>> +++ b/documentation/Makefile
>>> @@ -22,10 +22,10 @@ help:
>>>    
>>>    .PHONY: all help Makefile clean publish epub latexpdf
>>>    
>>> -publish: Makefile html singlehtml
>>> +publish: Makefile html singlehtml epub latexpdf
>>>    	rm -rf $(BUILDDIR)/$(DESTDIR)/
>>>    	mkdir -p $(BUILDDIR)/$(DESTDIR)/
>>> -	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/$(DESTDIR)/
>>> +	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/epub/TheYoctoProject.epub $(BUILDDIR)/latex/theyoctoproject.pdf $(BUILDDIR)/$(DESTDIR)/
>>>    	cp $(BUILDDIR)/singlehtml/index.html $(BUILDDIR)/$(DESTDIR)/singleindex.html
>>>    	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)/singleindex.html
>>
>> Note that a possible issue with this patch is that the current
>> autobuilder for docs may be missing packages (LaTeX in particular) to
>> generate the new epub and pdf outputs.
>> How shall we proceed?
> Do we know exactly what is needed? Could we add it to the buildtools-
> docs-tarball?
>
> We could quickly hack the docs target in a test branch for -helper to
> check whether we have what we need (which we likely won't right now)?
> This might fit in with the other sphinx version issues?

Right. This sounds like a good idea as the best way to know what we're 
missing is to make tests. Indeed, this would help to update the Sphinx 
version too.

Could you or someone else set it up? Should I create a special branch of 
yocto-docs for this change?

Thanks for your support
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


