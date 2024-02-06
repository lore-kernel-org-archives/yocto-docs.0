Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB81DC48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:51:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.24888.1707234709249760782
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nGuJ3zLL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C9C61BF207;
	Tue,  6 Feb 2024 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707234707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TQyTAG8WGoE7JL/JFuZC5KgvBrH3UQCfcTUeTARxkvg=;
	b=nGuJ3zLLivJXEu1X4lVMy7oUXq6dR0j2GmtAukGYuR4GJk82P3WNaTahqH4rizQt1aKNPj
	kAoSxzQr2AhSvy4jWsDoqsLoJBe6X7gR60W42wJK+9AAo2B30/1uFjTWsjlyOf89MAaEuq
	unC5c8wEpa7L4hGo8qVsL5fE/ru3RuqM51+1IzTU6X//Yzf7EKYD11qLphrntp9NPPD8A1
	SGA1VeCMuvYw1meJ+vB+cvlSP/bFb/7N2saf/VVsbZMcThGLTIXVzU/rat8qd5RVcz8lb/
	hwT/TS2PxmANrV3jw5S9GPn0vT8N81C2H29ECoIXhTiQC7hVlf8ZtAk29RuN4A==
Message-ID: <a0c5e346-d34e-4354-9cb3-3bb7d0fe5abb@bootlin.com>
Date: Tue, 6 Feb 2024 16:51:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org, =?UTF-8?Q?J=C3=B6rg_Sommer?=
 <joerg.sommer@navimatix.de>
Subject: Re: [docs] [PATCH] dev-manual: Rephrase spdx creation
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>
References: <20240205161309.2958827-1-simone.p.weiss@posteo.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240205161309.2958827-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:51:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4825

Simone, Jörg,

Thanks for the patch and review!

On 2/5/24 at 17:13, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> Make the options more clewar by providing them in a list instead of plain prosa.
> Also add a ref for a presentation wrt spdx 3.0 in the Yocto project.
>
> Fixes [YOCTO 7476]
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>   documentation/dev-manual/sbom.rst | 40 ++++++++++++++++++-------------
>   1 file changed, 24 insertions(+), 16 deletions(-)
>
> diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
> index f51d08f84..b72bad155 100644
> --- a/documentation/dev-manual/sbom.rst
> +++ b/documentation/dev-manual/sbom.rst
> @@ -30,22 +30,29 @@ To make this happen, you must inherit the
>   
>      INHERIT += "create-spdx"
>   
> -You then get :term:`SPDX` output in JSON format as an
> -``IMAGE-MACHINE.spdx.json`` file in ``tmp/deploy/images/MACHINE/`` inside the
> -:term:`Build Directory`.
> +Upon building an image, you will then get:
>   
> -This is a toplevel file accompanied by an ``IMAGE-MACHINE.spdx.index.json``
> -containing an index of JSON :term:`SPDX` files for individual recipes, together
> -with an ``IMAGE-MACHINE.spdx.tar.zst`` compressed archive containing all such
> -files.
> +-  :term:`SPDX` output in JSON format as an ``IMAGE-MACHINE.spdx.json`` file in
> +   ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`.
> +
> +-  This toplevel file is accompanied by an ``IMAGE-MACHINE.spdx.index.json``
> +   containing an index of JSON :term:`SPDX` files for individual recipes.
> +
> +-  The compressed archive ``IMAGE-MACHINE.spdx.tar.zst`` contains the index
> +   and the files for the single recipes.
>   
>   The :ref:`ref-classes-create-spdx` class offers options to include
> -more information in the output :term:`SPDX` data, such as making the generated
> -files more human readable (:term:`SPDX_PRETTY`), adding compressed archives of
> -the files in the generated target packages (:term:`SPDX_ARCHIVE_PACKAGED`),
> -adding a description of the source files used to generate host tools and target
> -packages (:term:`SPDX_INCLUDE_SOURCES`) and adding archives of these source
> -files themselves (:term:`SPDX_ARCHIVE_SOURCES`).
> +more information in the output :term:`SPDX` data:
> +
> +-  Make the json files more human readable by setting (:term:`SPDX_PRETTY`).
> +
> +-  Add compressed archives of the files in the generated target packages by
> +   setting (:term:`SPDX_ARCHIVE_PACKAGED`).
> +
> +-  Add a description of the source files used to generate host tools and target
> +   packages (:term:`SPDX_INCLUDE_SOURCES`)
> +
> +-  Add archives of these source files themselves (:term:`SPDX_ARCHIVE_SOURCES`).


I agree that your changes make the text easier to read.

>   
>   Though the toplevel :term:`SPDX` output is available in
>   ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancillary
> @@ -65,11 +72,12 @@ generated files are available in ``tmp/deploy/spdx/MACHINE`` too, such as:
>   
>   See also the :term:`SPDX_CUSTOM_ANNOTATION_VARS` variable which allows
>   to associate custom notes to a recipe.
> -
>   See the `tools page <https://spdx.dev/resources/tools/>`__ on the :term:`SPDX`
>   project website for a list of tools to consume and transform the :term:`SPDX`
>   data generated by the OpenEmbedded build system.
>   
> -See also Joshua Watt's
> +See also Joshua Watt's presentations
>   `Automated SBoM generation with OpenEmbedded and the Yocto Project <https://youtu.be/Q5UQUM6zxVU>`__
> -presentation at FOSDEM 2023.
> +at FOSDEM 2023 and
> +`SPDX in the Yocto Project <https://fosdem.org/2024/schedule/event/fosdem-2024-3318-spdx-in-the-yocto-project/>`__

Wow, that's fresh stuff. I also watched this new one live. It's good to 
keep the first one as it shared more details if I recall correctly.

Merged into master-next. I fixed the typo reported by Jörg in the commit 
message.
Cheers
Michael
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


