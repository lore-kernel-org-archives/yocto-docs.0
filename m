Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BA8C77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 07:32:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.21713.1683271921053481552
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 00:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QhBqFlFO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 14EEC20015;
	Fri,  5 May 2023 07:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683271918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mea/Jp8kYyvfnRGp2vfbgHACGLQj7T3knWfIvfC8aN0=;
	b=QhBqFlFO82DqLqrY1f0BaXoD0e/BWcYXdc04B5i3S7OaICJok4n4PofqGaaD5/WGcnzTXT
	ZLn8jUzchHjmHleVaAVRok0P4hMOsn6kVYqDRurofRyD/9nNeojNocdvFSWg1BPl7W+7h4
	KVYkD+3lo4qYBsWi9CvNYyEhlj4xtcaBJRRa16FP1ILc7vXf0h9vRcWMlp0jVfRyc7djrI
	xY/2hcjMmE4mDEtyUxtgYginbG+MHc0GwsJAI1+71MHYyyLeeOrqfkWzQR7IfPbjl9Va0p
	BJlkIJHLed6GX96h02PDuYMCTBRsZlZMWSOg08ddq/V7i21muJqm1y6TSpx0fQ==
Message-ID: <debd98ed-e2c3-19e9-b995-24760a34b648@bootlin.com>
Date: Fri, 5 May 2023 09:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: add support for mickledore (4.2) release
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Michael Halstead <mhalstead@linuxfoundation.org>
References: <20230503223456.23985-1-mhalstead@linuxfoundation.org>
 <fcd085b3-44de-9dfe-a063-381de52dae5b@bootlin.com>
 <CADfgfoZ0VtaxPni_Uy1vptxqmmeX9zvvE6C2867v=bt=EnZi9A@mail.gmail.com>
 <138930bb46ca53edbad2b186f630bc5688635aab.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <138930bb46ca53edbad2b186f630bc5688635aab.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 May 2023 07:32:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3910


On 04.05.23 at 22:32, Richard Purdie wrote:
> On Thu, 2023-05-04 at 12:47 -0700, Michael Halstead wrote:
>> After this patch the docs are labeling both 4.2 and 4.2.999 as
>> Mickledore. Is that correct or should 4.2.999 use the
>> devbranch name?
> 4.2.999 is confusing but correct as the code stands today, it means
> "latest unreleased mickledore branch". We really need to do something
> better.


Would 4.2.x be better? It would be less confusing and "4.2.x" > 
"4.2.999" if we're comparing version strings.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


