Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D326C4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:42:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.12401.1651250561896121392
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 09:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mT+HqzV/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 99E521C0003;
	Fri, 29 Apr 2022 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651250560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUlU1jeITVjh2mZkjq8VQyTmfew3XdKErpX2xKUj42k=;
	b=mT+HqzV/R4nFKougyBs/8YLeOJVctCVf9oL3x5Fu6cDLx2Puqbk7s9gTEyRxVECSNX4n9c
	N8/6U0ngkctphHHkSFQlekBrHU5aPqkiEBhiCZ6edpDL/89r4TkBQHCYdqwLjz6rYp/fz4
	OLg3oFE5GsjxWsmFcKUPONs/HB8wGhHMINy5Jw1LXvPm3gkUjNNmDacj9MX8u8ZM6ZK8h5
	b4o+snhjken/CshVbTuSi6zlu8TML+nATqAz6JFlnokhwLsAoD8C6lA6r42hYZH/lSJRMV
	WWJGakOOIs3PnfLpy+fduJ9TH4kEzUSGGZTttbU2CEMtTU9//NShyQGPg9PNYg==
Message-ID: <67246135-1025-1d12-31fa-d87c8cf79f7f@bootlin.com>
Date: Fri, 29 Apr 2022 18:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] Sstate cache for version 4.0.999?
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>,
 "Michael Opdenacker via lists.yoctoproject.org"
 <michael.opdenacker=bootlin.com@lists.yoctoproject.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
 <f413500a-5a0e-a17c-5dc4-c702fd2ff1aa@theobroma-systems.com>
 <8e983999-b237-3881-b5af-e7934193b089@bootlin.com>
 <96175A10-8D31-4E80-A97B-675A4EDE5610@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <96175A10-8D31-4E80-A97B-675A4EDE5610@0leil.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Apr 2022 16:42:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2905

Hi Quentin,

Thanks for the clarifications!

On 4/27/22 19:14, Quentin Schulz wrote:
> Hi Michael,
>
> On April 27, 2022 6:07:41 PM GMT+02:00, "Michael Opdenacker via lists.yoctoproject.org" <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>> Hi Quentin,
>>
>> On 4/27/22 11:59, Quentin Schulz wrote:
>>> As a side note, the current default docs being the kirkstone (4.0.999)
>>> branch is something I deem temporary. The issue is that the migration
>>> manuals and release notes of kirkstone 4.0 *tag* are not up-to-date.
>>> The ones in kirkstone branch are up-to-date.
>>
>> I guess that is what causes the 4.0 documentation to be out of date. For
>> example, in
>> https://docs.yoctoproject.org/4.0/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone,
>> there is still the temporary section called "Changes for release notes"
>> (https://docs.yoctoproject.org/4.0/migration-guides/migration-4.0.html#changes-for-release-notes).
>>
> Yes. The tagged commit for 4.0 didn't include (some of?) last week's work which is why it's missing from the release notes.
>
>>> I need to write something on the wiki to explain the issue and
>>> requirements so we can work on fixing this sooner than later.
>>
>> Do we need a 4.0 patch for run-docs-build?
> It's not technically one patch but more like 6. I know which ones to backport, it was just decided to use kirkstone branch as default page instead of 4.0 tag. This can be revisited I guess?
>
> We can patch if you want but the point is that release and migration manuals are generated from the docs at a given commit which is bad and makes it impossible to be up-to-date. For example, some fix was sent recently for 3.4 migration manual but it won't make it to 3.4 release unless we manually patch it on yp-autobuilder-helper script. This is bad.
>
> Also, in 3.1 docs, we only have migration manuals and release notes for <3.1 if I'm not mistaken.
>
> I would personally very much be in favor of having migration manuals and release notes pages common to all versions of the docs.
>
> I emitted the idea of using the transition branch for this purpose. What I suggested is to have a migration directory for each release where you only have the migration manual from release n-1 to release n and release notes from release n. That's it.
> What is cool with this is that we don't need to remove references or :term: of older migration manuals once the variables disappear from Bitbake or Yocto glossaries (an issue we recently had). It also directly links to the correct version of Bitbake docs for the links. E.g. if a variable disappears in n+1, we need to remove the ref/term to it in release n-2, n-1 and n migration manuals while they shouldn't be.
>
> The not so nice thing about this is that the migration manuals and release notes are not part of a given release of the docs anymore, which is not really acceptable.


Interesting idea indeed. Don't hesitate to propose patches when you have
time :)
Thanks again

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


