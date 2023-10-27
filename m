Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33042C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 11:27:46 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.4679.1698406055751296309
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 04:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20230601.gappssmtp.com header.s=20230601 header.b=WX/PtmRL;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.208.46, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo3073555a12.3
        for <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 04:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20230601.gappssmtp.com; s=20230601; t=1698406054; x=1699010854; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=teZvN1qJXui7niJ5M+fIyiyRz/98xmOq7DmpmkY09WE=;
        b=WX/PtmRLvpQsm10C4Kj6nH+Ol30xpj8t5D065l2LZofswSKdHQ3vY6w29+fqiOjtc9
         WOyrsEX0G8FCUf0HmxEi7rrPbaTEueFDi2VpV1gVt5m3DC8NDurjBJxH1ZX2fJATcOgI
         RuwF8TRxc0yxZzIA5CBpfouIf44D4wrnapdBhwIcezhUIG+kay87YHO1VxKW8w8TKzn0
         dilx9iK4eEAGEZX494+SWyypMQIrIdk73qBXLM0uLKCBCv7PJDdsZgCAE/MXQIKmU5IY
         N87X+CX1wj2xAnFg4M1QQdh5xAjH01ea7ES6rFhVkeELrY5FSflXDZMH0m63UeJPhpXk
         ATBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698406054; x=1699010854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teZvN1qJXui7niJ5M+fIyiyRz/98xmOq7DmpmkY09WE=;
        b=h41gKmRmGQ+7bcF8eS2tMft1b0S/qsBeZTAuhiKiKF0T28Emfd1i+87XugN5yHhxvF
         eI9aBX6i+DJIN6dfQ9JCrtsSZBnPIX3/qZyZVoNzvc3YwydxQhoRwkArRrUzTk7WxxWj
         zMqbJby/+GR0OP8m6M56qC9nvs4d1jd3FqBcbyZo0y51+/PhIrmGhSA35qz5j8CNCrhi
         pJ303b2Xbje1FJCx1xEHJEZk/q1i+nLxK5Ygj4QH1M9TEabAXn5w9EMRobiLoyPhluw2
         fqqY6GjIoKdrC6OPaS+F0PJ3EzblFQP/91hpi8s1AXMVWSIPjnuFspO/L1NfbJwVFkgt
         Spjg==
X-Gm-Message-State: AOJu0YzBZDsCDCr2GEXZp8yKbDQ0CEVg1u6z8+kZuHGTVjkOCKgteApu
	9/n2jv0SZLxK5ZhOSC0aixnIeg==
X-Google-Smtp-Source: AGHT+IGI/ERXe8iGH3I/LhFMgf1124EBGC6UddiARuinrp8AJSGB8qHp2GPRyXxdBZ/G8fA6byQTXA==
X-Received: by 2002:aa7:d70e:0:b0:53e:fd81:67ab with SMTP id t14-20020aa7d70e000000b0053efd8167abmr2043782edq.6.1698406053692;
        Fri, 27 Oct 2023 04:27:33 -0700 (PDT)
Received: from [192.168.2.42] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id o27-20020a509b1b000000b0054130b1bc77sm1108969edi.51.2023.10.27.04.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 04:27:33 -0700 (PDT)
Message-ID: <8454ccc7-bf66-463a-842b-da30c6332a9e@bytesatwork.ch>
Date: Fri, 27 Oct 2023 13:27:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: document KERNEL_LOCALVERSION
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20231027092935.1601588-1-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Autocrypt: addr=daniel.ammann@bytesatwork.ch; keydata=
 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
 cZ+2nBA=
In-Reply-To: <20231027092935.1601588-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 11:27:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4509

Hi Michael

Comment inline.

Kind regards

Daniel


On 10/27/23 11:29, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Introduced by
> https://git.yoctoproject.org/poky/commit/?id=66ed174ccdf7a89cb998f503cc6b631e2d1adcc0
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> CC: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 03234d3f78..771eb91af6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2485,6 +2485,16 @@ system and gives an overview of their function and contents.
>         external tools. See the :ref:`ref-classes-kernel-yocto` class in
>         ``meta/classes-recipe`` to see how the variable is used.
>   
> +   :term:`KERNEL_LOCALVERSION`
> +      This variable allows to appends a string to the version

allows to append

> +      of the kernel image. This corresponds to the ``CONFIG_LOCALVERSION``
> +      kernel configuration parameter.
> +
> +      Using this variable is only useful when you are using a kernel recipe
> +      inheriting the :ref:`ref-classes-kernel` class, and which doesn't
> +      already set a local version. Therefore, setting this variable has no
> +      impact on ``linux-yocto`` kernels.
> +
>      :term:`EXTERNAL_TOOLCHAIN`
>         When you intend to use an
>         :ref:`external toolchain <dev-manual/external-toolchain:optionally using an external toolchain>`,
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4508): https://lists.yoctoproject.org/g/docs/message/4508
> Mute This Topic: https://lists.yoctoproject.org/mt/102217669/3616718
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [daniel.ammann@bytesatwork.ch]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

