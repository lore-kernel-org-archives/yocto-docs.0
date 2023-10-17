Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7105CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 15:52:19 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.222413.1697557936823670338
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 08:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bUJ+riel;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0ABA31BF20A;
	Tue, 17 Oct 2023 15:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697557934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SLssQKb5YOR/AUJwy0rvRakM8Go/cRxNYEi6aHl/yk8=;
	b=bUJ+rielc15Ax6H3aNUu6Q30EbTyA2lcV1kBvXAQBTrzuWaEQZx807Qng+ySLsucUSBk9z
	Ccee7xS0z97gNtaUjj8fuSENN4GM+8MbOeycFtkbZ7Xy+nwySjkQrDhMkdeO0QaDST84g4
	bqOZan4nSMT4/4DpXO+/I/hAdLwUdEKzbGWiNat9FgciWjCBvvIUNhQtV5DtP/CtCMC6vP
	9fwA6B9lxxNXuYDQksSMLRBhB7K6AHyJgoVrGhSA1WmxVYv2lFong9X+gstuKkkwlkvGK9
	UrArv/3sgHtSqEw3n6uOsNAQ145ZTung/7A8SjjJzOhcC8ZKEQVGpFkifaJ6cA==
Message-ID: <4a7c5f11-c883-4113-a472-baae4ba09872@bootlin.com>
Date: Tue, 17 Oct 2023 17:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH v2] contributor-guide: add patchtest section
Content-Language: en-US
To: Trevor Gamblin <tgamblin@baylibre.com>
References: <20231017133826.2248800-1-tgamblin@baylibre.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231017133826.2248800-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 15:52:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4404

Hi Trevor,

Thanks for the update!

On 17.10.23 at 15:38, Trevor Gamblin wrote:
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v2 moves the patchtest section to before "Sending Patches via Email",
> cleans up some confusing instructions, and improves highlighting to be
> more consistent with the rest of the guide.
>
>   .../contributor-guide/submit-changes.rst      | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index cda2d12d2..8a300c366 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -279,6 +279,40 @@ Here is the general procedure on how to create patches to be sent through email:
>      If necessary, rework your commits as described in
>      ":ref:`contributor-guide/submit-changes:taking patch review into account`".
>   
> +Validating Patches with Patchtest
> +=================================
> +
> +``patchtest`` is available in ``openembedded-core`` as a tool for making sure
> +that your patches are well-formatted and contain important info for
> +maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
> +tags. Once you have generated the patch files and run ``source
> +oe-init-build-env`` to initialize your workspace, you can run ``patchtest``
> +like so::
> +
> +    patchtest --patch <patch_name>
> +
> +Alternatively, if you want ``patchtest`` to iterate over and test
> +multiple patches stored in a directory, you can use::
> +
> +    patchtest --directory <directory_name>
> +
> +By default, ``patchtest`` uses its own modules' file paths to determine what
> +repository and test suite to check patches against. If you wish to test
> +patches against a repository other than ``openembedded-core`` and/or use
> +a different set of tests, you can use the ``--repodir`` and ``--testdir``
> +flags::
> +
> +    patchtest --patch <patch_name> --repodir <path/to/repo> --testdir <path/to/testdir>
> +
> +Finally, note that ``patchtest`` is designed to test patches in a standalone
> +way, so if your patches are meant to apply on top of changes made by
> +previous patches in a series, it is possible that ``patchtest`` will report
> +false failures regarding the "merge on head" test.
> +
> +Using ``patchtest`` in this manner provides a final check for the overall
> +quality of your changes before they are submitted for review by the
> +maintainers.
> +
>   Sending the Patches via Email
>   =============================

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Happy to merge it in "master-next", and to have it merged in "master" 
soon :)

Any plans to backport "patchtest" to Kirkstone at some point, so that we 
can have it in the Kirkstone docs too? Otherwise, I can still mention 
the tool in the latest release anyway ;-)

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


