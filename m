Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09B7C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 15:29:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.15219.1708702140132220018
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Feb 2024 07:29:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V8QbQQGT;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41294af9ad7so3443225e9.3
        for <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 07:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708702138; x=1709306938; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmU+WD2Gjl+VzbfNr5FiXtM9ZLazmu3zP1Y+HvKAedc=;
        b=V8QbQQGT1OPru33O1ZDZYxmmjLJSsTzZhdJmUH69msmHkRJpvVs+WAcxwFK1dnlay9
         o1UQ3KgzAkTITpXqWpjO9QUihbuR6+Abp3Id5OXBI4/t4zR9qcWRnnSW5J1D8sdnE2Sx
         VFaWov+b/DlyWeeSlz0zS4iuI++bEObkeEkIQBlOMkqnkzX1wkQK19MUQLWFGqXW/WeN
         iwKPh05Kr1doh8z0bPBchIcDPYTxF7ath+LNCmEZe9F5noMMiPhLh44FtXONyDJh+M08
         y/AhcBIq4sXMSIEW/2DA+LZUaT+/YvHvzzHz7Wn4u6ZEjFtsvM/ddHdCChu3SYxzL8eF
         8PBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708702138; x=1709306938;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lmU+WD2Gjl+VzbfNr5FiXtM9ZLazmu3zP1Y+HvKAedc=;
        b=dr/qKY8c+H0iYzWEcPDbgY9XtTWqfD4cYTOQcqdPoFCEVXJrp82zTrdqHH09VMZ7+h
         U5MGL6Ay4F6o1dlpfBQ2iCYsFgJH3ZV5rE1tRgibCJ72ZuGiWNDDt2dsGG1NzPjm1nM7
         biij+1C65hIyGh598fQm3Fv6Fdx82PegIl0qGNf/up1nRCr3C+4HkxfUJGQjL6V4hTfJ
         SvKc2I8yk6DGDQu6m357MNa4/6DPZEOwLYsvV1vfjfibahUIANjvijgGSR17KISirLjI
         lPvBCv5Skqn7elZwHVVruYJgrQ6x1WXxpLkRebDyoTQEBzGGI7VpBQIj2D2aK+judD4h
         R2Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUrCGnDF6hPCNN9CBZCWS5UyQMilus+KjN49u/ibQYDW+hDn+unsIxzGX5++3+dI0qrv/9SRNISM5WtRo6zhHISo24Vvb0HCdbv8JM=
X-Gm-Message-State: AOJu0YxYgLVZMDiBiJ4gTKsIewi1r8DGxitnvJlpEMPRRANc/yYcm0u8
	jqetQ7TivSnpOLy/ew9u0wwpGc28avRCZ8fdzEO6K7JB44SbgV6Y
X-Google-Smtp-Source: AGHT+IHEmH4QGhGhBL3+Mb/VuUSS6S2WpUwqaTB+mWjONk4oFnS1yH+YhfLSuoyjLwqW6QBni5umyA==
X-Received: by 2002:adf:f30b:0:b0:33d:b2d5:ede9 with SMTP id i11-20020adff30b000000b0033db2d5ede9mr80505wro.40.1708702138326;
        Fri, 23 Feb 2024 07:28:58 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id q25-20020a056000137900b0033ce06c303csm3123841wrz.40.2024.02.23.07.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 07:28:57 -0800 (PST)
Message-ID: <a0d2052d14f7d931e430c18f7e70aad39799dba1.camel@gmail.com>
Subject: Re: [docs] [PATCH] sdk-manual: extensible.rst: cover devtool ide-sdk
From: adrian.freihofer@gmail.com
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Fri, 23 Feb 2024 16:28:57 +0100
In-Reply-To: <0ec61615-ec1d-4fa5-8753-10730e0ac7da@bootlin.com>
References: <20240221195921.1911170-1-adrian.freihofer@siemens.com>
	 <0ec61615-ec1d-4fa5-8753-10730e0ac7da@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 15:29:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4866

On Fri, 2024-02-23 at 10:35 +0100, Michael Opdenacker wrote:
> Hi Andrian
>=20
> On 2/21/24 at 20:59, Adrian Freihofer wrote:
> > Cover the new devtool ide plugin in the extensible sdk section.
> >=20
> > Many thanks to Enguerrand de Ribaucourt for his re-view and
> > contributions.
>=20
>=20
> Many thanks for this very nice addition to the documentation! I took
> a=20
> bit of time to review it, fix a few minor issues and also improve the
> formatting.
>=20
> That would have taken too much time to report all the small changes I
> wanted to make, so I directly merged them in the master-next branch.
> You=20
> can check the resulting output on=20
> https://docs.yoctoproject.org/next/sdk-manual/extensible.html=C2=A0or the=
=20
> final source code on=20
> https://git.yoctoproject.org/yocto-docs/log/?h=3Dmaster-next=C2=A0.
>=20
> That's not too late to correct some mistakes I could have introduced.

Thank you very much. Your corrections look very good.
Adrian

> Thanks again
> Cheers
> Michael.
>=20


