Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF88C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 21:44:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.582.1643838290274924794
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 13:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CqIKYHQl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C5D301C0002;
	Wed,  2 Feb 2022 21:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1643838288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HffZKA4QiayqS4AJ6vKhGPsinyRVQzHqCBcTWMHxIkE=;
	b=CqIKYHQlzNq3qhGBeF4bliFHgau9LdblJDjf2oYIOG3fzWCcbejaprtQKUsTeER9LnEp9+
	r5GTLScOKYhd2O/0b4J0DzYrAjjSw5x38jN9JhuH7K2d5trJOApQ2syipV0bjXPOmNLbLC
	KOMecplHZom+FZwNaQdJeh/dImxZ1oWLO/7mVmXHcBn7SSz6HgNrJ8hywy744w56SYQenF
	1dhuvAZUi7X97uPAX6w/0fHkvRar9wAeQhiRtgZx7w2Zpg9XiMqrXtrjb8S2cXVmPryR0O
	WcNws+h7V0jmtesjamArPVBOkAKv+CniziAi33qb7bJq5S/kYMjX8V7AgKQg9Q==
Message-ID: <1734a67f-b739-a2b5-c225-d1f61ad22f28@bootlin.com>
Date: Wed, 2 Feb 2022 22:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: add 3.4 and 3.4.1 release notes after
 migration information
Content-Language: en-US
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <16CBC19CDCE903A8.406@lists.yoctoproject.org>
 <e47b6364-408f-eafc-2eb3-0610c060d516@bootlin.com> <1806445.tdWV9SEqCh@linc>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1806445.tdWV9SEqCh@linc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Feb 2022 21:44:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2460

Hi Paul,

Many thanks for your review and feeback!

On 1/25/22 23:18, Paul Eggleton wrote:
>  
>>   * Are the repository links really important? Could we simplify them?
>>     Could we just have the Poky details and downloads?
> I think we'd need more than that, but what is included and what isn't is
> definitely debatable. I know we've asked in the past if the tarballs were
> useful, I'd be really surprised if anyone needed them now.


Good to know. I'd propose to just keep the tarballs for Poky. I guess
they would be sufficient, right?

>
>>   * Do we really want to have lists of commits? Wouldn't a link to the
>>     corresponding git tag be enough? 
> This is what we do for minor releases. I think it might be useful to some, 
> but you'd probably have to survey our users to really know whether they benefit 
> from it. One easy alternative would be to just provide a cgit link e.g. for 
> dunfell-23.0.13 :
>
>   https://git.yoctoproject.org/poky/log/?qt=range&q=dunfell-23.0.12..dunfell-23.0.13


This sounds like a good idea, but we'd lose the specific list of fixed
vulnerabilities.

>
>>     If so, we may need to add links to
>>     them, but that's going to be very verbose in the source code.
> If we do continue to do this ideally we would be auto-generating the content
> (prior to check-in I mean), so at least it shouldn't be hard to manage.


Right, this will have to be done this way. Do you manually differentiate
the security fixes from the normal ones for the moment?

>
>>   * Are these really notes clear enough and are the main points
>>     highlighted well enough?
> So we could probably use formatting (e.g. bold) on some of the more key
> points /sections of the release notes new feature list. Unfortunately our
> project generally isn't that visual so there's not much chance of including
> images in the list (unless we go to icons or similar).
>
> One of my go-to examples for documentation that I think looks great is Django -
> for their release notes they tend to break it up more into subsections e.g.
>  https://docs.djangoproject.com/en/4.0/releases/4.0/
> It would be nice to do that at least for major features so we can explain the
> benefits of each one in a bit more detail. 

Well, we already have subsections on
https://bootlin.com/~mike/pub/yocto-project/docs-2021-01-19/migration-guides/migration-3.4.html#release-3-4-honister,
corresponding to the main changes we want to highlight. Isn't this what
you're suggesting?


>
> (Honestly though I don't think it's worth spending the effort prettying up
> the release notes for older releases, it's more something we can think about
> for upcoming ones.)


Indeed, tt make sense to start with Honister to know what format we
want, in order to be ready for Kirstone. However, how about the Dunfell
updates? Would they continue to be released through the old text release
notes?

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


