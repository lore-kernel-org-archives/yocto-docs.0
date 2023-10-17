Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A546CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 11:29:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.210420.1697542142571937070
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 04:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f/Y7jdSl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F7191BF208;
	Tue, 17 Oct 2023 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697542140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxR/LBb7WIvXHXQSSyVx0WlujQAafA9qRJHzO5a3CoI=;
	b=f/Y7jdSlXfj1+f/CAuyJ2X/u+1zuWQoe67EgLUgwtMZ8oGjc9OxQf1bPRLR9jMou7eY3Jb
	LG5Qk4YWcvpTMldRDdZWa/9BqJd4BJF34KOp9oxnfY36qnCT0nTqqOWSuxPXyskba+kEzo
	NgMKd/J8SlSMPR8NrsUJn1uB1N8x2i6AVZ1i/shsk6NYOCEO9x/6q90Ogqm+1sHwzMmSvB
	1w1bfw1NLzFWHC+9jCYq8iRJKNJJ9M6c01HNe19fbelNkThE828ox1nJ6Y4d4SgCEJbJ8D
	B+gE75r7LvBB4dbgV94TR8p1FdH9BvmtjUQFyCojzdGUd4ujDqlFu73wXKdyuA==
Message-ID: <088e6d89-0d81-4830-ac53-133bc0eed26a@bootlin.com>
Date: Tue, 17 Oct 2023 13:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] Add notes about layer.conf
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231016120607.3054101-1-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231016120607.3054101-1-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 11:29:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4392

Hi Talel,

Thanks for this patch!

On 16.10.23 at 14:06, BELHADJ SALEM Talel wrote:
> Remove the second note in the previous PATCH as it's not accurate and can cause confusion.
>
> As discussed before with Richard Purdie, the code supports this but the documentation is not.
> Developers in general will not notice this or focus on it because they do not mess with the
> layer.conf template file, but in my opinion I think more details can help.
>
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>


Actually, we don't want the "Remove the second note..." line here as it 
would appear in the final commit message. The commit history should hide 
the review process and information about draft versions of the changes.

You can add notes for reviewing after a "---" line after the 
Signed-off-by information. They won't appear in the final commit 
messages when the patches are applied.

> ---
>   documentation/dev-manual/layers.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index 2d809562d..070d82ee3 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -128,6 +128,16 @@ Follow these general steps to create your layer without using tools:
>         variable is a good way to indicate if your particular layer is
>         current.
>   
> +
> +   .. note::
> +
> +      A layer does not have to contain only recipes `.bb` or append files `.bbappend`.
> +      Generally, developers create layers using `bitbake-layers create-layer`, see
> +      ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`", that
> +      creates the `layer.conf` file from a template located in `meta/lib/bblayers/templates/layer.conf`.
> +      In fact, all the variables set in `layer.conf` are not mandatory except for the precense of


Please use double backquotes in the above lines, instead of single ones.

s/precense/presence/

> +      :term:`BBFILE_COLLECTIONS` will lead to the obligation of :term:`LAYERSERIES_COMPAT`, and :term:`BBFILE_PATTERN`.


This last sentence is difficult to understand. Did you mean...

"In fact, all the variables set in ``layer.conf`` are not mandatory, 
except when :term:`BBFILE_COLLECTIONS` is present. In this case, 
:term:`LAYERSERIES_COMPAT` and :term:`BBFILE_PATTERN` will have to be 
defined too."?

Thanks in advance for the update.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


