Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8D3C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 15:51:58 +0000 (UTC)
Received: from sender-op-o11.zoho.eu (sender-op-o11.zoho.eu [136.143.169.11])
 by mx.groups.io with SMTP id smtpd.web11.19239.1717602714787138984
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Jun 2024 08:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=B/GbVAxR;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.11, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1717602711; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=ITRf5xygBaUGmaPsUB1ePb/Lqz3vGD0FmztGjmOIOe4zF4YEbRsB4Zm6Jm3oBVVa2p2BvaK/i9nR0ZgNyzK+76w0C54rDjN73eqcP1zhHSVp71wf0jKkeUjQx+9z2XZ66J+yZHC06r3W0xFypIHQQZm8xklf+OJtJXDcQ7Qmq/s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1717602711; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fzDXTLa0G9gP8o1t6J9IQdhs5OSqnAHWv2wMPCp6fAo=; 
	b=E9tRAyo41r5mCVEFgU83ghkj3q22HN/mYzBf9r4A90TpVW81C7GRjOpgZJP4m3JUnBugfrNBZ6n6ULBuQgQtzxC0eTQTVC7Zs4wnGJrPlLWX9Po9Yh8JpfHuXV4SPS7JLQFtYU3B3wS4tqqUuamARpm8BGpqMjpRIDHtuqp3Hnk=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1717602711;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fzDXTLa0G9gP8o1t6J9IQdhs5OSqnAHWv2wMPCp6fAo=;
	b=B/GbVAxR53Z0fURvo+QZeDra8tWWNSs6aDD+2S2veHq0knV9JFbopgzqdW7QDs+m
	tKk5na1dkjWKtr/hNPRLiNAxKl6KOGr8jhmUL5CBUAS5juXzUE7tWs6w35Dtckx9tmI
	HO1i0sSXJzYqtOyh1OycdHH3Miu03VGhGSIBcrHE=
Received: by mx.zoho.eu with SMTPS id 1717602709344790.0319871854849;
	Wed, 5 Jun 2024 17:51:49 +0200 (CEST)
Message-ID: <7596acc0-84e8-4aed-bdeb-097c4d512f44@opdenacker.org>
Date: Wed, 5 Jun 2024 17:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH] docs: Document the GO_SRCURI_DESTSUFFIX variable
To: Ryan Eatmon <reatmon@ti.com>
References: <20240531221025.11778-1-reatmon@ti.com>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
Cc: docs@lists.yoctoproject.org
In-Reply-To: <20240531221025.11778-1-reatmon@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Jun 2024 15:51:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5269

Hi Ryan

Many thanks for the patch!
I have a few minor improvements to suggest...

On 6/1/24 00:10, Ryan Eatmon wrote:
> Add the needed entries for the GO_SRCURI_DESTSUFFIX variable and why it
> is needed.  Also update the go.class and 5,1 migration file with the same
> information.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   documentation/migration-guides/migration-5.1.rst |  5 +++++
>   documentation/ref-manual/classes.rst             |  6 ++++++
>   documentation/ref-manual/variables.rst           | 12 ++++++++++++
>   3 files changed, 23 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
> index b43fecc2d..453c9fcc0 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -94,6 +94,11 @@ See :ref:`all supported distributions <system-requirements-supported-distros>`.
>   
>   Go language changes
>   ~~~~~~~~~~~~~~~~~~~
> +The :term:`SRC_URI` for your Go module recipe must include setting the
> +destsuffix parameter to :term:`GO_SRCURI_DESTSUFFIX` in order to build
s/destsuffix/``destsuffix``/

> +correctly with the new :term:`UNPACKDIR` methodology::
> +
> +   SRC_URI = "...;destsuffix=${GO_SRCURI_DESTSUFFIX}"
>   
>   .. _migration-5.1-systemd-changes:
>   
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 9520d0bf7..e1854814a 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -932,6 +932,12 @@ The :ref:`ref-classes-go` class supports building Go programs. The behavior of
>   this class is controlled by the mandatory :term:`GO_IMPORT` variable, and
>   by the optional :term:`GO_INSTALL` and :term:`GO_INSTALL_FILTEROUT` ones.
>   
> +The :term:`SRC_URI` for your Go module recipe must include setting the
> +destsuffix parameter to :term:`GO_SRCURI_DESTSUFFIX` in order to build

s/destsuffix/``destsuffix``/ here too :)

> +correctly with the new :term:`UNPACKDIR` methodology::
> +
> +   SRC_URI = "...;destsuffix=${GO_SRCURI_DESTSUFFIX}"
> +
>   To build a Go program with the Yocto Project, you can use the
>   :yocto_git:`go-helloworld_0.1.bb </poky/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
>   recipe as an example.
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 07b5b6f95..9e9b5449a 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3228,6 +3228,18 @@ system and gives an overview of their function and contents.
>         packages, but it can be overridden by a recipe to filter out other
>         subdirectories if needed.
>   
> +   :term:`GO_SRCURI_DESTSUFFIX`
> +      The :term:`SRC_URI` for your Go module recipe must include setting the
> +      destsuffix parameter to :term:`GO_SRCURI_DESTSUFFIX` in order to build

Same here

> +      correctly with the new :term:`UNPACKDIR` methodology::
> +
> +         SRC_URI = "...;destsuffix=${GO_SRCURI_DESTSUFFIX}"
> +
> +      You should not need to set GO_SRCURI_DESTSUFFIX yourself.  By default,

Here, you should also introduce GO_SRCURI_DESTSUFFIX through ":term:". 
This way, we can hunt for instances of a variable without a proper 
reference.


> +      :term:`GO_SRCURI_DESTSUFFIX` is defined as::
> +
> +         GO_SRCURI_DESTSUFFIX = "${S}/src/${GO_IMPORT}/"
> +
>      :term:`GO_WORKDIR`
>         When using Go Modules, the current working directory must be the directory
>         containing the ``go.mod`` file, or one of its subdirectories. When the

Otherwise, it looks great to me.
Thanks in advance for the update.
Cheers
Michael.



