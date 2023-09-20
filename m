Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D53CCE79D2
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 14:12:02 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.40719.1695219112490006700
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 07:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GiCa4NhD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 013ED4000B;
	Wed, 20 Sep 2023 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695219110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YafwOQMUSTNxjxo6M730pz2HpEF7UcUkMI7Pl1Tnhg=;
	b=GiCa4NhDWSubkMHSpACm8vC2Sd2Dbr9fcKmH+CIW4aF0YtQAjmTWjgZB8Ltcuk3v1vCDyi
	t9Z/goqLGixbgkpo8eeYrL6Gv4Ud5afcNuQyFTNM6Ej1gYA7iKfP82hZHfGwlmkUIibnWM
	R8/dD2p8G6vM8ddVPqLn9h4MH3sualGylYvvaAHWKWLPvwdX0e8EU7DjQJLDF9NfZpk6Kj
	T2wsHG79RZSgYo5IEevoOYWSHzV4M1z+Txu29t8rEqghgWBhE/0x/8mc9MwFaTbpZkxQKD
	V0fchbEN/mgwRYKGtpDPgQ0l2w1n+xYDbs3BcqqlvuG+slHLgvDYUV4il5TUkQ==
Message-ID: <88d5ed59-f2bb-9472-2efb-099bc8d0ef96@bootlin.com>
Date: Wed, 20 Sep 2023 16:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: yocto@pengutronix.de
Subject: Re: [docs] [PATCH 1/4] contributor-guide: recipe-style-guide: add
 section about CVE patches
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>, docs@lists.yoctoproject.org
References: <20230920100647.1038583-1-rhi@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230920100647.1038583-1-rhi@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 14:12:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4270

Hi Roland

Many thanks for the update!

See my comments below...

On 20.09.23 at 12:06, Roland Hieber wrote:
> This was previously included in the OpenEmbedded wiki page [1], but was
> not ported along with the rest in commit 95c9a1e1e78bbfb82ade
> (2023-09-12, Michael Opdenacker: "contributor-guide: recipe-style-guide:
> add Upstream-Status").
>
>    [1]: https://www.openembedded.org/index.php?title=Commit_Patch_Message_Guidelines&oldid=10935
>
> Group the examples in their own sections.
>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
> This is basically v2 of "[PATCH] contributor-guide: add docs for
> Upstream-Status patch headers", Message-Id:
> <20230919111549.997443-2-rhi@pengutronix.de>
> <https://lists.yoctoproject.org/g/docs/topic/resend_patch/101455254>
> rebased onto master-next, but since it looks so different now I made a
> new v1 patch out of it.
>
>   .../contributor-guide/recipe-style-guide.rst  | 27 ++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> index 99105179a6b9..52ab4523c49f 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -321,7 +321,17 @@ the status should be changed to ``Submitted [where]``, and an additional
>   ``Signed-off-by:`` line should be added to the patch by the person claiming
>   responsibility for upstreaming.
>   
> -For example, if the patch has been submitted upstream::
> +CVE patches
> +-----------


I've got an issue with this... This makes the "CVE patches" section a 
subsection of "Patch Upstream Status".
Could you instead use?

CVE patches
========

> +
> +In order to have a better control of vulnerabilities, patches that fix CVEs must
> +contain a *"CVE:"* tag. This tag list all CVEs fixed by the patch. If more than


s/*"CVE:"* tag/``CVE:``/
to match the way Upstream-Status was introduced

> +one CVE is fixed, separate them using spaces.
> +
> +Examples
> +--------
> +
> +Here's an example of a patch that has been submitted upstream::
>   
>      rpm: Adjusted the foo setting in bar
>   
> @@ -336,3 +346,18 @@ For example, if the patch has been submitted upstream::
>   
>   A future update can change the value to ``Accepted`` or ``Denied`` as
>   appropriate.
> +
> +This should be the header of patch that fixes CVE-2015-8370 in GRUB2::

s/of patch/of the patch/

We have a macro for CVEs:
s/CVE-2015-8370/:cve:`2015-8370`/

I know, you can't know this ;-)

> +
> +   grub2: Fix CVE-2015-8370


Could you add this section to another "Examples" subsection, dedicated 
to the "CVE:" tag? This way, each section (Upstream-Status and CVE) has 
its own examples subsection, and we don't have to create an "Examples" 
section which applies only by the last two sessions (a bit weird).

Thanks in advance,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


