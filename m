Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6C4C7EE29
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 08:22:26 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.3507.1686126139089119565
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 01:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C1Lu8MIP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686126137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ECVU7kXUFtxJDBDDAaFvniqlFvAaPZHOmvD2WFOwfy8=;
	b=C1Lu8MIPi2zxgxjAFxKrYtM/fV8J//Ravf8I5LOaWTWklPYlDWsTBD62DK0G4a/NHh8NEW
	ZKjBILfevGAFUf18GTB/AQChaYFyt8Xa/nnYzaD9OTHUbq7kPE4Q6hLOZzW7LSQlb+Z9kR
	XoUlWvijTleeXUbm9nw6JGod+LBCyA9yw3SoKU3P5nADOZgJLWoO7Kg+TFl+IXO/oUbx8I
	Ed82i+qtdQYy2SoJz8szqOHb8s7gEeUGYk6Qi0dRbvoT6BHnUS3tuyOvWDDpy9AyH7CIYY
	7GKv0kU5T5m1IJJ0JJ+JxXv1mcIZcJZchJrK+FyVT1hRXLH3hOwfkqtW4kJEMg==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCB961C0005;
	Wed,  7 Jun 2023 08:22:16 +0000 (UTC)
Message-ID: <37f36f58-7697-9b9a-649c-dc899ccd9ced@bootlin.com>
Date: Wed, 7 Jun 2023 10:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] Add clarification for SRCREV
Content-Language: en-US
To: beroset@ieee.org
References: <20230606180931.369018-1-beroset@ieee.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230606180931.369018-1-beroset@ieee.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jun 2023 08:22:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3988

Hi Ed

On 06.06.23 at 20:09, Ed Beroset via lists.yoctoproject.org wrote:
> It was not clear to me what a "full revision identifier" was in the
> context of the note documenting SRCREV.  After clarification via IRC,
> this submission attempts to clarify what is meant to help future
> readers.
>
> Signed-off-by: Ed Beroset <beroset@ieee.org>
> ---
>   documentation/ref-manual/variables.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 6a7888ab4..5b96e4efe 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7942,7 +7942,7 @@ system and gives an overview of their function and contents.
>         that if you want to build a fixed revision and you want to avoid
>         performing a query on the remote repository every time BitBake parses
>         your recipe, you should specify a :term:`SRCREV` that is a full revision
> -      identifier and not just a tag.
> +      identifier (e.g. the full SHA hash in git) and not just a tag.
>   
>         .. note::


Many thanks for the patch!
Everything looks good, except that your patch is received through "Your 
Name via lists.openembedded.org" or "Your Name via 
lists.yoctoproject.org". We'd need you to do add one thing to your git 
configuration, so that your patches are given an "Author" field which 
matches your "Signed-off-by" information. See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity 
for details.

Don't hesitate to send a patch test directly to me, if you wish.
Thanks in advance
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


