Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F38AC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 09:28:17 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.50429.1680254887448381959
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 02:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UeQV3Hwl;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 00FBE10000E;
	Fri, 31 Mar 2023 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680254885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gTwoQOs1hPXvaNzkQfmE+Xj1a792bVyJ2hT1lmXbLT0=;
	b=UeQV3Hwl5hlZ9sAaHuZqXsuf14qulAt4UwO0ZZ1kKyxJ9FKCMVelfFE743ner6tWslura8
	Pnol3duApt+VkXNqaTKryQIwoeemee71S2Kewb6wI0oQLeyaeTmPTJd37vPqKXWHru8pQc
	OfSGpoDEqxIroNr5gMTuJzn5nkhuVTc4oXBuf+47ztpHcjD7cKTNPmclkkTqTquueDIiip
	vH0Inacjcs5bd+wsCv2F6ObJCrc0HuK/9jfqaKLqyOMjcf3LG6uQf1+Wbu+93Z/WgGqDbs
	ugporr0LrJh8Eq5NsgVc4AXARM89gnpNtUe+aApqOFnVXwwAi9kEdcqUTIIxBQ==
Message-ID: <5f59d27e-c717-caf4-bf72-6d6f7f89999a@bootlin.com>
Date: Fri, 31 Mar 2023 11:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Subject: Re: Need content for 4.2 release and migration notes
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: YP docs mailing list <docs@lists.yoctoproject.org>
References: <3fc33c4e-b166-96f8-78ee-e840a4657f61@bootlin.com>
Organization: Bootlin
In-Reply-To: <3fc33c4e-b166-96f8-78ee-e840a4657f61@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Mar 2023 09:28:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3819

Greetings

On 21.03.23 at 18:50, Michael Opdenacker wrote:
> Greetings,
>
> As discussed in the weekly engineering meeting, we need to have 
> release and migration notes ready for the 4.2 release, hopefully 
> happening in about 10 days.
>
> Here's what we have so far:
> https://docs.yoctoproject.org/dev/migration-guides/release-4.2.html
>
> I can try to find some noteworthy details by myself by looking at the 
> commits in the master branch, but I'm sure some of you will see the 
> big picture better.
>
> So, please drop here quick descriptions of the changes you are 
> thinking about. I'll take care of polishing them and adding them to 
> the manuals. Submitting patches directly is also possible, of course.


Just to remind you that we need release and migration notes for the 
upcoming release.

Just quick notes on this e-mail thread will do, and I'll be happy to 
develop them from the code and commit descriptions.

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


