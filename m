Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89A1C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 00:47:46 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.15027.1646009266056664563
 for <docs@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 16:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dk1RWTUg;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id gb39so21637837ejc.1
        for <docs@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 16:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=zG9QpyIwpgV1ClP/tb/vURmuhfS19MKFLcOf6kuJ2lU=;
        b=dk1RWTUg+Y005hsZltm76EJUYVAZz2K9xXBnsKKvYztiQBdVn1JqqM/c8JoadDnedF
         HOW+6p8/3CHw4wP0lQmekQQ5Tdh/8/6ZaVE5i6RoJbwBDFp9kky+0mGM23NBE36RNBfU
         p4vz1rrD1PWV0z6nX/NykIMs4FURTACsBUw0RKSNsIKjHtYPqSIs5PyGaj+1naOkQXlj
         zbPeoQQzxXMnLAbl+Q5ASNapcRq7v0+5Znl3YomaZc1dLJqf7L1xEucr9UoTQhqPRWeQ
         9QpKkCZS51nLOFFcam4RezIX+sLvRrWRGmhMKqMq3jveGQkjJpRXmGv+MJgTXuPAN1HM
         jvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=zG9QpyIwpgV1ClP/tb/vURmuhfS19MKFLcOf6kuJ2lU=;
        b=SBq4sYIWuna9VNQM531oqlSXcezG0GQobejOQyBLwKks/KVrwFoqfX6ooYadQc7o0N
         nH1cnhcen0N0uMNlKAOZmXRCPJi0vh1wzK2PvQc7eWXRJc2sgEllTd1dgo09UBQ4leBY
         /Si9BDiULaKB2H3f8HyVHjgK+dLPvFhzbcrjOHOJdJBE1a3W7WUYfVqjDA28hNcgNhNz
         yYyQqRpAeT3NbXT4qAl1e2iYbgku3532RURcx1vcWC1C3piShfYM2SDWfk9RU20oSgSc
         n528REcv30kNwGYUzeMkQ3wtIE9tDsDDwkXzuZs3385ydcJS+kz+YFkqeD1ndx2QPaI/
         NwQw==
X-Gm-Message-State: AOAM531M6x3IBoC/cdh9EnTl4ZAItGCMCRpPWe8pYSUHMD3W17jSjE9n
	EKlHVg3nkniXyV2XDTJWwlHf9udLB54ar5S3jWQ/UoR07SQ=
X-Google-Smtp-Source: 
 ABdhPJzyo5e5ubo8zfS0rIv+W3uiZfBJdDXTVIOqXa4RG/+1paedVfmjs9AVFiyeH2+nwqrcRXWtShFEDhkE7/Mm4wQ=
X-Received: by 2002:a17:906:7210:b0:6d6:7881:1483 with SMTP id
 m16-20020a170906721000b006d678811483mr5692172ejk.227.1646009263824; Sun, 27
 Feb 2022 16:47:43 -0800 (PST)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 27 Feb 2022 16:47:32 -0800
Message-ID: 
 <CANx9H-Bpvn-_bVqZkgkNGcwWEFZ3cY+B_Ex4MDpjU_cPt-G9GQ@mail.gmail.com>
Subject: [RFC,WIP] removal of distutils* from docs
To: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000077a1b005d909654a"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Feb 2022 00:47:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2504

--00000000000077a1b005d909654a
Content-Type: text/plain; charset="UTF-8"

I have a WIP branch to remove distutils from the yocto-docs, but I'm not
sure what to do in the old migration guides that reference the now gone
classes and variables.

https://github.com/moto-timo/yocto-docs/tree/timo/drop-distutils

--00000000000077a1b005d909654a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a WIP branch to remove distutils from the yocto-doc=
s, but I&#39;m not sure what to do in the old migration guides that referen=
ce the now gone classes and variables.<div><br></div><div><a href=3D"https:=
//github.com/moto-timo/yocto-docs/tree/timo/drop-distutils">https://github.=
com/moto-timo/yocto-docs/tree/timo/drop-distutils</a><br></div><div><br></d=
iv></div>

--00000000000077a1b005d909654a--

