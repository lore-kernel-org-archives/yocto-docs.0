Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AF5C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 16:55:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.8444.1655139346193426924
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 09:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ic3nFlJ7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id w17so406685wrg.7
        for <docs@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 09:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=lE1zKXWI7cFoCmcVWNe2AylNPQGZgXJvqE1i4Z2t9+8=;
        b=Ic3nFlJ7NLD4lwt7X4EuE8HL1R1letQp3OL9MaL9t8WB541eec4IPHAuNR1qzqIFtJ
         LNXmy657SLWxyw4iqliuzCJi6wdNj1Tw/cmebX2t5g+CDTxtHLlbBCuu/lbFs0AoBC6u
         nllduFHr3B3srmAe1V7GqFpZepSITIbBwhx8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=lE1zKXWI7cFoCmcVWNe2AylNPQGZgXJvqE1i4Z2t9+8=;
        b=MmC5++Hgi0be3nyv3bQUHQ1nSHkhHQmqAZitEgfV5i5xtQpwi++ZN8oCExnb8AJeIZ
         aDSsWk73Q5rnnryd9vjh3Yy9u/YcvrVn81AJ1QgPtWWXTfc9pXubeh6hWTZQGqgagIGe
         baoTT3HhOQhnKp7yz3OlX8o8Lc0rhZa3mbwF/2OjBRrXD7A2dA7AeWV9FQSLtud0peLZ
         d0ATESws9SrrLr9LX4dFJ2q+MVwP2ibc5XHMRWgNnkue9AOqSgCTqkHjWo/uggRHbf5E
         QiZBq0/Sq4R84euuEFJ87SK2bw3zpKECwB2i4TzbcZMZrVfAXqbBnk0o1GbbgvYwnCPv
         Rd2w==
X-Gm-Message-State: AJIora8Awsf6UgZWk9pkrQTsJzzpJCRrP4HiqO/2C6kdNpb5uuR3j2eV
	w+AymU/eD6MoYhsHigumajsZoA==
X-Google-Smtp-Source: 
 AGRyM1udkFwI9l6YDuJNQKYoJ3rpKakX9TbjQitilC6Yvcquk9RG3V8Yma0TMPzJpnPfJi/FtBHPPw==
X-Received: by 2002:adf:dbc1:0:b0:219:e994:6ba7 with SMTP id
 e1-20020adfdbc1000000b00219e9946ba7mr729953wrj.229.1655139344389;
        Mon, 13 Jun 2022 09:55:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4edb:baaa:8bb1:f083?
 ([2001:8b0:aba:5f3c:4edb:baaa:8bb1:f083])
        by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b003942a244f47sm14556130wmq.32.2022.06.13.09.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 09:55:43 -0700 (PDT)
Message-ID: 
 <73a31eefa84a8416adb982e76aa19b3b7660e5ae.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual: add description for the "sysroot"
 term
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Date: Mon, 13 Jun 2022 17:55:42 +0100
In-Reply-To: <20220613155939.94911-1-michael.opdenacker@bootlin.com>
References: <20220613155939.94911-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jun 2022 16:55:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2992

On Mon, 2022-06-13 at 17:59 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>=20
> This term is used throughout the manual but is not properly
> introduced anywhere.
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/ref-manual/terms.rst | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manua=
l/terms.rst
> index cba514c345..76f3fb0d08 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -383,6 +383,31 @@ universal, the list includes them just in case:
>       ":ref:`overview-manual/development-environment:repositories, tags, =
and branches`"
>       section in the Yocto Project Overview and Concepts Manual.
> =20
> +   :term:`Sysroot`
> +

How about:

"""
When cross compiling, the target file system may be differently laid
out and contain different things to the of the host system. The concept
of a sysroot is directory which looks like the target filesystem and
can be used to cross compile against.
"""

then go on and explain target vs. native.=20


Cheers,

Richard

