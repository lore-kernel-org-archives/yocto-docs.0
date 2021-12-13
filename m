Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F62DC433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 14:43:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.11948.1639406619657590795
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 06:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9C4F91C0011;
	Mon, 13 Dec 2021 14:43:37 +0000 (UTC)
Subject: Re: [docs] undocumented SYSTEMD_SERVICE_ESCAPED,
 SYSTEMD_DEFAULT_TARGET variables
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <16C008ECF757D9E9.19089@lists.yoctoproject.org>
 <8bc740c1-9ed4-bcac-b933-fd2be35bb650@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <14dc2508-abc0-ff32-16cc-41ce21758f46@bootlin.com>
Date: Mon, 13 Dec 2021 15:43:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8bc740c1-9ed4-bcac-b933-fd2be35bb650@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Dec 2021 14:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2243

Hi Robert,

On 12/12/21 4:01 PM, Robert P. J. Day wrote:
> On Sun, 12 Dec 2021, Robert P. J. Day wrote:
>
>>   just noticed that the two variables above are not in the current
>> variables glossary.
>>
>>   the latter is used occasionally so should be documented, but the
>> former does not seem to occur *anywhere* other than in
>> systemd.bbclass; is it actually a viable variable? i don't see s
>> single example of its usage in the numerous layers i have checked out.
>   oh, wait, it looks like SYSTEMD_SERVICE_ESCAPED is a purely internal
> variable in systemd.bbclass. it's just confusing if you're reading
> source and you come across a fully-capitalized variable that leads you
> to believe it's user-manipulable.


Thanks for reporting this.

SYSTEMD_SERVICE_ESCAPED seems to be a regular variable handled by
BitBake though. It makes sense to capitalize it as the other ones.

I opened a bug for SYSTEMD_DEFAULT_TARGET:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14660

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


