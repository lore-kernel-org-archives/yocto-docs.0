Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5E9C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 09:40:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.9286.1672911596027791240
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 01:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kC1J8pJL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B0D23FF807;
	Thu,  5 Jan 2023 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672911593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATuAMPelqrwfXO/2c+TE1bGw6srIyUTIxciza6ldSw4=;
	b=kC1J8pJLXzX4/B+LwlwAAd6BmBbaBSHOrMOsEBf2kdCMhu6NYGclTqfti+S8++IjkzhEkw
	PTx6YSSqm60DE7i6FyVqFClTiXTd09chk/800jgjhWjaohoawNrSYRIlMtmuNRacUvkpg2
	vd949d6H6Mj7wo4bAkkGrW3nVpOkfc+YlvNwvAVPb141Ix/mXVvDHOuoELdtd26NAr61jh
	x8Rgcw7MFuG8YV9QQ3lcOVTGKxLT/aDPj5y5SUr8mtgO4VzAbZnezzqhg5cfazlyNUY1zt
	ELfx2j7CKNUy4dr3VcWPRp6rtA2glZ/tKFFrgSUJ4uDm0BAz4Anir2JlnOiL+g==
Message-ID: <00c5d84a-cca0-9e02-a6e4-7510078c727d@bootlin.com>
Date: Thu, 5 Jan 2023 10:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/2] update tip on how to include (or not) kernel
 in image rootfs
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, Quentin Schulz <foss+yocto@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>
References: <20230103-no-kernel-rootfs-v1-0-33f7abb94410@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230103-no-kernel-rootfs-v1-0-33f7abb94410@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 09:40:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3582

Hi Quentin

Am 03.01.23 um 18:36 schrieb Quentin Schulz:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> Since commit f6d963fa6d0e ("kernel: make kernel-base recommend
> kernel-image, not depend"), present in Kirkstone 4.0, one should
> set RRECOMMENDS and not RDEPENDS to avoid including the kernel in the
> image, so let's update the documentation to reflect that.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> ---
> Quentin Schulz (2):
>        docs: kernel-dev: faq: update tip on how to not include kernel in image
>        docs: migration-guides: migration-4.0: specify variable name change for kernel inclusion in image recipe
>
>   documentation/kernel-dev/faq.rst                 | 2 +-
>   documentation/migration-guides/migration-4.0.rst | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> ---
> base-commit: 5b5c2af6127eabda8eb07645546fa2cdfc462154
> change-id: 20230103-no-kernel-rootfs-f42080d8dabf
>
> Best regards,
>

Many thanks for the patches! For both patches:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


