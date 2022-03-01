Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2365C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:00:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.6193.1646125234399575807
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 01:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c51RkeGE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AFC0BE000A;
	Tue,  1 Mar 2022 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646125232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+M6EqHlBsqlPxKOxrps0+TT79UCB2qhJ7BRHRRWBuk=;
	b=c51RkeGEd9pbJGAs1aEUPmSRrC7K0mWf4y7zeacvDFaZpBidH4KD/leuqj8HrqJs47C8i4
	OHTK38OwaB79ZoUuhnWtcqJAwDzfrj7Vtfi8yynhIt+EnDb19591VEfYQB10+f+fi+zcDA
	j6yHL6O8WeoGd4CxVLYS/pYhBwrHp9ssg9O/88fUEdMsQJbDL5TTE1sF0LTNApgaFFn3bj
	F2MFQECd8du/ej5xk9tQPt/AW9lBZ5ZUG9WD325Kz6JdVJPaU7N1qciYcW99U1kNp1LWJ1
	8s3OS54DPHduDCYpgJ5MY9qJVhEHziKzrB5IK1OKdf6T8XCpNitw6/GBCX4S+Q==
Message-ID: <203852d6-339e-d3ca-2abf-3d30fffa8b9a@bootlin.com>
Date: Tue, 1 Mar 2022 10:00:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [RFC,WIP] removal of distutils* from docs
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tim Orling <ticotimo@gmail.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: 
 <CANx9H-Bpvn-_bVqZkgkNGcwWEFZ3cY+B_Ex4MDpjU_cPt-G9GQ@mail.gmail.com>
 <cfd0e149-5c17-e5e2-d11a-aec4c1b53a8d@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <cfd0e149-5c17-e5e2-d11a-aec4c1b53a8d@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Mar 2022 09:00:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2513

Greetings,

On 2/28/22 10:07, Quentin Schulz wrote:
> Hi Tim,
>
> On 2/28/22 01:47, Tim Orling wrote:
>> I have a WIP branch to remove distutils from the yocto-docs, but I'm not
>> sure what to do in the old migration guides that reference the now gone
>> classes and variables.
>>
>
> If you are referring to text/literal mentions of distutils, please
> keep them in.
>
> If you are talking about references (:terms: or :bitbake: or similar
> directives), then you can make them text/literal mentions now because
> they won;'t be found anymore, which will fail sphinx-build.
>
> But that is a good question because I'd like to have those migration
> manuals in a different git repo that is common to all versions. In
> that case, I think it makes sense to have something in place so that
> the references are kept in migration guides. We could probably add
> more entries in the intersphinx mapping which would point to older
> bitbake objects.inv and let sphinx use the first mapping that has an
> entry for the referred variable. Anyway, we're not there yet... just
> writing it here so we don't forget there's a quirk (one more...) to
> keep in mind if we go for this.
>
> Anyways, I think you can just make references text mentions instead.


Agreeing with Quentin. Replacing the ":term:NAME" and ":ref:`text
<ref>`" statements by "``NAME``" and "text" is what we've been doing so
far in such cases.
Thanks in advance for the patch.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


