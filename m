Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52AFC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 08:16:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.11901.1716452181987856301
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 01:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dxzS4Fqc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 891CBFF80A;
	Thu, 23 May 2024 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716452179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmHR39PsSx6eOz/RIm+U1qq8Y0IbIoaatdxjFA22oCc=;
	b=dxzS4FqchO9+0tOUN43mHLNfQ2phEFjoCWhlKNp4tnJEe3IYgiPNTckEQT3tDq++Ecw3iD
	GHOrMYVdskOUdFeBlYt3yKzwepOJqYUqEGk8zRgg7atboCF6dn4zoYTGQLgIVs6DylC3qU
	X0kr1lGGmL214rpho2T3qIZr0ZLT+hurJP3qGKC72pLnuYKfkZMR0CNvF69SSE77u7pmnz
	Ej7q1+zJp0sOcwyju2n3IfKDqGHQJIvDrgJ4eRS/YWU13RiQG5K6SescAcaJrJ7URRCdpu
	FthJmkv94Cs7N+u+lqdw86Slwab6mMqO34AAjdgKcSnnTRCGgjK35IlI9oLJ9g==
Message-ID: <787c0ec0-d0a6-4a1d-b801-0e7a113b52f4@bootlin.com>
Date: Thu, 23 May 2024 10:16:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH] ref-manual: variables: document PYPI_PACKAGE_EXT,
 PYPI_SRC_URI
To: Trevor Gamblin <tgamblin@baylibre.com>
References: <20240521182644.1895419-1-tgamblin@baylibre.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240521182644.1895419-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 08:16:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5231

Hi Trevor,

On 5/21/24 at 23:56, Trevor Gamblin wrote:
> These are variables that some Python recipes are starting to use, but
> there is no documentation for them currently in the reference manual.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   documentation/ref-manual/variables.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 3f37f42f2..09199b5c9 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6829,6 +6829,19 @@ system and gives an overview of their function and contents.
>         explicitly if that will not match the package name (e.g. where the
>         package name has a prefix, underscores, uppercase letters etc.)
>   
> +   :term:`PYPI_PACKAGE_EXT`
> +      When inheriting the :ref:`ref-classes-pypi` class, specifies the
> +      file extension to use when fetching a package from `PyPI
> +      <https://pypi.org/>`__. Default is tar.gz.
> +
> +   :term:`PYPI_SRC_URI`
> +      When inheriting the :ref:`ref-classes-pypi` class, specifies the
> +      full `pythonhosted <https://files.pythonhosted.org/>`__ URI for
> +      fetching the package to be built. The default value is constructed
> +      based upon :term:`PYPI_PACKAGE`, :term:`PYPI_PACKAGE_EXT`, and
> +      :term:`PV`. Most recipes will not need to set this variable unless
> +      they are building an unstable (i.e. development) version.
> +
>      :term:`PYTHON_ABI`
>         When used by recipes that inherit the :ref:`ref-classes-setuptools3`
>         class, denotes the Application Binary Interface (ABI) currently in use


Many thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


