Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E3DCA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 21:35:26 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.1923.1758576923847447563
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 14:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FIUgj375;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46d40c338b8so11604305e9.0
        for <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758576922; x=1759181722; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRST0IbHA5m04YmmKdq5idmYweeNADDZTZcazRz3RKM=;
        b=FIUgj375vs+ZteUiNUpE5VN1vkPYUwKD8Q7WO7ea+i9NNxLOUDL2qm6ZouuF9RTL/b
         asqUvI1LLETpO2vP3e3M0vsk/aYDoZSik7BqXCE5vMNJr1iXrV7I7u3fvNAFuvQ6PxEs
         mkthQiMeEZ0JM4shbu8k/RpJh/UWz/V3nz6ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758576922; x=1759181722;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vRST0IbHA5m04YmmKdq5idmYweeNADDZTZcazRz3RKM=;
        b=ZLR3lKCYOC2vEFas5oakLh2xQ57q09fhp7OOpdsoESptB94WXQa3ZacC3lGlasSkjE
         k+UOOs6HEq++4VV98FyrIfhE6u6/m6r4XgV9BMdT5eq2bSIRi2I+eUuqcbnzza1DLOtt
         S5J/64Br8YaZOAn9NxqyhswsRug7cAr6qYqf87IO8zlFbnsDK5eEeJk0sh0UIkKne4PT
         3+1JFttkA4qpil+gICxuxAMNGMZkr0ljMacfN+z25iA7DK1/GZ+li6kM5qUQl6a+rmAT
         xoLKz0hvweMyzIGBMSv5Zy7ETIwNt6lqV94Rsf3H3kHJbdcx7VpRNMSsMYtrdDIfrhhA
         TPdA==
X-Forwarded-Encrypted: i=1; AJvYcCX+zQAy+asu1GdmHFT4pkU93moiTdx2X9LglUBf0ptl9sHVPDCoU6qbjCkHdeo4xxB0kwKP@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyNL12z0BHtmfRDI0HWVfvmdwwNmqyUCgDLqpDHsZxSV4PPR/dy
	rlqRoYoyxZSOQCCxkl8bFsIrw16fQVUJ6eFB1WsYyuflwkybWIv8gCJZFSfON91OMK4=
X-Gm-Gg: ASbGncvdw6KcimLj/CyNg+cfvcomeI5XWiQnpdEexLuRzfSueVGyMp1oPzTokFEUHys
	9TOa8nHC8mmdXimhVYF5tXUYY37ZzvKEOB7UFc9GpW6EI/JiN3R0MXFKUseG7bhPBm2O+wsEpO7
	5On8C7hVZIcUnZRtZzJmJSip0OPLZHiqjffV95ac0CtWYhYLehTdi1VG2MA92udCmS3AnNszx9v
	BaOkPyJwL5pxmxZSqrMOyCDqMsr0lMBYsmdjAdE6VI4Q9pN/oziiLur3p1RFgZ/t39P3uKBKtLW
	n1+DgGHPozlCwJraMIZBbY4iNKO3ZuW/k1Wlo3Ih96fe2ZAwDSXNIyyVC4nWM4j6utjpyL/Wnwy
	ThBDEB9eWPg84CZr6EMM6r2tf9c/QA4Ici6e/6FGWCYQUuK5UpVgpNYSKcflmQjKa5XrX4rN1eH
	GdmpwZnYi8kcw=
X-Google-Smtp-Source: AGHT+IECfMUoyNsfWh6YxfdngX0S46/by37X6cRj1NR1WZjPIDEBDuy7gKwWIOZPhtQiz+l13PlIcQ==
X-Received: by 2002:a05:600c:1d0d:b0:45b:8b3e:9f66 with SMTP id 5b1f17b1804b1-46e1d98bfb7mr2639945e9.13.1758576922218;
        Mon, 22 Sep 2025 14:35:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3a01:b456:f5e4:5350? ([2001:8b0:aba:5f3c:3a01:b456:f5e4:5350])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613d14d212sm282462725e9.12.2025.09.22.14.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 14:35:21 -0700 (PDT)
Message-ID: <16be91f360b269bf508b2b5a2f36ddebc3b66a2c.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] docs: add util-linux-script package for Fedora
 42+
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, adrian.freihofer@siemens.com, 
	docs@lists.yoctoproject.org
Date: Mon, 22 Sep 2025 22:35:20 +0100
In-Reply-To: <DCZE1KGZEHV7.37QOM8E99CAEB@bootlin.com>
References: <20250922065859.157251-1-adrian.freihofer@siemens.com>
	 <DCZE1KGZEHV7.37QOM8E99CAEB@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 21:35:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7579

On Mon, 2025-09-22 at 16:11 +0200, Antonin Godard via lists.yoctoproject.or=
g wrote:
> On Mon Sep 22, 2025 at 8:58 AM CEST, Adrian Freihofer via lists.yoctoproj=
ect.org wrote:
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > Fedora 42 split the script utility from util-linux into a separate
> > util-linux-script package. This change adds conditional installation
> > of util-linux-script for Fedora 42 and later versions.
> > https://src.fedoraproject.org/rpms/util-linux/c/5a2471d6e5b0055cb607b30=
dc2e9613b312ffb74?branch=3Drawhide
> >=20
>=20
> Hi Adrian,
>=20
> I just realized that Fedora 42 is not (yet) part of the supported distrib=
utions,
> see https://git.yoctoproject.org/meta-yocto/tree/meta-poky/conf/distro/po=
ky.conf#n33.
>=20
> So it does not really make sense to make this appear here for now. Howeve=
r I'll
> keep this patch handy once we add support for it.

There is a fedora42 worker present on the autobuilder now:

https://autobuilder.yoctoproject.org/valkyrie/#/workers

so we probably should update that!

Cheers,

Richard

