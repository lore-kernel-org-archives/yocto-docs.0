Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAB1C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 09:35:43 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.18034.1709631342984446647
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 01:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oIi+FWeQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC5BCFF80B;
	Tue,  5 Mar 2024 09:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709631341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqW+QnuUWSRTAumwykVL1/yiw5N5S4DYwR/hj1UW8LY=;
	b=oIi+FWeQV7W/UUfzjuID9dEU5UrilVcw9OdozsaHgF/9Zlu+QedlV8uG9zm6X31J+EBdqP
	hmrEaJUcc6B8XIBBPW6fRvs6f9XGt7iIzvtUNiouB1GzVTdnurnkHNqbzlSZE9205CbK3L
	OBnUoxtXXf3VeZUOuUym3h7qnVeJuzJC5cAS2J/O2/k7OP+9HGUU6iGur0zTf8JOMvEVw/
	EMrkLwBNHXppIsxJ1s1GmaRKwGOiqctgG3Y6s3Oy3pqbPu7B8sswrQJtNvVe/7jqqd8+g7
	/14tsVcJvXcQ6/v1wQsmSS0OHIpUDW2iw5rpzC0gBBkh51a9fmCO+F4OeyBPCA==
Message-ID: <4b351273-4d37-4c1f-93bc-c6d726c9f90c@bootlin.com>
Date: Tue, 5 Mar 2024 10:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] contributor-guide: Add notes for tests
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>
References: <20240304205038.9060-1-simone.p.weiss@posteo.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240304205038.9060-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Mar 2024 09:35:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4931

Hi  Simone,

Many thanks for the new patch!
I have my own suggestions...

On 3/4/24 at 21:50, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> This adds some hints that and how chnages should be tested when contributing.


s/chnages/changes/

>
> Fixes [YOCTO #15412]
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>   .../contributor-guide/submit-changes.rst      | 37 ++++++++++++++++++-
>   1 file changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 61f3157d6..d2167a2f3 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -221,6 +221,38 @@ to add the upgraded version.
>      <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>`__
>      in the Linux kernel documentation.
>   
> +Test your changes
> +-----------------
> +
> +For each contributions you make, you should test your changes as well.
> +For this the Yocto Project offers several types of tests. Those tests cover
> +different areas and it depends on your changes which are feasible. For example run:
> +
> +   -  For changes that affect the build environment:
> +
> +      -  ``bitbake-selftest``: for changes within BitBake
> +
> +      -  ``oe-selftest``: to test combinations of BitBake runs
> +
> +      -  ``oe-build-perf-test``: to test the performance of common build scenarios
> +
> +   -  For changes in a recipe:
> +
> +      - ``ptest``: of the package, if it exists

"Run package specific tests, if they exist"?

Thanks again
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


