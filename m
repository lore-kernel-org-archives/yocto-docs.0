Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2853CC88E50
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 09:42:01 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16488.1789378912448179852
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 02:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HyHzto1I;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so295677166b.2
        for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 02:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789378910; x=1789983710; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=La7FzrKg2HakG7HA/ucA8YQXZHm5Je+P3ZKR/3UDXoo=;
        b=HyHzto1I29UrkjcgBNTNd3t4MX06rTDGFAAJ5htRDaEjrRkSrnrwE3X0In/lCnZOar
         w94SykrwTzOS3Cah9xJiWeLRegcxXC4avViAaMfRDNbDzt7+69QIboJr2UXCBuGaTbTr
         lAiY7R6RrQVObkZ1VUewyrDTRHu8M+fdUm/Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378910; x=1789983710;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=La7FzrKg2HakG7HA/ucA8YQXZHm5Je+P3ZKR/3UDXoo=;
        b=B7cjhVWhDERZIKsGnVcp4SBu7ttjXMuq+Y+2kM2hOFOV6nd94vuBOEoghf+j7Dfoom
         m0kkWf90RiFKZu93/ld7PuIOxQ9ukXX7wPCfbLdiGMgHLIguXZuVZjW7RJqpMwGYwkHJ
         DEiyhspEJnB9wmzZppTkQ1SqLLjlTaheWb8ZZYTLljT4faxX6rMNRkFPqxX0b2C27LHs
         3XGCbNyxsciWXKRYEfYxnpMtVordiN35iIDSG6JHSXQ9VzcyGdj8rxWM8XBfEx31HT3n
         InWY+jzz95zC/Gepz3vNN5pfmeby6L2dJPk65R+z/ahjQ6Nfbnreh1VHJqIvc0dp9gO0
         F+NA==
X-Forwarded-Encrypted: i=1; AKwUvBz0MOESWn0rcoMmce82UU8ysWwWS5ggssEvMRVNFDi8I5j+1g8eZyb+MZGwrwA17x/7gRw1@lists.yoctoproject.org
X-Gm-Message-State: AFuF++nfl9vcMj2dK9Jzei62RuF/SGbK1nxSTWFKQ0b6HgthVP9KOI1e
	AW0wGpnzI1yeKSWf64FzCm4QQ2kt/wZwQ8jIdbi0nRHpjIv7Aev/QbUTjeVJ5omIVJE=
X-Gm-Gg: AYBFou0/Oo3vPXld7CROwxYnQ+IP+Quk80i9jOp0UMjqm0guS9v4XDXxLwm0kcQxFwy
	V9wgmuzuux9Pu3Md+JhqLIlmlAjXo7brbZIMLfamhyr0SJ7EfLA1BdjndMA4jRwThmKGSYrP0yN
	Ce4UhIsKjNw/APaIhyr0+a4GYn74hMQmXxKZTaQlNhJ/KEbFqyyEW4D0/CUXc/dthM9knUwZ5XH
	3WjsAnxJzXKGwoBrc9O83GLoRGPieiXEXg4crRraBOCua3qlvoL4mziBXgIz3dgZpb+t80cP9DN
	Pox7niBZzk9zyyP0RKAo9HJ5NUiRsPQUKIfFsHOX0R+zqUWVArDKJbdkGxEIGNpX0Wermu3Q8QT
	kqUg9FsDXCuv0loPNyg8/Jff7eJ3Qqlqg2VhuA6evBQezkYVY2/8zGb9JSBfx333aGpo3TjbTA8
	KMp03X5WSWY4fwj6gTjJ7yqBJW94HoNjAxx0cS5MreXMWJPGWyO+lj/dBl+c5j08qEmiBcdGkS1
	Zp6SvrZrLuqHVzcFp3DYRbHPAN/kd4NSZVU3oKeWBgMKx3qLaJ+ffaXNbQMBr48
X-Received: by 2002:a17:907:9804:b0:c29:5215:b2d2 with SMTP id a640c23a62f3a-c29b8724ff9mr138906366b.23.1789378910348;
        Mon, 14 Sep 2026 02:41:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e738:2a19:1746:7e8c? ([2001:8b0:aba:5f3c:e738:2a19:1746:7e8c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608ef30sm403002366b.42.2026.09.14.02.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:41:49 -0700 (PDT)
Message-ID: <5f70fb6ea6d2c9a4a24f476f463ab1adf02aa7e5.camel@linuxfoundation.org>
Subject: Re: [docs] how should one update "dual, six-core Xeons"?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 14 Sep 2026 10:41:48 +0100
In-Reply-To: <DLEWHJ0DKML4.2ITSSJJ00H3ZG@bootlin.com>
References: <b13f1dcb-14aa-8063-e9da-96817167a9aa@crashcourse.ca>
	 <DLEWHJ0DKML4.2ITSSJJ00H3ZG@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 09:42:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10489

On Mon, 2026-09-14 at 10:36 +0200, Antonin Godard via lists.yoctoproject.or=
g wrote:
> On Fri Sep 11, 2026 at 8:08 PM CEST, Robert P. J. Day wrote:
> >=20
> > here:
> >=20
> > https://docs.yoctoproject.org/dev/dev-manual/start.html
> >=20
> > it's amusing to read, "These systems, in general, should be high
> > performance (e.g. dual, six-core Xeons with 24 Gbytes of RAM and
> > plenty of disk space)."
> >=20
> > would someone like to suggest a more modern configuration, and i'll
> > submit a patch.
>=20
> We could simply say: "&MIN_RAM; Gbytes of RAM, at least &MIN_DISK_SPACE; =
disk
> space".
>=20
> Those are replaced by our poky.yaml.in replacements when building.
>=20
> Not sure we need to mention a processor model here, as it would become ob=
solete
> in the future.

I think the key is to mention multi cored system, "ideally with at least 16=
 cores"?

Cheers,

Richard

