Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19EFC64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:44:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.18298.1677663876778915156
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:44:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=p276aKhP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D181C40019;
	Wed,  1 Mar 2023 09:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677663874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQ5PeU2XMGY2Dnlg6t06GeRoc3jKk8/TA9Ly+le6v9Y=;
	b=p276aKhPa4nepKWqA5Ic5s2XopRlXsXdb6SllAeRGr7gr3j3lfYONImj+CWdgZ6JeVgFtb
	u9uoJavw1xhTrVldJTfM8lo7dGt2GCQ5BqgwoW0dXBd3byLWImhUMFzlyy+I+zHLgAjJaT
	AKaLWLbQ9ebFC8KW8za6VX1g2b08oJzP7IRWDIYoc77KXIy+MWTK/NLkuZ0ydsGuGn9pap
	yqhUefAbMkwJd4GZeAqPRq+vS9D6AHpgM9PDGHvqcxOZ6IRTDDmtk4e0+VXylSxvMMU85e
	lRRZ9p/tZ/L5b4V5pZK930xWIBa8/7/MR/KUZtQPXyYU54thhFqQUlftQC7FmA==
Message-ID: <cd39cbba-51e6-3c91-24c2-41c1edaed0c2@bootlin.com>
Date: Wed, 1 Mar 2023 10:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/1] ref-manual: Add info on "mixin" layers
Content-Language: en-US
To: Yoann Congal <yoann.congal@smile.fr>
References: <20230228221309.82156-1-yoann.congal@smile.fr>
 <20230228221309.82156-2-yoann.congal@smile.fr>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230228221309.82156-2-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:44:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3762

Hi Yoann

Many thanks for the patch!

On 28.02.23 at 23:13, Yoann Congal wrote:
> This is heavily inspired from:
> https://wiki.yoctoproject.org/wiki/index.php?title=Stable_Release_and_LTS&oldid=84847#LTS_.E2.80.9CMixin.E2.80.9D_repositories
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   documentation/ref-manual/release-process.rst | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
> index 19e804063..cc464447f 100644
> --- a/documentation/ref-manual/release-process.rst
> +++ b/documentation/ref-manual/release-process.rst
> @@ -97,6 +97,21 @@ through the same release process as do point releases. You can find more
>   information about stable branch maintenance at
>   :yocto_wiki:`/Stable_branch_maintenance`.
>   
> +.. note::
> +
> +   In some circumstances, a layer can be created by the community in order to
> +   add a specific feature or support a new version of some package for an LTS.


s/LTS/LTS release/ ?

> +   This is called a "mixin" layer. These are thin and specific purpose layers
> +   which can be stacked with an LTS release to "mix" a specific feature into
> +   that build. These are created on an as needed basis and maintained by the
> +   people who need them.

> The "mixin" layers are found here :
> +   :yocto_git:`/meta-lts-mixins`.


This makes me wonder about how official these are, though we said they 
are not officially supported by the project itself. Maybe we could just 
mention this repository in the next paragraph...

> +
> +   Policies on testing these layers depends on how widespread their usage is


s/depends/depend/

> +   and determined on a case by case basis. Note that there may be other "mixin"
> +   layers within the wider community too.


What about replacing the last sentence by

"You can find "mixin" layers released in the :yocto_git:`meta-lts-mixins 
</meta-lts-mixins>` repository, but other such layers may be released 
elsewhere by the wider community."

?


Thanks again for this patch.
Once this one is merged, we need another pass on the page, as there are 
obsolete and missing details. LTS releases are not mentioned yet, and 
other releases are not supported for one year any more. I also saw some 
links that should be updated.

Thanks again

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


