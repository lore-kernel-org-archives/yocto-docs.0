Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1AAC4167E
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.4691.1649157728740783062
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 04:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kavuijMy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BC6ACFF809;
	Tue,  5 Apr 2022 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649157727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBjOl3V3cx/A/Blw5zWjordh5HYFaPn/IRPcNg1QqEg=;
	b=kavuijMyLpZkGxV/E6OwA8akPG4igqpSh3q0QmWllCAYg2jpxVXXjwQs1r4WJlbIGkqL+y
	OVfdrnl0yjVTMHgaHzRoqXUrDF71G6yx8/cnDLPwVMUYcGptyQArO0HJgWh7iP0jteUe7R
	+4cdL1gejCJahI/Pchadln+4/aRc8mCVzWvD2rzXqox9Z5SxHREBQ4YP3ZBqKJir++eY0f
	pojMJKbEFfbc1QQXggjYpoafy+KOdi3MqlcPEG30Mn3iV+dcRk4CEzcWFHRv/M9KMUQMYL
	VUdJfg9C2oFA77x3VohF5KCv2J6bFXo2B07u94bhw2kDrWVZETdto4k74Te2ow==
Message-ID: <744f3ac0-2405-e588-3ad5-66a5e096637c@bootlin.com>
Date: Tue, 5 Apr 2022 13:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH] Added command used to add the signed-off-by line.
Content-Language: en-US
To: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>,
 docs@lists.yoctoproject.org
References: <20220404125435.8545-1-abongwabonalais@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220404125435.8545-1-abongwabonalais@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2755

Hi Abongwa,

On 4/4/22 14:54, Abongwa Amahnui Bonalais wrote:
> Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 9d4aaa5a6..4e4311021 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10595,7 +10595,8 @@ Preparing Changes for Submission
>     following these accepted conventions:
>  
>     -  Be sure to include a "Signed-off-by:" line in the same style as
> -      required by the Linux kernel. Adding this line signifies that you,
> +      required by the Linux kernel.This can be done by using the ``git commit -s`` command.
> +      Adding this line signifies that you,
>        the submitter, have agreed to the Developer's Certificate of
>        Origin 1.1 as follows:

Thanks for the patch.
I added a missing space and improved alignment. I also fixed the title
string... that's useful to clarify that the commit is part of the
documentation, because the commit ultimately ends up in the Poky
repository. That's useful to recognize the documentation commits then.

I also did that for the previous patch.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.
Thanks!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


