Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A49C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 10:05:48 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.8022.1647597946159992204
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 03:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Aha7vWLp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D5DBF1BF216;
	Fri, 18 Mar 2022 10:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647597944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsc/S4MwcanNyYRIreutKOhr0HHGC9s3uPadTLyiG+U=;
	b=Aha7vWLpInWrjQ5WgZ0XmtD708ziMhwlSL6EGy5hZ7/PtJKQfDvZRY7+waeuJfuw12Gy61
	NAkVI9qItHlU/HE1RYLaqKIbZw09crhBR5iBFIY6VGgkpPcGYtzrSc1bbxUJSOuR40199U
	SlMYwbWkGb+R5qDOhVaKGVn5AECnyEekoCKvMo+Wz1uchq8nRcSvNg2ta9iGVBEgPZoUwh
	1W22YCLo+nlrZw62jTCLqchdOHdFmH4ENmhmTIF4gxRZw3UGKvFOYV1qFfi1O8cKre1PKl
	sqWS7H7VEQtBmYQD+Odu5sH2j8+BRH6D8PoERfujynsG4WWgdjEhl/FwYVk8Pg==
Message-ID: <6342c148-7e51-df83-2166-e2745b9f61e0@bootlin.com>
Date: Fri, 18 Mar 2022 11:05:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] Version bump before release
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org,
 Michael Halstead <mhalstead@linuxfoundation.org>
References: 
 <CADfgfobCTXyBYSSjekdKJp4ekrmHWH+imjpARMrCMLp2gwTr5w@mail.gmail.com>
 <14D40357-15CC-46D2-B63A-66AED89F291F@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <14D40357-15CC-46D2-B63A-66AED89F291F@0leil.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 10:05:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2623

Greetings,

On 3/18/22 07:47, Quentin Schulz wrote:
> Hi all,
>
> On March 18, 2022 1:04:32 AM GMT+01:00, Michael Halstead <mhalstead@linuxfoundation.org> wrote:
>> Hello,
>> In the past we've correctly bumped the versions in the yocto-docs release
>> branches before the release build and I only need to update the master
>> branch to update the switcher on the website. This doesn't happen reliably
>> though and we've been having to patch the build system to make the docs
>> build correctly.
>>
>> Ideally all that would be needed at release time is a patch like
>> https://git.yoctoproject.org/yocto-docs/commit/?id=78545b8f42657c21bc3cac96429d3950b07a3aca
>> to update the website.
>>
> For the new releases (not the dot releases), it is essential this patch is merged with correct infos before tagging, specifically the poky.yaml file.
>
> For dot releases, what matters is the bump of the dot release in poky.yaml, the rest of the changes aren't that important because it's impossible to always keep it up-to-date.
>
> releases.rst and switchers.js are taken from master for all builds anyways by yocto-autobuilder-help so we don't technically have to worry about those making it before tagging day. Those need to make it to the master branch as soon as possible though (basically after tagging).
>
> Two changes to conf.py need to be done too for releases. current_version needs to be bumped and bitbake_version to be set.


Some of the mess is probably my fault. I didn't want to update *master*
to refer to releases that didn't exist yet, because this causes warnings
on the documentation website. However, I realize there should be no
issue updating the release branches (such as
https://docs.yoctoproject.org/dunfell/, which I believe are not
advertised on https://docs.yoctoproject.org/), so I was wrong to apply
the changes only after the release was out.

My apologies!

Let me try to understand if I understand the desired workflow correctly:

  * Prior (weeks before) to a future new release, create a new release
    branch on "yocto-docs", e.g. "kirkstone"
  * Update documentation/conf.py (version specific) and
    documentation/poky.yaml in the release branch (e.g. "dunfell")
    according to the upcoming release (e.g. "3.1.15")
  * Before making the release, check in the content of conf.py that
    current_version is NOT dev and that bitbake_version is set. If
    current_version is set, extract it and make sure it's used in
    poky.yaml too. Also check that the YOCTO_DOC_VERSION_MINUS_ONE
    setting in poky.yaml corresponds to the number of the latest n-1
    release.
  * Make the release. I guess, when we have a new release, this means
    that a new branch for BitBake was created.
  * Make sure
    https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-build
    supports the new BitBake branch.
  * Add new tags to the branch (e.g. "yocto-3.1.15" + "dunfell-3.1.15").
    Isn't the "yocto-" tag sufficient by the way?
  * Update the following files in master:
      o documentation/conf.py
      o documentation/poky.yaml
      o documentation/releases.rst
      o documentation/sphinx-static/switchers.js

Would this be a correct workflow? I propose to keep this in a wiki page
by the way, so that updates and notes are easy to manage.

Thanks,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


