Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB92C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 15:56:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.140321.1712678173297914386
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 08:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A6E2/F79;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1734A240004;
	Tue,  9 Apr 2024 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712678171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KStPFafM0VYl+WuTRxHqr5A+v/EX3h4tHU/J9EfC9Qc=;
	b=A6E2/F79/wjQmIZCZR+aA9yToUYBQiCwQN84gJ4pD1Txv/kJPGHl0ynJmBu0xlItKcuuPm
	aeftNXSPtYlYFuQ1Q17udY19saJwsgSj1w4MHWhYPnoLRdSsrMM/TJL7NCOvsCq6Ih5EIu
	9oYOY9FmBx72ayP55sPqw6Md4rQ8W9WjoMsSSvMc2AWiJuQ0W0CxA7b1nAT6V6TtnNIvpR
	4R2ghiJTFILXuGxCiktzT6qnHdU9FqEaAAmfBrPqShM2C4g9uznIeFn32weuq3hY02P30q
	B6stEMoe3kiK28bgbcf3VJ9H/pK4ABLkJgaJ96R9Q1GCcWZARwli7N02wtFf2g==
Message-ID: <c6f8fad0-017d-4cb2-b3b3-97427a43d010@bootlin.com>
Date: Tue, 9 Apr 2024 17:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH 1/2] ref-manual: variables: document
 CVE_DB_INCR_UPDATE_AGE_THRES variable
To: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
References: <20240409145544.3115398-1-yoann.congal@smile.fr>
 <20240409145544.3115398-2-yoann.congal@smile.fr>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240409145544.3115398-2-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Apr 2024 15:56:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5095

Hi Yoann

On 4/9/24 at 16:55, Yoann Congal wrote:
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   documentation/ref-manual/variables.rst | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 52062b63f..97abb398c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1688,6 +1688,11 @@ system and gives an overview of their function and contents.
>         The list of package names (:term:`PN`) for which
>         CVEs (Common Vulnerabilities and Exposures) are ignored.
>   
> +   :term:`CVE_DB_INCR_UPDATE_AGE_THRES`
> +      Specifies the maximum age of the CVE database in seconds for an
> +      incremental update (instead of a full-download). Use "0" to force a
> +      full-download.
> +
>      :term:`CVE_DB_UPDATE_INTERVAL`
>         Specifies the CVE database update interval in seconds, as used by
>         ``cve-update-db-native``. The default value is "86400" i.e. once a day


Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next"
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


