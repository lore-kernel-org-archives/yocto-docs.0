Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD59C47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 20:15:31 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.980.1706559322389323044
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 12:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f4chT42M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EC9BFF804;
	Mon, 29 Jan 2024 20:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706559320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXGng4YTxDw6NyRWh39lnWAuI+ovXIZFFclRndNb7gM=;
	b=f4chT42MQ3v8Wi8vAbx4rltkDi1MD7BZuqiFWTFa0Bq9cPt5e2Vj2HVY2Br2eILULtB2dy
	+gQJTEvbAVAkiv70pDAE6v07Miq6u2UwWcst/3r62ks2Zgyml47/5INYAIqhpuiZx6OJD1
	JcQMVjddyEQ7MSlIKo/EnytZlJu1hTGnyGeJ3SxQJUyJsi7k5ZYz8MHOCzyWo0Jg+my2TI
	g19AGqfGYHv8L2Q8BqnoB8mw64LDudPp9lNkHOswb02MwHjsvXY2VqmdZdQgx9ADqEKy4d
	2End7tULGTP1aDmIeSzCnNj32EGu1HrlR+KWWCSIqh3iA9OE4SFWMwe/6hHIMg==
Message-ID: <b01991a1-71c6-4fed-925e-6177ef5359b3@bootlin.com>
Date: Mon, 29 Jan 2024 21:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] Possibility to use 'noindex' or rel="canonical" to stop
 Google from indexing old versions of documentation?
Content-Language: en-US
To: chris.laplante@agilent.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <DM8PR12MB5430C1F3DF524811569BF9A08B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
 <df129fbff9b6a2c77be7354b302307e7b67ce806.camel@linuxfoundation.org>
 <DM8PR12MB5430B9DFA3D7B1DABD0C4EE28B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <DM8PR12MB5430B9DFA3D7B1DABD0C4EE28B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jan 2024 20:15:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4798

Greetings

Thanks for this useful suggestion!

On 1/25/24 at 18:43, Chris Laplante via lists.yoctoproject.org wrote:
> Hi Richard,
>
>>> Is there any way we could add ‘noindex’ to old versions of docs so Google will
>> stop crawling them? Or maybe add canconical links? Or something in <head>.
>>> I’d be willing to help out with this effort.
>> I'd love to see this solved.
>>
>> It was partly one of the reasons we updated the docs in the first place.
>>
>> I'm not sure what the right solution is but our docs repo and the scripts we use
>> to build the docs are all open and there are definitely possibilities.
>>
>> I'm not sure if any others have opinions on the best way to fix this?
>> Personally, I'd welcome proposals though.
> I'm also not an expert on search so definitely want to hear what others think. Noindex/canonical URLs are just what I came up with after cursory research.
>
> Perhaps whomever controls yoctoproject.org could also poke around in Google Search Console and see if there's something in there that can help?

I did find the "noindex" tag 
(https://developers.google.com/search/docs/crawling-indexing/block-indexing) 
which we should be able to the HTML pages we generate through Sphinx 
(https://docutils.sourceforge.io/docs/ref/rst/directives.html#meta).

We should be able to add such a tag to obsolete manuals only, in the 
corresponding branches.

Let me try this.

As far as the older versions before the switch to Sphinx are concerned, 
a side-wide tag is probably an easier solution.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


