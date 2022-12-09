Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B530C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 14:03:54 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.1775.1670594628108516473
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 06:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g0iuMM4S;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 08AE5C0023;
	Fri,  9 Dec 2022 14:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670594625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=THPvJqdRa97osIO14lAv+C52vM/0djryLeK8oRQWwC4=;
	b=g0iuMM4SjWoU/3ARskzx7VTIV4w87FlIlXN4ogrY6w16+wEX1VBjTfR0457lrT9/TMoRSS
	Dd9l42JqR3WtWOk8sVRAzXt8MvkSAHhCG/aCx8EOeavFi4Q40NRjDKlEOW0eu+O8B6ePEr
	0punkHwbAh00JuVrCtKPY3xbaE8IJPO3rB6O25v8BhrKOi3q+XBbBgcjHZDKotV5M6diGJ
	5ml3DNTHhFcpn6bFiqo4AXA1bI3VRYbNqtLjZMpPDP+brm0oX7cTapA0yFvPBsiAAReR6I
	0IYv6c8XQMV0KFlXLW+qrW08sMPKQS8G4LQF0+p7u+RxrhaRCeqi2d9TgO6qpA==
Message-ID: <5b16ff72-0881-9139-6c66-9c10ebcc7c98@bootlin.com>
Date: Fri, 9 Dec 2022 15:03:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [docs] [PATCH] manuals: add missing references to variables
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 quentin.schulz@theobroma-systems.com
References: <20221207203928.511207-1-michael.opdenacker@bootlin.com>
 <9a3732e1-5b70-b6ad-a071-2b14e6b9c46c@theobroma-systems.com>
 <6c1159837c55133a2b1bd7ef56a78776cc1b9406.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Cc: docs@lists.yoctoproject.org
In-Reply-To: <6c1159837c55133a2b1bd7ef56a78776cc1b9406.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 14:03:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3536

Hello Richard, Quentin

Thanks for the review and for your opinions!

Am 09.12.22 um 10:51 schrieb Richard Purdie:
>
>> NACK for the release notes. AFAICT, most of the changes are in lines
>> that are commit titles. You cannot expect the release manager to do
>> those changes so it'll always be out-of-date.
> Whilst we can't expect it, I'm not sure if there is an issue with
> improving them and adding references if someone has such a patch?


Right, I was wondering about those, and was not sure when adding them. 
Of course, references in the release notes should never be mandatory in 
the commit titles, but they don't hurt either, on the contrary for 
people reading them. It's also a bit difficult to ignore the release 
note documents because they include paragraphs which I believe should 
have such references.

As far as I am concerned, it makes my work easier if I add references 
for the instances I find, because they won't show up in my future scans.

Cheers
Michael.

>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3530): https://lists.yoctoproject.org/g/docs/message/3530
> Mute This Topic: https://lists.yoctoproject.org/mt/95524415/1051844
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [michael.opdenacker@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


