Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC10CC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 10:01:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.8964.1702980059360964545
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Dec 2023 02:01:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SUwmUkJc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A4931C0002;
	Tue, 19 Dec 2023 10:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702980057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a46g3TuNDYUI4swNjB0O1hi8pPSHejEovRxRW82+1gU=;
	b=SUwmUkJcLkuYosnKuHOJOZDLevg9xNKrSNLaiy3FGvKDimqVbBsaFtvWevaz7hByqPrbw0
	3eMK+yLYjLMnaJY0KA0tL/E+2/jkYeiwzHoxfObYnDieZq/nCndONk81GkIErkY6v/Cx2y
	7nW5RHzqRn7amh+1rde5JwD8vAI5JrX2FM/bQ22Wm8XlPF+T/sRKLLCcdSJLe5G6ETIkTH
	8DvTeBI4KR+DGiFFSsIWDfpC0xuRHQ5eqQnoV2VLdI9PbTxk/mxX0AJezyKMxFzz2zoThj
	R2tmqO2oQ4Prf3nvm/YDQtwmoBmV5nkZob1zSmjf5FLGQ7WQTE4LF0ELDkBj6g==
Message-ID: <360a6c05-ec1e-4cef-b2d3-de18bd52aadb@bootlin.com>
Date: Tue, 19 Dec 2023 11:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yocto-security@lists.yoctoproject.org,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [yocto-security] Documenting security advisories
Content-Language: en-US
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
 Marta Rybczynska <rybczynska@gmail.com>
References: <CAApg2=RSBvoPrS4F5ZOxtwEN97188huhA0LSQ_WXT3vocarb5g@mail.gmail.com>
 <a4b99195-4cf4-4392-b8be-43357fb22002@kernel.crashing.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <a4b99195-4cf4-4392-b8be-43357fb22002@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Dec 2023 10:01:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4726

Hi Marta

On 18.12.23 at 20:27, Mark Hatle wrote:
> On 12/18/23 9:37 AM, Marta Rybczynska wrote:
>> Hello,
>> When discussing security processes, there is one thing that we haven't
>> set up for now. This is, where are we going to put any possible
>> security advisories affecting the Yocto Project. The need to release
>> such an advisory could happen one day.

Good idea to anticipate this!

>>
>> A security advisory describes in more detail a single issue or a
>> series of issues. Gives the context, workarounds, information about
>> the version where the issue is fixed. An issue from an advisory is
>> likely affecting multiple versions of YP, and might have different
>> fixes for each version. The advisory will be referenced in the CVE
>> issue, security aggregators etc.
>>
>> Where can we put such advisories:
>> * mailing list of the affected layer/module
>> * general documentation in "Release Manuals", using a separate section
>> for advisories with links from each of the affected versions? OR a
>> separate manual section?
>
> My suggestion is send it to both yocto-security and have a 
> yoctoproject.org/security page that just lists each advisor.

What about the yocto-announce mailing list too?

Hey, what about a notification from the tool itself too, something that 
would catch users' attention if their version is impacted? Like the 
build system running a CVE check on its own version?

>
>
> I wouldn't add them to the docs themselves, but a link in the docs to 
> the advisory page would be good.


Well, there would be room for advisories in the docs, typically under 
the "migration-guides" folder for release notes and migration guides.

The pros of using the docs are that they are reviewed by the community, 
and they may be easier to find next to release manuals.

The cons I see are that docs take more time to update because of the 
review process, compared to a page on the website if members of the 
security team already have access.  Unless Richard, Michael H. or the 
documentation maintainer rushes them in. I guess you don't have much 
time when you submit a CVE issue.

I guess this also depends on how and how many times each advisory is 
modified, and whether this should be a collaborative process or not.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


