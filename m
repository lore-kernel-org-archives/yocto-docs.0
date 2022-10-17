Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476CAC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 08:32:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.38713.1665995518815365310
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 01:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Qa8tcZ/v;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 57B4CC0009;
	Mon, 17 Oct 2022 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665995517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MAtpXc7FwLcLh5iEr3nRFGKjYEU/+aQAGjFmA6B8t5M=;
	b=Qa8tcZ/v3wzF9YJodXFKIrYLG7hu+02LlHGMVRxDTRd/r1DPSyrEi0H3VKyT1PwvojOQ+P
	fc0sS50IK4oEHrIsy1z1Yp7LdGZDur5Rc8ZapzB1UOkCyD1B/9j9WtB0a91vdyeSTJUam1
	gi7N9Id/mNi6n3CpYnSU2nCOJBIDvBFXzanGsJ8b8lPH5dfFuj/El+kj/7J4r2quyGR68k
	9FeRwDyL1raU9F1tgKNz0BJrl6SZzsluD8maCJ2zil2Xm6HZ9yrWnA+BY/SWbm5Wo0zxTR
	emRB2y28V3IEPrnS19xKJqD4xCah0paD/iFygcBxyfvLHP/wnZb8hwYfPILbVg==
Message-ID: <ec4892e8-ca7c-83e3-a279-754c50271585@bootlin.com>
Date: Mon, 17 Oct 2022 10:31:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 13/34] ref-manual: add pressure limit variable
 documentation
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <d0e6b7661912a5aeedc3e193ff76982cb0fc8dc1.1665392835.git.paul.eggleton@linux.microsoft.com>
 <936247d7-5cb0-2ec3-1a3e-15aa647d53c3@bootlin.com> <4749032.GXAFRqVoOG@linc>
 <06573b44-31c6-6d8e-c683-9f0f843057fa@bootlin.com>
 <9676bdc8-a79b-88a9-0901-554a5bafbc56@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <9676bdc8-a79b-88a9-0901-554a5bafbc56@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Oct 2022 08:32:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3367

Hi Quentin

On 10/17/22 10:26, Quentin Schulz wrote:
> Hi all,
>
> On 10/17/22 10:15, Michael Opdenacker via lists.yoctoproject.org wrote:
>> Hi Paul,
>>
>> On 10/16/22 22:38, Paul Eggleton wrote:
>>> On Tuesday, 11 October 2022 23:30:50 NZDT Michael Opdenacker via
>>> lists.yoctoproject.org wrote:
>>>> Actually, these have recently been accepted in the BitBake manual (the
>>>> patches from Aryaman got accepted after he left WindRiver), though
>>>> apparently with fewer details:
>>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.openembedded.org_bitbake_commit_-3Fid-3Dc014281f72f4f54ec8e681ef2b8e&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=x6GN6XCgxQmI7f-H7T3WT3-Fm0BA5lJwsTI4AYj7vqNo4vO7FONFXbwhZxNDjOg5&s=w3C2EZQkLelO9mCiJE4ey-FVbNc3zA7PBHZ2nnBc4wE&e= 
>>>> 1080de9ab5cf
>>>>
>>>> Shall we submit your updates to the Bitbake manual instead? This 
>>>> way, we
>>>> don't have these variables documented in two different places.
>>> Ah, oops - I missed that. I'm OK with that for now; however, and I 
>>> may have
>>> also missed if this has been discussed recently, but it's my opinion 
>>> that all
>>> variables documented in the BitBake manual should also be in the Yocto
>>> reference manual, since they are two different contexts - the catch 
>>> being that
>>> for some variables there is information you can't reasonably include 
>>> in the
>>> bitbake manual since it relies on some definitions unique to OE so 
>>> the entries
>>> can't always be copied exactly. If on the other hand some variables 
>>> only
>>> appear in the BitBake manual, there will be people who just won't 
>>> find them.
>>
>>
>> I agree that BitBake variables should all appear in the Yocto 
>> variable index.
>>
>> There are already some variables which are initially documented in 
>> the BitBake manual and then the description is expanded in the Yocto 
>> manual according to the OE additions. SRC_URI is one of them:
>>
>>   * 
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_bitbake_2.0_bitbake-2Duser-2Dmanual_bitbake-2Duser-2Dmanual-2Dref-2Dvariables.html-23term-2DSRC-5FURI&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=x6GN6XCgxQmI7f-H7T3WT3-Fm0BA5lJwsTI4AYj7vqNo4vO7FONFXbwhZxNDjOg5&s=MUG2hR2Xp_pBuwrtNxNwKRKxCuWXh8fgIcmZm7k0cTw&e= 
>>  * 
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_ref-2Dmanual_variables.html-23term-2DSRC-5FURI&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=x6GN6XCgxQmI7f-H7T3WT3-Fm0BA5lJwsTI4AYj7vqNo4vO7FONFXbwhZxNDjOg5&s=jTk77XY6-zxpJ_a9dWSexbLvlpev2lr2-QfhnWYv74E&e=
>>>
>>> To avoid things getting out of sync, we could potentially have a 
>>> script that
>>> would check for and report on variables present in the BitBake 
>>> manual that
>>> aren't in the Yocto reference manual. I'd be happy to write such a 
>>> script.
>>
>
> This would be a good start, though...
>
>>
>> This would be useful, but if I recall correctly, Quentin was rather 
>> thinking about having Sphinx include these from the BitBake manual, 
>> at least for the ones which are only defined in the BitBake manual.
>>
>
> I'd prefer having a Sphinx plugin that does this automatically (I 
> haven't checked if this is actually possible).
>
> But we can start with this script and manually adding those to the YP 
> glossary. Someone may eventually find the time and motivation to look 
> into a Sphinx plugin but I for sure don't have this time at the 
> moment. sorry.
>
> How do you think of implementing this? I had in mind to just add a 
> variable in the glossary whose description would be:
>
> See :term:`BitBake documentation <bitbake:FOOVAR>`
>
> so we don't need to take care of keeping their description in sync,


Yes, this would be perfectly acceptable as a first solution IMHO, if 
nobody objects this redirection. Then Paul's script would definitely 
help (thanks in advance!).
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


