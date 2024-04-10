Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE28CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 09:35:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.161608.1712741730660920914
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 02:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hq+tHznr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C4B420009;
	Wed, 10 Apr 2024 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712741728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEkcJxr4WEdJlC+Q7u1v6k8LSNr72PEpCiHTiiuMDP0=;
	b=Hq+tHznr0p3TDUcbwFVG8fhXjblmEHIS0ywoki4+8CVsayKKkzuxBv/EdnUTDhwcOACVTu
	7QzsZ+sj3YLMsy8/fZnHZ45o08JkqNA9tWmCn+DjriyYbjZ35s45nuB/qAVqu+5h5Fl/HI
	AmPysk3MPumLcKYpDSk4qhwns0Kg6jTxQcAt3Id9QB1XG1y4/tG4YoO4WDRiKtCOX8VYrg
	m39hU92a5B+Cw7pLvRpkclF6PF5EJYPj+0ruL0MzljOijYOZLrVUyX74Am9d7WhEPe5lt8
	uHkyq1zzQGREp3EH8+syaIYg4/8hskYBVHB29n6VLH0WNQA+3MMy4yTfDRVdWg==
Message-ID: <9d113515-34a0-41da-9317-62b121f6a16c@bootlin.com>
Date: Wed, 10 Apr 2024 11:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: thomas.petazzoni@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [PATCH v1 2/2] ref-manual/variables: add new variables for v5.0
To: joaomarcos.costa@bootlin.com
References: <20240410091124.2976089-1-joaomarcos.costa@bootlin.com>
 <20240410091124.2976089-3-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240410091124.2976089-3-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 09:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5101

Hi João,

Thanks for this update!
I'm actually taking this one first, as your first patch depends on this 
one (otherwise there will be compiling failures... we also want the docs 
to be bisectable!)

On 4/10/24 at 11:11, joaomarcos.costa@bootlin.com wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> Add variables newly referenced in release-notes-5.0.
>
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 97abb398c..d4cb0e6e3 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -561,6 +561,10 @@ system and gives an overview of their function and contents.
>      :term:`BB_INVALIDCONF`
>         See :term:`bitbake:BB_INVALIDCONF` in the BitBake manual.
>   
> +   :term:`BB_LOADFACTOR_MAX`
> +      The system load threshold above which BitBake will stop runnig extra
> +      tasks.
> +
>      :term:`BB_LOGCONFIG`
>         See :term:`bitbake:BB_LOGCONFIG` in the BitBake manual.
>   
> @@ -2335,6 +2339,12 @@ system and gives an overview of their function and contents.
>         See the :ref:`ref-classes-systemd-boot` and :ref:`ref-classes-image-live`
>         classes for more information.
>   
> +   :term:`EFI_UKI_DIR`
> +      The primary place for the UKI image inside the EFI System Partition.
> +
> +   :term:`EFI_UKI_PATH`
> +      The path for the UKI image inside the rootfs.


I'm replacing "rootfs" with "root filesystem". It's true that's every 
day jargon, but the original words sound better in documentation.

> +
>      :term:`ENABLE_BINARY_LOCALE_GENERATION`
>         Variable that controls which locales for ``glibc`` are generated
>         during the build (useful if the target device has 64Mbytes of RAM or
> @@ -5671,6 +5681,9 @@ system and gives an overview of their function and contents.
>         default by setting the variable in a custom distribution
>         configuration file.
>   
> +   :term:`OPKG_MAKE_INDEX_EXTRA_PARAMS`
> +      Specifies extra parameters for opkg-make-index command.

s/opkg-make-index/the ``opkg-make-index``/
Fixed.

> +
>      :term:`OVERLAYFS_ETC_DEVICE`
>         When the :ref:`ref-classes-overlayfs-etc` class is
>         inherited, specifies the device to be mounted for the read/write
> @@ -7152,6 +7165,9 @@ system and gives an overview of their function and contents.
>         :term:`IMAGE_ROOTFS` variable for more
>         information.
>   
> +   :term:`RPMBUILD_EXTRA_PARAMS`
> +      Specifies extra user-defined parameters for rpmbuild command.


Same here. Fixed. We're more talking about the command name than the 
name of the tool.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


