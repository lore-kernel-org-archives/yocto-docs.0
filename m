Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B526ACDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 09:50:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.204190.1697536245614957683
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 02:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LLxeuQ0M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C43060014;
	Tue, 17 Oct 2023 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697536243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8Y+3jJt7BhSXabo466MGfp+Yg7SZLzGAd9g+CS2xQk=;
	b=LLxeuQ0MCDE1neSBgux//XmosTOdWC/6QVYwAfAZpLNcpCt+5W7vt3mek5Ev1mlSx9Tckk
	7zp68hZTMoMhduecQfsuKQ8ojkwwbDoZ5IMvOfLDT/GFDVO1AzjwAbPIJ5C+1E1eWJ98cx
	kPcc7FHVGiA4Th36zEfGk2wfLwOd3XjGXkOV7L4zL3YEYTp18Jen3pTkzgpQ/rCAv37sY+
	JBmyiFeEGf/hstXJrBKYOp7CrlYRDY3r99OcRUndYuK9kh5x0cv2BsOFAKDyMPa/JsDsfh
	rDS+lg5F7kCN/1RI7M49e1T+hZLdl8GBB224NkRu762T35kR1mFw0/aIzzpkxQ==
Message-ID: <afb9ec96-589c-47b2-8f40-fd4ee0f7e9ca@bootlin.com>
Date: Tue, 17 Oct 2023 11:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: Fix PACKAGECONFIG term and add an
 example
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231016171153.3075747-1-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231016171153.3075747-1-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 09:50:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4390

Hi Talel

On 16.10.23 at 19:11, BELHADJ SALEM Talel wrote:
> PACKAGECONFIG's first and second flag value will be added to PACKAGECONFIG_CONFARGS
> and then it will be added to the appropriate variable (EXTRA_OECMAKE, or ...)
> So we need to only mention PACKAGECONFIG_CONFARGS and it will lead to other variables.
>
> I added a custom example that can help understanding very well PACKAGECONFIG.
>
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 40 ++++++++++++++++++++++----
>   1 file changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 11523bb9e..2f286d26c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6059,13 +6059,11 @@ system and gives an overview of their function and contents.
>         omit any argument you like but must retain the separating commas. The
>         order is important and specifies the following:
>   
> -      #. Extra arguments that should be added to the configure script
> -         argument list (:term:`EXTRA_OECONF` or
> -         :term:`PACKAGECONFIG_CONFARGS`) if
> -         the feature is enabled.
> +      #. Extra arguments that should be added to :term:`PACKAGECONFIG_CONFARGS`
> +         if the feature is enabled.
>   
> -      #. Extra arguments that should be added to :term:`EXTRA_OECONF` or
> -         :term:`PACKAGECONFIG_CONFARGS` if the feature is disabled.
> +      #. Extra arguments that should be added to :term:`PACKAGECONFIG_CONFARGS`
> +         if the feature is disabled.
>   
>         #. Additional build dependencies (:term:`DEPENDS`)
>            that should be added if the feature is enabled.
> @@ -6123,6 +6121,36 @@ system and gives an overview of their function and contents.
>   
>               PACKAGECONFIG:append:pn-recipename = " f4"
>   
> +      Consider the following example of a :ref:`ref-classes-cmake` recipe with a systemd service
> +      in which :term:`PACKAGECONFIG` is used to transform the systemd service
> +      into a feature that can be easily enabled or disabled via :term:`PACKAGECONFIG`::
> +
> +         example.c
> +         example.service
> +         CMakeLists.txt
> +
> +      The ``CMakeLists.txt`` file contains::
> +
> +         if(WITH_SYSTEMD)
> +            install(FILES ${PROJECT_SOURCE_DIR}/example.service DESTINATION /etc/systemd/systemd)
> +         endif(WITH_SYSTEMD)
> +
> +      In order to enable the installation of ``example.service`` we need to ensure
> +      that `-DWITH_SYSTEMD=ON` is passed to the ``cmake`` command execution.
> +      Recipes that have ``CMakeLists.txt`` generally inherit :ref:`ref-classes-cmake`, that runs ``cmake``
> +      with :term:`EXTRA_OECMAKE`, which :term:`PACKAGECONFIG_CONFARGS` will be appended to.
> +      Now, knowing that :term:`PACKAGECONFIG_CONFARGS` is automatically filled with either
> +      the first or second element of :term:`PACKAGECONFIG` flag value, the recipe would be like::
> +
> +         inherit cmake
> +         PACKAGECONFIG = "systemd"
> +         PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF"
> +
> +      A side note to this recipe is to check if ``systemd`` is in fact the used :term:`INIT_MANAGER`
> +      or not::
> +
> +         PACKAGECONFIG = "${@'systemd' if d.getVar('INIT_MANAGER') == 'systemd' else ''}"
> +
>      :term:`PACKAGECONFIG_CONFARGS`
>         A space-separated list of configuration options generated from the
>         :term:`PACKAGECONFIG` setting.

Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


