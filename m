Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D25CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:02:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.23113.1697706164227802738
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 02:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=acMi5ZN3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EDD120007;
	Thu, 19 Oct 2023 09:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697706161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JT8rfgMWrPip4RY8HuvHBJ0LGh8FYxiJIkbo3RGEkD0=;
	b=acMi5ZN3ws3Q6DUe4Z3NGewFs1PSxhI2KCG5uXkRng9C9MkuvEWj8wyyoD0qDeV6zxvqtn
	GktmAt4f71RWp3nlNc0z19ZDfbIxFS1QFUKfWjBlrkac3OHeNzuGSYZjJIC7QCaPW5XRLV
	+x7wbvcf7f3Nm5apGeNO8uV5ovoLeQ0bZUzUVkfofnxo20XFNNULW9u1IHOchu/ChO7sjZ
	0viQAqClGUx5w1CLkUNrk2qh8IEKYABPYvs6+9/cPbt4Y+TsSWXVjk32isneGzomLvk7iA
	ZZnrxw+VJsrtxwnCgFFq08AyUdakk+eJ6cVz7EnKH5T85LXmKTXwRdPS7KOm6g==
Message-ID: <e59bc7cf-4b40-4767-806d-75bc57a2c807@bootlin.com>
Date: Thu, 19 Oct 2023 11:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 yocto-security@lists.yoctoproject.org
Subject: Re: [docs] Documenting YP processes
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <CAApg2=TOJg06EP3JJmaoC-mxzPM3=4WkW0y3ADuuXRVsccoefw@mail.gmail.com>
 <ef4d2c98-e7f2-4c3d-8a59-dd5d1e181dea@bootlin.com>
 <f296756f07267e29d23732acf41e7c799d7f4d22.camel@linuxfoundation.org>
 <CAApg2=TMPH+RX4=+uZh7-cG4URFEcYwroxybPMnoBtDZBVk=0Q@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAApg2=TMPH+RX4=+uZh7-cG4URFEcYwroxybPMnoBtDZBVk=0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 09:02:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4413


On 19.10.23 at 09:40, Marta Rybczynska wrote:
> On Wed, Oct 18, 2023 at 7:35 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2023-10-18 at 16:57 +0200, Michael Opdenacker wrote:
>>> Hi Marta
>>>
>>> On 18.10.23 at 16:23, Marta Rybczynska wrote:
>>>> Hello,
>>>> I'm writing the "official" documentation for the YP security processes
>>>> and I'm realizing that I do not know which document to put it into.
>>>> There is no "YP Processes" manual. What about adding a "Security
>>>> manual"? It can then include:
>>>> - security processes
>>>> - a single place describing how to submit CVE fixes
>>>> - links to other manuals for relevant material and/or rewrites if necessary
>>> IMHO, it does makes sense to create a new "Security Manual". We
>>> currently have
>>> https://docs.yoctoproject.org/dev-manual/vulnerabilities.html with some
>>> useful details contributed over time, but a separate manual would
>>> probably get more of the attention this topic deserves.
>> I'm torn between a security section in the Development Manual or a
>> separate one. I don't think we want too many manuals so I have a slight
>> leaning to a section but am open to persuasion.
>>
> Arguments for both options below. I do not have a strong opinion, while
> Security Manual seems to me a little better option at this stage.
>
> In Development Tasks Manual
> - puts everything in one place
> - security is a part of a standard development process
>
> Separate Security Manual
> - more likely to be found by people who do not consider themself
> developers ie. security researchers, analysts who have a fix etc
> - more general visibility (when searching by keywords), can be
> announced by the project
> - better fit for processes (Development Tasks Manual is strongly
> technical and concentrates on tools)


I don't want to vote twice, but your argument for making it more 
accessible to people who don't consider themselves developers sounds 
pretty strong to me. The better visibility is quite strong too.
Other opinions?

>
> Note that a chapter on CVE fixing is also in Contrubutor's Manual


Would you move this chapter into the security manual?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


