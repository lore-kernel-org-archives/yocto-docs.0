Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43739C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 10:30:33 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.24078.1639477832222679533
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 02:30:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 69BFE24000A;
	Tue, 14 Dec 2021 10:30:29 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [Openembedded-architecture] proposal: allow Upstream-Status:
 Inactive-Upstream in patches
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-architecture <openembedded-architecture@lists.openembedded.org>
References: 
 <CANNYZj-jYhoRu8S6C=CmhiP7L+zgdG97fj4MmRQ-wRco2xWxZQ@mail.gmail.com>
 <AM9PR09MB46424D01CC5A6F489074FA04A8709@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <ce0b166097c52942fefb8b93849ebff88a1e1ca9.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1822eb65-af18-f149-7a6f-6f985bc6e72c@bootlin.com>
Date: Tue, 14 Dec 2021 11:30:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <ce0b166097c52942fefb8b93849ebff88a1e1ca9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Dec 2021 10:30:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2251

Hi Richard,

CCing the docs@ mailing list on this part of the thread.

On 12/9/21 6:05 PM, Richard Purdie wrote:
> On Thu, 2021-12-09 at 15:48 +0100, Konrad Weihmann wrote:
>> I support that idea.
>>
>> as said in the other ML conversation the format should look like
>>
>> Upstream-Status: Inactive-Upstream [<last release date>(, <last commit 
>> date>)]
>>
>> with the part in the ()-brackets being opinion, as we mainly aim for 
>> using releases anyway.
>> This time I would actually have it as much machine readable as possible, 
>> so it might be suitable to dictate a yyyymmdd date format pattern here.
> I'm in favour of adding the new category and I agree some kind of dates in the
> [reason] space would be nice to have.
>
> For the purposes of a patch upstream, the last commit date is much more
> important than a release. I don't think this needs to be machine readable as a
> definition, it is better we have the appropriate info. Year is probably as much
> as we need since inactive software is usually measured in years.
>
> We may need to put some kind of guide in the docs about what "inactive" looks
> like.


Are you suggesting to expand the official Yocto Project docs on this topic?
Actually, I only see
https://docs.yoctoproject.org/dev-manual/common-tasks.html#patching-code
which explains the use of patches. There is much more content indeed in
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


