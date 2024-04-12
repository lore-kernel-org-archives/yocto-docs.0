Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30452C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 13:05:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.46374.1712927143392764610
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 06:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L6UT6HJk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49C4960003;
	Fri, 12 Apr 2024 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712927141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qOFzZbmruSAcWo2P8uJKV2Mp7hA1LKleNKRK/zWbqoI=;
	b=L6UT6HJknGEi3UPS5N1+OFYgrVvizU4sFBRK6JfpKBnaNcHGKvPRQ5qvKeHPDK/RrAEf1M
	+VVcwUWbPUYaDcGn31TBpyL+mVPCSDlHHKxgGq92cTO+j/5PGv3KOfTM7Nk1/++92R+KwY
	rfXffWWRczW9YwXFUQTm+6LT92iz8fBvSaqPvB0MTweg3piz/q6WWpyrvQq+Fex49fwlNI
	Ax1P2IsPECcXX+iViy0qRBBdHR3Hay4c3ckbZT3j5hbNxe4vMRxmvSuVc2lbtYHB7olcng
	YHJUv2XS4KpuuSLh4Y2czzl85Sp8nlw8qVBOGetDwoOIEK9aeY0jgilTLnK5vg==
Message-ID: <02a20117-fe72-4f90-a371-5bc1755e4b3a@bootlin.com>
Date: Fri, 12 Apr 2024 15:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/3] release-notes-5.0: update bitbake improvement
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240412101957.2071854-1-chee.yang.lee@intel.com>
 <20240412101957.2071854-3-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240412101957.2071854-3-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Apr 2024 13:05:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5120

Hi Lee,

Many thanks for the update!

On 4/12/24 at 12:19, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   documentation/migration-guides/release-notes-5.0.rst | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index 0a0e4e5f3..4ac54e869 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -179,6 +179,10 @@ New Features / Enhancements in 5.0
>      -  ``bitbake.conf``: add ``runtimedir`` to represent the path to the runtime
>         state directory (i.e., ``/run``).
>   
> +   -  Allow disabling colored text output thru environment variable `NO_OUTPUT <https://https://no-color.org//>`__.

Before Quentin catches it, you have a double "https" here.
Fixed.

> +
> +   -  git-make-shallow: added support for git's safe.bareRepository=explicit environemnt.

s/environemnt/environment/
Fixed

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


