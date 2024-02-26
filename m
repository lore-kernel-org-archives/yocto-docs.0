Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1475FC54E41
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 13:57:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.20557.1708955815727952808
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Feb 2024 05:56:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QE0SrcYU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7A56240008;
	Mon, 26 Feb 2024 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708955814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MPNuDoW1RbY3klALWX8HivYxzggYcUOT4JBKIqAS0Wg=;
	b=QE0SrcYUKPaZgDm1N71r6EEcIlJ31dEOB1z1be2XiLNrYvRHXnFf/r/zZN19gp0Zi9LxFn
	1V87gf6EDBmH8iKiGjViZE6a9xjJ9Itk2D+qiShWufskAl4GR6NLGYTDcA/kBTkNt1P5bf
	H2gFEegKkbm1AUzhs20deObKcVqRxONcX3QvmAN5FUysy6q/wBrX0Z477CWRDsQcKxzNPB
	tE4jgluGGo/xk5CtK2rKqyphkcU0b77Y8uph+P+7F55nkYuqUSunSnVzjWeNS2iMzYqUWv
	DzU00wzGdraOfagSFdRMf3gIMUQP1V3UXIiwop5VrYE2lfjRodmIdLhhEWZmEA==
Message-ID: <1ae18e69-188a-43aa-a779-0ddfbb192065@bootlin.com>
Date: Mon, 26 Feb 2024 14:56:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: classes: Add cve status check for
 oe.qa
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>
References: <20240224172214.557369-1-simone.p.weiss@posteo.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240224172214.557369-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Feb 2024 13:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4873

Hi Simone

On 2/24/24 at 18:22, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> With a new check was added for oe.qa for CVE_STATUS via commit
> 3c5b7605acd9cd68b ("cve-check: Log if CVE_STATUS set but not
> reported for component")
> in poky. Add related documentation here.
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>   documentation/ref-manual/classes.rst | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 844433c55..4f1188ef2 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1297,6 +1297,11 @@ Here are the tests you can list with the :term:`WARN_QA` and
>      paths to locations on the build host were used. Using such paths
>      might result in host contamination of the build output.
>   
> +-  ``cve_status_not_in_db:`` Checks for each component if CVEs that are ignored
> +   via :term:`CVE_STATUS`, that those are (still) reported for this component
> +   in the NIST database. If not, a warning is printed. This check is disabled
> +   by default.
> +
>   -  ``debug-deps:`` Checks that all packages except ``-dbg`` packages
>      do not depend on ``-dbg`` packages, which would cause a packaging
>      bug.
>

Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


