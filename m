Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CEFC001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 13:24:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.61147.1691501069376534579
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 06:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NNfXMOjp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3176a439606so4324343f8f.3
        for <docs@lists.yoctoproject.org>; Tue, 08 Aug 2023 06:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691501068; x=1692105868;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZSAa0aIL8F4i4US81Du/nAsV39lvR5ynspM3IsHgEKw=;
        b=NNfXMOjpH9TUZT9bI4x/NI8vOfBxSgAwkOv6RpsVVrrLzfQL/IwyxXvpU6WJ91SegD
         edw6p4+jh8VeG1EcAYkuOi6RcbMMtEzt+1xBTxsLz6qWC+UFIKY6xKW8yjOYpP3tRxie
         YvDtsmw7V+dlGhMS4o3BdK4mFPnKOEWNPKA8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691501068; x=1692105868;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSAa0aIL8F4i4US81Du/nAsV39lvR5ynspM3IsHgEKw=;
        b=leeP6zHUv8IQTxykWtAbD72f3TOcMZw+YlRTezg23qiatp0j8FMF0mhgDRpoqKBi/j
         Swz5EETbC//0TgM07liySrJoX+zuUopkHNo2vcEaeq9sv0NrkeVdRorULgYX6GB79iq+
         83fZzak3v4i/Ld9lUCGrLg9cPa9/Ywjbs4ENqf+KZFT6gsO2MV8zRnIHQ7CBkgzlQE5W
         u0AYbzkjEDd055hjiPNtbgot1vfuOISttrDQa9lZDgyi3Y/McamjCI5pmH0F8/uT4SH7
         vcNEnSKSqUYcWTkbcUoj4b+o/SnyL1wz1ZXkps2Z/1pRkUL7D4BwgQEFS8M+AeSChNQI
         xH0w==
X-Gm-Message-State: AOJu0YyBjbwn7DMHLP52RnQxZrzE3GTNJYrH4rETo0uO5qfQdPf7oZPy
	DkAjC9qPd0gAP11RYTZRLGKTeQ==
X-Google-Smtp-Source: AGHT+IEikv4AY20JeQHS52ghG+utRaZalxQM3n+EW+S+1PpLqQjiR3m1G15tqMGq4QUS7G1+fVrFWw==
X-Received: by 2002:a5d:5051:0:b0:317:74bb:82ff with SMTP id h17-20020a5d5051000000b0031774bb82ffmr7748308wrt.7.1691501067707;
        Tue, 08 Aug 2023 06:24:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1229:bf53:df4f:c7be? ([2001:8b0:aba:5f3c:1229:bf53:df4f:c7be])
        by smtp.gmail.com with ESMTPSA id x18-20020a5d60d2000000b003143cb109d5sm13725080wrt.14.2023.08.08.06.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:24:27 -0700 (PDT)
Message-ID: <136841883b4313132d707b8477dccb26e37e9404.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] [dunfell] ref-manual: ref-system-requirements:
 update supported distros
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Steve Sakoman <steve@sakoman.com>, docs@lists.yoctoproject.org
Date: Tue, 08 Aug 2023 14:24:26 +0100
In-Reply-To: <5dc9ec45-9f35-5fd7-1e18-dffc407471e9@bootlin.com>
References: <17795DC4E16ECCFB.9264@lists.yoctoproject.org>
	 <149547d8-bb0b-2569-31d4-1c0eab6c8941@bootlin.com>
	 <8eafcde8e0abd24543149f0feafeb117c920531c.camel@linuxfoundation.org>
	 <5dc9ec45-9f35-5fd7-1e18-dffc407471e9@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Aug 2023 13:24:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4116

On Tue, 2023-08-08 at 15:22 +0200, Michael Opdenacker wrote:
> Hi Richard,
>=20
> Thanks for your reply and patience :)
>=20
> On 08.08.23 at 11:56, Richard Purdie wrote:
> >=20
> > See my previous answer. You can see here:
> >=20
> > https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py#n166
> >=20
> > that dunfell is being tested on anything up to fedora37.
>=20
> Sure, but what about Mickledore and master? In this file, "fedora37" is=
=20
> only associated to Kirkstone and Dunfell.

If it isn't listed, there isn't a restriction yet, i.e. all workers.

> > The autobuilder list of workers:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/workers
> >=20
> > shows we have f37 and f38 workers so we only test dunfell on fedora37
> > at this time.
>=20
>=20
> Right! So, should I send updates to fix the SANITY_TESTED_DISTROS=20
> settings for Kirkstone and Dunfell? Otherwise, such information is=20
> outdated and the documentation derived from it is incorrect.

Yes please.

Cheers,

Richard

