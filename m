Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FFBC4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 17:38:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.19.1666114697106688086
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Oct 2022 10:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cTVpf5Rw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A0446C0002;
	Tue, 18 Oct 2022 17:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666114695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2W8dEbnZbUAv6Fv6+wSgfThkQiwxWzjvDpPqfFyDEKE=;
	b=cTVpf5RwWkO3/y456YYsDN8wPtTR2BI1Qb6Gc6QsnmXmmTuygwLuprBhHnrbBKy6ix4Ob5
	idI2SDCd4nwRi/7cgse1a1bNh6pchdpDpfVkEG0gDM/8hpAtZehqmnOD+ig9Eo38Mf7Ww3
	VtyNchBkkhqchXPCZ0Shc2FS0NMwkVu0BZZuIPb9+/oI9H30gwSLWauaYL6yHZUT/5QW16
	n12TlTLaZmKjBskEfcVidLqvcpLTijOrBCfjtKj0zohmm50COPK8iU4nlSaJVsOt+5poJl
	yo9Q4FZqM3wu125tlXGAPM5uH09sx4T4Qi8oaGg6yJV4pKGFH7MpRAIjupmQ0Q==
Message-ID: <8e1dbf42-f144-8b2d-f2d7-dfbcb667d1df@bootlin.com>
Date: Tue, 18 Oct 2022 19:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: nd@arm.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides/release-notes-4.1.rst: add more
 known issues
To: Ross Burton <ross.burton@arm.com>
References: <20221018164412.964305-1-ross.burton@arm.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221018164412.964305-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Oct 2022 17:38:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3372

Hi Ross

On 10/18/22 18:44, Ross Burton wrote:
> Clarfify the eSDK issue, and document the externalsrc issue.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   .../migration-guides/release-notes-4.1.rst         | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
> index be722356d..0c552bf1a 100644
> --- a/documentation/migration-guides/release-notes-4.1.rst
> +++ b/documentation/migration-guides/release-notes-4.1.rst
> @@ -195,9 +195,17 @@ Known Issues in 4.1
>     into the image.  Filed as :yocto_bugs:`bug 14928 </show_bug.cgi?id=14928>`.
>   
>   - There is a known issue with eSDKs where sstate objects may be missing,
> -  resulting in packages being unavailable to install in the sysroot. This is
> -  under investigation and appears to be related to hash equivalence. Filed as
> -  :yocto_bugs:`bug 14626 </show_bug.cgi?id=14626>`.
> +  resulting in packages being unavailable to install in the sysroot. This is due
> +  to image generation optimisations having unintended consequences in eSDK
> +  generation. This will be resolved in the next point release.  Filed as
> +  :yocto_bugs:`bug 14626 </show_bug.cgi?id=14626>`, which also details the fix.
> +
> +- The change to :ref:`migration-4.1-classes-split` inadvertently moved the
> +  :ref:`externalsrc <ref-classes-externalsrc>` class to ``meta/classes-recipe``,
> +  when it is not recipe-specific and can also be used in a global context.  The
> +  class will be moved back to ``meta/classes`` in the next point release.  Filed
> +  as :yocto_bugs:`bug 14940 </show_bug.cgi?id=14940>`.
> +
>   
>   Recipe License changes in 4.1
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Thanks for the update.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
To make release notes easier to access and contribute to, merged into 
"master-next" together with yesterday's patch.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


