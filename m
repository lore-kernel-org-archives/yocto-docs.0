Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDD0ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:57:07 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.72221.1661788618617036660
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 08:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fsnDV1dx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2276A20005;
	Mon, 29 Aug 2022 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661788616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d9SAnf74qhhho8PNGNt6RWJ6jMHB7Npw/T6/xb3UnXE=;
	b=fsnDV1dxWoYuxQZcGJ65XWfQrMwHW42f1b6GA8eyI67ViLMxh+aZXOQLSR/5kukvFeG2D7
	xPPcMxoQOQwzYzBSEwnaPKbs4e4HcQi+BS3A1UxUiH9L1FPoPphhKIG0cUipmRgZypXYwH
	ZRtArWOSWnl5ZDSoPyiuufnUmEb/B+jjsduGi+w2OPXgzXX3gs6fkT+NM//Vf6zoJk4Cfe
	ETl2AnZSnrZ6U6sSfI0hrU9nGJr86ulTe96B0DIFtFxkwA2krhrYQ3J7J+1ZFxwCGjG7h+
	Hi25W7xBM3N3OghAu9l0R17EHabenums+dG3Sg9s2mJmU1dSx6NQkNEGQj1xtA==
Message-ID: <f66c3a21-8396-5083-1d14-d3332e818a2f@bootlin.com>
Date: Mon, 29 Aug 2022 17:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [PATCH] migration guides: add release notes for 4.0.3
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>, docs@lists.yoctoproject.org
References: <20220818013537.3036798-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220818013537.3036798-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Aug 2022 15:57:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3128

Hi Lee,

Many thanks for these release notes, which help a lot in this format.

A few comments though for next time. See below...

On 8/18/22 03:35, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-notes-4.0.3.rst  | 314 ++++++++++++++++++
>   1 file changed, 314 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.3.rst
>
> diff --git a/documentation/migration-guides/release-notes-4.0.3.rst b/documentation/migration-guides/release-notes-4.0.3.rst
> new file mode 100644
> index 000000000..e2e67de24
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-4.0.3.rst
> @@ -0,0 +1,314 @@
> +Release notes for Yocto-4.0.3 (Kirkstone)
> +-----------------------------------------
> +
> +Security Fixes in Yocto-4.0.3
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~


You're missing one "~" character in the headers in this file:

/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/migration-guides/release-notes-4.0.3.rst:5: 
WARNING: Title underline too short.

Security Fixes in Yocto-4.0.3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I fixed this by myself.

You also missed to add the new file to migration-guides/release-4.0.rst. 
I fixed it too.

Everything else is just perfect.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Many thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


