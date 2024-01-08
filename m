Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86F5C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:31:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.8048.1704724283513344469
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 06:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fPqz7abj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F30DFF80A;
	Mon,  8 Jan 2024 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704724281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zAkULtMkkSZDCgyqOqcsPj3d5XG/+1Sq1qWSo3yYHUs=;
	b=fPqz7abjM+tghrsZa2rJqFaXyTPQvWeWnaK6l9c42adezrWTrk5TE/8JLd0goaVaiZTCqE
	otWDLCjUz01IJJxlYAwnOutQTfP8qHSvGErIdvKYpm0/QAooLlOd5jRi/9iQNIUbxp55SJ
	YsdTsvOWqGO8JwKpv3ZrP3Ci00q5nth8Z3eQburFv4SJ4baRWO9/WYv5RGu1ldhtgqDtD/
	ioS5VneRuYUG22VeNFxaOqd14X5LVuWq/urmJ38Utav8/hSq+/Ol3AGCfKmyeCbix7rVUl
	SECg7gVeAbWf0axlEKdVG2INFZL1Qg5dmKzzcRXqRH8CkWPreyKETYbObuldsw==
Message-ID: <f9f97504-a57d-4f6a-b988-9f9c9e19cb3b@bootlin.com>
Date: Mon, 8 Jan 2024 15:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: start.rst: Update use of Download page
Content-Language: en-US
To: simone.p.weiss@posteo.com
References: <20231223115124.62413-1-simone.p.weiss@posteo.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231223115124.62413-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jan 2024 14:31:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4744

Hi Simone,

Thanks a lot for the update!

On 23.12.23 at 12:51, simone.p.weiss@posteo.com wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> The yocto website has changed its structure. Update the section for
> Accessing the Downloads page to match the new structure.
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>   documentation/dev-manual/start.rst | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> index 4a556967e..f2027badd 100644
> --- a/documentation/dev-manual/start.rst
> +++ b/documentation/dev-manual/start.rst
> @@ -621,7 +621,7 @@ a selection of these components.
>   Using the Downloads Page
>   ------------------------
>   
> -The :yocto_home:`Yocto Project Website <>` uses a "DOWNLOADS" page
> +The :yocto_home:`Yocto Project Website <>` uses a "RELEASES" page
>   from which you can locate and download tarballs of any Yocto Project
>   release. Rather than Git repositories, these files represent snapshot
>   tarballs similar to the tarballs located in the Index of Releases
> @@ -630,11 +630,13 @@ described in the ":ref:`dev-manual/start:accessing source archives`" section.
>   #. *Go to the Yocto Project Website:* Open The
>      :yocto_home:`Yocto Project Website <>` in your browser.
>   
> -#. *Get to the Downloads Area:* Select the "DOWNLOADS" item from the
> -   pull-down "SOFTWARE" tab menu near the top of the page.
> +#. *Get to the Downloads Area:* Select the "RELEASES" item from the
> +   pull-down "DEVELOPMENT" tab menu near the top of the page.
>   
> -#. *Select a Yocto Project Release:* Use the menu next to "RELEASE" to
> -   display and choose a recent or past supported Yocto Project release
> +#. *Select a Yocto Project Release:* On the top of the "RELEASE" page currently
> +   supported release are displayed, further down past supported Yocto Project


s/release/releases/
I fixed this by myself.

> +   releases are visible. The "Download" links in the rows of the table there
> +   will lead to the download tarballs for the release.
>      (e.g. &DISTRO_NAME_NO_CAP;, &DISTRO_NAME_NO_CAP_MINUS_ONE;, and so forth).
>   
>      .. note::
> @@ -645,9 +647,9 @@ described in the ":ref:`dev-manual/start:accessing source archives`" section.
>      You can use the "RELEASE ARCHIVE" link to reveal a menu of all Yocto
>      Project releases.
>   
> -#. *Download Tools or Board Support Packages (BSPs):* From the
> -   "DOWNLOADS" page, you can download tools or BSPs as well. Just scroll
> -   down the page and look for what you need.
> +#. *Download Tools or Board Support Packages (BSPs):* Next to the tarballs you
> +   will find download tools or BSPs as well. Just select a Yocto Project
> +   release and look for what you need.
>   


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next, and will backport to other maintained branches.
Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


