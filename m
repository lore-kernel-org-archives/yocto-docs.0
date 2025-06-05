Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF3AC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:58:20 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.8471.1749131897804104447
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 06:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=CdiObPZP;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LGjTqSGYS+NnlIGDcZ5C6rrvcmvYu69+rSxroboGNis=; b=CdiObPZPEZwLmovb6Cpg3/R7mF
	2OLJqT/cl++eXZu7aB/+c7RdrMf+ACwpPEYi3WJRI1BkklHiwlmYDLM8ffZwtOR1Kf/7Yqd4boW2+
	s/fU9p2um49FZkz3aK1xPwmfIsV+cnZ65cnXtcVXazIcs67rRX5W1tJSH5wiEQVaamRZVojRn84km
	ufcjbyMU9U8opfpyjLUpLkCbELoHEe0J3WjEtmPpsI2BmnQpnJNq2FGmtiL+s/N6XS7vEqD6L4312
	tur7WLDsihCH6p2Hc9ZuZHf4kmnpLNGc/NNk2AgUVAXGt0TePvtJ4gRsN+CbseMRbH8AKBuK1rQvV
	VGOsw05A==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:48374 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uNB6l-0000000BliL-0UvA;
	Thu, 05 Jun 2025 09:58:15 -0400
Date: Thu, 5 Jun 2025 09:58:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Dixit Parmar <dixitparmar19@gmail.com>
cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/1] ref-manual: document KERNEL_SPLIT_MODULES
 variable
In-Reply-To: <20250605135514.369076-1-dixitparmar19@gmail.com>
Message-ID: <e7929b10-6cdb-a4d4-7c1d-1ac0858a618c@crashcourse.ca>
References: <20250605135514.369076-1-dixitparmar19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jun 2025 13:58:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7005


On Thu, 5 Jun 2025, Dixit Parmar via lists.yoctoproject.org wrote:

> This variable controls the kernel module spliting.
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 9768d8f5b..592401eb6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5359,6 +5359,15 @@ system and gives an overview of their function and contents.
>        the :term:`KERNEL_PATH` variable. Both variables are common variables
>        used by external Makefiles to point to the kernel source directory.
>
> +   :term:`KERNEL_SPLIT_MODULES`
> +      Allow opt-out of split kernel modules. For some use cases, a monolithic
> +      kernel-modules package containing all modules built from the kernel
> +      sources may be preferred. For one, download time is shorter and
> +      installation time is faster.
> +      Default set to 1, one subpackage per module. Setting it 0 will generate
                                                                ^to

> +      a monolithic kernel-modules package containing all modules built from
> +      the source.
> +
>     :term:`KERNEL_SRC`
>        The location of the kernel sources. This variable is set to the value
>        of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-module`
> --
> 2.43.0
>
>

