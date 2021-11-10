Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E98EC433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 18:42:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.278.1636569763177739673
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 10:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6073C20007;
	Wed, 10 Nov 2021 18:42:28 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell 1/3] ref-system-requirements.rst: Add
 Debian 11 to list of supported distros
To: Steve Sakoman <steve@sakoman.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1636564016.git.steve@sakoman.com>
 <1e32fbf2a24dfbbffb0450db97bac76ac7440da4.1636564016.git.steve@sakoman.com>
 <70b01de2-15cc-225e-9d47-95ddfc363ba0@bootlin.com>
 <2ef59077f06541a8f71d8b644a4e997fadc088aa.camel@linuxfoundation.org>
 <CAOSpxdZ1Jt9epr9Z9JkBT+FdpdyjrMmfRZ5S7UAgGQb=a+p9wA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1fad7cb1-bb18-b633-7bfb-9a0f7c16ca4d@bootlin.com>
Date: Wed, 10 Nov 2021 19:42:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CAOSpxdZ1Jt9epr9Z9JkBT+FdpdyjrMmfRZ5S7UAgGQb=a+p9wA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Nov 2021 18:42:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2122


On 11/10/21 6:53 PM, Steve Sakoman wrote:
> On Wed, Nov 10, 2021 at 7:47 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2021-11-10 at 18:44 +0100, Michael Opdenacker wrote:
>>> Hi Steve,
>>>
>>> On 11/10/21 6:08 PM, Steve Sakoman wrote:
>>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>>> ---
>>>>  documentation/ref-manual/ref-system-requirements.rst | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
>>>> index d238dc454..4c4a7cf0a 100644
>>>> --- a/documentation/ref-manual/ref-system-requirements.rst
>>>> +++ b/documentation/ref-manual/ref-system-requirements.rst
>>>> @@ -65,6 +65,8 @@ distributions:
>>>>
>>>>  -  Debian GNU/Linux 10.x (Buster)
>>>>
>>>> +-  Debian GNU/Linux 11.x (Bullseye)
>>>
>>> Great!
>>> Could we apply these to "master"  too?
>> We should only be applying things to older branches which are resolved in master
>> one way or another too. And yes, the autobuilder has debian11 workers so this
>> should go to master as well.
> My bad, I assumed that master already had this change since the debian
> 11 workers have been around for a while :-(


No problem. This helps me to understand the process.
Does it apply to Fedora 34 too? Is it enough to see a few successful
runs on https://autobuilder.yoctoproject.org/typhoon/#/builders/86 to
assume that Fedora 34 is supported?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


