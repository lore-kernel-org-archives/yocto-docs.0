Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD9DC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:39:18 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.32256.1641825556533102121
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 06:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AB43CC000B;
	Mon, 10 Jan 2022 14:39:14 +0000 (UTC)
Subject: Re: [docs] [PATCHv3] ref-manual: Add documentation of
 PACKAGE_DEBUG_FILE_SUFFIX
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 docs@lists.yoctoproject.org
References: <20220107170433.1958-1-pkj@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <cd2aa2b1-7de3-aadb-bdb9-9471fab1f62b@bootlin.com>
Date: Mon, 10 Jan 2022 15:39:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107170433.1958-1-pkj@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Jan 2022 14:39:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2367


On 1/7/22 6:04 PM, Peter Kjellerstedt wrote:
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> PATCHv2: Removed the reference to split_and_strip_files().
> PATCHv3: Changed "dbg package" to "``-dbg`` package".
>
>  documentation/ref-manual/variables.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index e81a12030a..aaba23dbdf 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5085,6 +5085,14 @@ system and gives an overview of their function and contents.
>        result of the package manager in use, see the
>        ":ref:`package.bbclass <ref-classes-package>`" section.
>  
> +   :term:`PACKAGE_DEBUG_FILE_SUFFIX`
> +      This suffix is added to the names of all files with debug symbols that go
> +      into the ``-dbg`` package. It can be used to make the debug files produced
> +      by one recipe unique to avoid them conflicting with identically named
> +      debug files produced by another recipe. This may be needed since while the
> +      target files may be split in multiple packages, the debug files for one
> +      recipe are all in one package.
> +
>     :term:`PACKAGE_DEBUG_SPLIT_STYLE`
>        Determines how to split up and package debug and source information
>        when creating debugging packages to be used with the GNU Project


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks for the patch!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


