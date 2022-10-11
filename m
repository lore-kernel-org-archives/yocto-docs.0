Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF0EC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:08:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.4723.1665475711748477937
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 01:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XA+mH9gA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8746040004;
	Tue, 11 Oct 2022 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665475709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4czF35652EOHE+BFwyZXoHpw8dFfxIPm1QUtn2U6TEw=;
	b=XA+mH9gAHf/yxHGhIwyFrt81fRY5fXWPUx2XdYBeVFYSSRZVIZiPvCMKiN2POrLAr7vC8/
	KTgWoWaotyBJ7ZGf+6vnaka6t7nq+o+3KfZfC8t7ZBxz8vuWNPWda7Ny4JxnAG8jytJno7
	BiVaq3hCdR/9bYE5XgN44X/SCWCCVHjDxSQvi8XbRgERprKFRoWyOjgs/UspMNhPPLDeQz
	QbCwJ7iUyLDG41DJDiwK42Q4AK0UnMHWKjEaEpZKHWxMfZZsKwHv1Kr71Jlu5018HLj4pa
	orcXZVWLRwcjKsymMiRXtzbNB/as/imuagZO+HRQC9BgKDbcUu5yTv3j4OJhxQ==
Message-ID: <32988c6f-4204-f716-8674-ef2fb3554a02@bootlin.com>
Date: Tue, 11 Oct 2022 10:08:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 01/34] migration-general: add section on using
 buildhistory
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <6b333891e6614888bf6de5425db77e7ab856dabe.1665392835.git.paul.eggleton@linux.microsoft.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <6b333891e6614888bf6de5425db77e7ab856dabe.1665392835.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Oct 2022 08:08:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3346

Hi Paul

Many thanks for all these patches!

On 10/10/22 11:23, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>
> Add a short section recommending the use of buildhistory to compare
> the build output before and after migration.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   .../migration-guides/migration-general.rst         | 33 ++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/documentation/migration-guides/migration-general.rst b/documentation/migration-guides/migration-general.rst
> index 9eecf69..8b22508 100644
> --- a/documentation/migration-guides/migration-general.rst
> +++ b/documentation/migration-guides/migration-general.rst
> @@ -70,3 +70,36 @@ any new Yocto Project release.
>        bitbake-layers show-appends
>   
>   
> +.. _migration-general-buildhistory:
> +
> +- *Checking Image / SDK Changes*:
> +
> +   The :ref:`buildhistory <ref-classes-buildhistory>` class can be used
> +   if you wish to check the impact of changes to images / SDKs across
> +   the migration (e.g. added/removed packages, added/removed files, size
> +   changes etc.). To do this, follow these steps:
> +
> +   1. Enable buildhistory before the migration
> +
> +   2. Run a pre-migration build
> +
> +   3. Capture the buildhistory output (as specified by :term:`BUILDHISTORY_DIR`)
> +      and ensure it is preserved for subsequent builds. How you would do this
> +      depends how you are running your builds - if you are doing this all on


s/depends how/depends on how/?
The rest looks good.
Thanks again

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


