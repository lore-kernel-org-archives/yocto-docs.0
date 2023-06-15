Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20A7EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 17:36:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.24964.1686850575366714681
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 10:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xx9ppR6p;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686850573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ijx22BzGd8NWPX0suggzJJgXi5anaBURKTXwV5w+JI=;
	b=Xx9ppR6pLSFZsXve2JaSvm8VGuBHhI0JCF3xl1mg1E3JqvWoL2aiJuC0L98whhTIlCFrjh
	swL6U2Wrqz3Qz93oFpdT80z4Sr29od9Mm0AjrE7GuervbWWarm1wBlzptWHG0LIa47SylM
	TNnhuudVZ5bSPI6UgLXSXRBc7Msp+xIoHg9rHD51J2wpcPpfAKShMR8pWmf5pHiwQA0Phs
	MtKitVhFyOC9ysSttUr6rfsDyJSVON69/MZlYH5Y6vK1W7BJfP15xy2BBNRycr/oljIqYJ
	Fpj/0BG++BCrTy8j5pisdz3MxWgiLj21mAFilv2BryGqqz/m5SonvCzSqd2IYw==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A81460003;
	Thu, 15 Jun 2023 17:36:12 +0000 (UTC)
Message-ID: <7b4d6498-fdaf-5556-04d1-9c05d46c793d@bootlin.com>
Date: Thu, 15 Jun 2023 19:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] variables.rst: document
 OEQA_REPRODUCIBLE_TEST_TARGET and OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20230615112633.3702207-1-mikko.rapeli@linaro.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230615112633.3702207-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Jun 2023 17:36:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3998

Hi Mikko,

Many thanks for the patch!

On 15.06.23 at 13:26, Mikko Rapeli wrote:
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
>
> They control which build targets to use when testing build
> reproducibility and which build targets can reuse sstate
> cache during the test.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   documentation/ref-manual/variables.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 6a7888ab47..bb9d4cc66a 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5541,6 +5541,15 @@ system and gives an overview of their function and contents.
>         For additional information on how this variable is used, see the
>         initialization script.
>   
> +   :term:`OEQA_REPRODUCIBLE_TEST_TARGET`
> +      Set build target for build reproducibility testing. By default
> +      all available recipes are compile with "bitbake world", see also ``EXCLUDE_FROM_WORLD``

s/compile/compiled/
You can also add a variable reference: :term:`EXCLUDE_FROM_WORLD`.

> +      and :doc:`/test-manual/reproducible-builds`.
> +
> +   :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`
> +      Set build targets which can be rebuild using :ref:`shared state <overview-manual/concepts:shared state cache>`


s/rebuild/rebuilt/

> +      when running build reproducibility test. See :doc:`/test-manual/reproducible-builds`.


s/test/tests/?

I'll take care of the updates. No need to submit a V2.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


