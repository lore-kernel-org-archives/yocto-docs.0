Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E1ECDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 09:26:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.202843.1697534759883562292
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 02:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=G9Wk/bmA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5D2FC0003;
	Tue, 17 Oct 2023 09:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697534758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSBIfXY9aIzZjq/eQ5rJfSGMDi6OKLLe1sl3+heoowU=;
	b=G9Wk/bmAT/LIj9uz+c7DyZw4b8FnmHIxN/J8S64jhsMlf4tHeTWFD8nAtA8HbmEVqQX8s2
	USQkDdSWI882O6rseUENv8N5HxlUJfA+e2UcBXvqgwufIPlFYS/GuKiKtv6KuN5gcsnZ4c
	u4d+x4JkvEt161pbg/dx3WtaM6l86FYdKKQaA3TSUYPvDvh1z8Rz7M9W0JrXQA2m64UW16
	hUyagd4S0E2mkiUqudNv8ysIQTNuMNg2A8O7njKWFP/eAq3yDnxGx2C1qU+8BfI9rq11XB
	sWjmK5yYMTkwF6uTYDi/Ptg8XUm62c072ORHZ8nNdUlnHVxnSvLFqtpEwovtDA==
Message-ID: <390ad2ed-6989-4dfb-b497-d635d82c4734@bootlin.com>
Date: Tue, 17 Oct 2023 11:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH] contributor-guide: add patchtest section
Content-Language: en-US
To: Trevor Gamblin <tgamblin@baylibre.com>
References: <20231016195549.2243243-1-tgamblin@baylibre.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231016195549.2243243-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 09:26:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4389

Hi Trevor,

Many thanks for the patch!

I have a few quick tweaks to suggest, see below...

On 16.10.23 at 21:55, Trevor Gamblin wrote:
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   .../contributor-guide/submit-changes.rst      | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index cda2d12d2..6dfb0ffec 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -401,6 +401,43 @@ Anyway, you'll also be able to access the new messages on mailing list archives,
>   either through a web browser, or for the lists archived on https://lore.kernelorg,
>   through an individual newsgroup feed or a git repository.
>   
> +Validating Patches with Patchtest
> +=================================


Hey, what about having this section right after the "Creating Patches" 
and before "Sending the Patches via Email"? This would make more sense IMHO.

> +
> +Patchtest is available in ``openembedded-core`` as a tool for making sure
> +that your patches are well-formatted and contain important info for
> +maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
> +tags. Once you have generated the patch files and run ``source
> +oe-init-build-env`` to initialize your workspace, you can run patchtest
> +like so::


Here and in the rest of the patch, could you use "``patchtest``" instead 
of "Patchtest" or "patchtest"? This would be aligned with the way we 
refer to other tools such as devtool (see 
https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n74)

> +
> +    patchtest --patch <patch_name>
> +
> +Where ``/path/to/target/repo`` may (for example) be openembedded-core,
> +with the actual patchtest tests being kept in
> +``openembedded-core/meta/lib/patchtest/tests``.

Is this sentence relevant here, as "/path/to/target/repo" is not part of 
the above command line?

> Alternatively, if you
> +want patchtest to iterate over and test multiple patches stored in a
> +directory, you can use::
> +
> +    patchtest --directory <directory_name>
> +
> +By default, patchtest uses its own modules' file paths to determine what
> +repository and test suite to check patches against. If you wish to test
> +patches against a repository other than ``openembedded-core`` and/or use
> +a different set of tests, you can use the --repodir and --testdir


Use ``--repodir`` and ``--testdir``.

> +flags::
> +
> +    patchtest --patch <patch_name> --repodir <path/to/repo> --testdir <path/to/testdir>
> +
> +Finally, note that patchtest is designed to test patches in a standalone
> +way, so if your patches are meant to apply on top of changes made by
> +previous patches in a series, it is possible that patchtest will report
> +false failures regarding the "merge on head" test.
> +
> +Using patchtest in this manner provides a final check for the overall
> +quality of your changes before they are submitted for review by the
> +maintainers.


Very cool, I'm excited to use this tool, including for documentation 
patches ;-)

Of course, I'll apply your patch when patchtest makes it to oe-core.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


