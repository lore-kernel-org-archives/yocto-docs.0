Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A0CC02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:53:13 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.29193.1737895986442596789
 for <docs@lists.yoctoproject.org>;
 Sun, 26 Jan 2025 04:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C64UA3RZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38a8b35e168so2300078f8f.1
        for <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 04:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737895985; x=1738500785; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMakhy2s0W0+ibZ4/4i5AII08HPRrTHugecfaZV/ESc=;
        b=C64UA3RZnpOjWMF9MqsQsxVcd2Ybru3odgnC9z7NsIdX/4Z2vj96S3FOr3aPb4OQh3
         YUbeHSqQPZ/h0qfxdN8CyIpsSXGdSuO4fwduVxNZhvZ8HnkfgAylVcWez4AbUNbbL3Yl
         yBgo16Xix7BP87SQUKkHyYL9BcxzF6ET7SNYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737895985; x=1738500785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XMakhy2s0W0+ibZ4/4i5AII08HPRrTHugecfaZV/ESc=;
        b=nUt0LHjdqevm0FMg+R2jx+2uN53R1gl1WYlZCMS9zHl1dvssmYDjlDZ9P+QGD5XQ2l
         R7/W2lM5wJPbCnNFXFY1eiq7iyLEGKUmwH7tK4xT4k3WU38p1in2R/oto/sG+KORfJy3
         COG2lGUe0P2FnUpilJiIPrZEZKXRlZbjHE5Q0afkbaDCy5Y89uav4849ZwHYcdyCTZgo
         /ane46SaEzmZ8jkHYwR6vC/+tao/dVuareFnyyku/3QVdebEczzbOs3RfVN5Bb5qfBo0
         4JpONWJzsXvsHskNcNCM4gAA4MdPuoFHG3VucvVB4JcX01SEMhpWpLdzM6jmYZy/Zu6N
         3Bjw==
X-Forwarded-Encrypted: i=1; AJvYcCU9y5Xc7ig99kbAfzLY1aT3ZEVullqS2gnVs/TM/mpL9nlZL1q91HTMlpwgXJ6F/Kzlzo/l@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxcYYXkDRnnRPFV3FIQ1VZcWsIgw/6yCtVHuMAI4BxNFQ8ADQiH
	N53+6HhcshtoRkMyXbtfz9lzGNsudTJK67PM2ywJO0KgAlhAsJNVFp8jiqEp4YQ=
X-Gm-Gg: ASbGncsCMdbKFLCI5Xw7lWUiYD+qjzN7CSML2u6vpPjTVhnfmVR2yaGbCbF748WvXIL
	GKj8EEHhe1vTefdZ1/oUxyej3+wRhcnumecGmAjzNFizmy1qzSwuvJJCaNoFyGubA4o1ogsuAUX
	tVxYOkeedJkIKEVITkmxT4LnwY+BWWYfIia7BTeyduzV9r/QpLfmOqQ8bkLV2Pkpj6egTZbkdUr
	T1gLO9UAmWtfA2v6CmsiiD/rrXUewBeHt4gu7vnR0+oDgz+tQnkEYvvaJnt27L9LfEdNMQvyhxZ
	zmOMEc1/d0NW1fZPtGmulv+1VmGnWDw9q3ubOK5Ud5M4scgkbyAEbXSQCGfHDsbgk5A=
X-Google-Smtp-Source: AGHT+IFs3nK+pe6rOo20UAZbExl1avIweOrHQaIzDYat4OPFWIK8UoQ1RM99vLmh8msZebWb8alEIg==
X-Received: by 2002:a5d:5f47:0:b0:386:3672:73e7 with SMTP id ffacd0b85a97d-38c2b772610mr9064951f8f.9.1737895984772;
        Sun, 26 Jan 2025 04:53:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6905:4568:b67b:291? ([2001:8b0:aba:5f3c:6905:4568:b67b:291])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6b2sm8258643f8f.34.2025.01.26.04.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:53:04 -0800 (PST)
Message-ID: <2d28b3a78a7bdc3be27bee7d9d911e87bf4ad45b.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] doc/wic,README.hardware: add dd option
 conv=sparse
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joerg.sommer@navimatix.de, docs@lists.yoctoproject.org
Date: Sun, 26 Jan 2025 12:53:02 +0000
In-Reply-To: <2cef35c707ab0d985578ca4d042cfb33902dbcb5.1737894876.git.joerg.sommer@navimatix.de>
References: 
	<2cef35c707ab0d985578ca4d042cfb33902dbcb5.1737894876.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 12:53:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6179

On Sun, 2025-01-26 at 13:37 +0100, J=C3=B6rg Sommer via lists.yoctoproject.=
org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>=20
> The GNU implementation of dd supports the skipping of sparse blocks which
> can speed-up the write, esp. of wic images with big holes:
>=20
> =C2=A0=C2=A0=C2=A0 $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M
> =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze ein
> =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze aus
> =C2=A0=C2=A0=C2=A0 5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 84,2773 s,=
 66,8 MB/s
>=20
> =C2=A0=C2=A0=C2=A0 $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M conv=3D=
sparse
> =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze ein
> =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze aus
> =C2=A0=C2=A0=C2=A0 5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 11,3314 s,=
 497 MB/s
>=20
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
> =C2=A0documentation/dev-manual/wic.rst=C2=A0 |=C2=A0 8 +++++++-
> =C2=A0meta-yocto-bsp/README.hardware.md | 20 ++++++++++++++------
> =C2=A02 files changed, 21 insertions(+), 7 deletions(-)

I'm torn on this as it is potentially dangerous. It depends whether the
blocks really need to be zero or their contents doesn't matter. You
could leave existing data behind if you use the sparse option.

Cheers,

Richard


