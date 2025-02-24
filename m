Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7083EC021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 22:14:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.102529.1740435244160072358
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 14:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mORaK1bJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f31f7731fso2410916f8f.0
        for <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 14:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740435242; x=1741040042; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfZgeUyjhF7XjJ7z59dzg1MtDp4rekuiQwhagD+JMEU=;
        b=mORaK1bJMXAcz4DsSyIOX54PV539n1hzfNNBFwBH3eLC5ADpzYvHezBXRfRJz6kIKH
         fbugYB+9DzWpoWs3b+wrUavbbrBRwx9MjIxJ+heAiGohWaYiQ9RhvMFQcu9stcCTOESR
         e3FRWi+HyuSxrZ16pBDVDFh7vEJdzB+cgxQFy5qc0kXYAiWGRp+5cXBfGUaPwUyPWmn1
         nNlENVkzVjZByQp3rFKyJmSI9WRTUFBlKsKmPUwKj7n1mfDcMnCjpWE05CM5+8BSpLVs
         Qla1020ue7WZUfJZoazI3ZtyqWUgObdxZADSD/pQNYckUnsBm1PIz1qa9crHDBzJISDC
         Cf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740435242; x=1741040042;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mfZgeUyjhF7XjJ7z59dzg1MtDp4rekuiQwhagD+JMEU=;
        b=WRuIgzu1Fx4FRGrwr256UlbzJBtJmmWSTPLLu9JZY1Oywo+13sjqDT1XOFd5LVa2C9
         gN8UCS4AgXoLig5YZsyjEMWDGo3W02Ur5KcvNTYLG67EfbYW0gfXxAh7GxCtdg8jMEpL
         ipRTHj6XKYtyE30M54gceNsy7inwIq2Ypz/Dc5rtklWKBoaq1bJLsfeq4qecvVkfF4/G
         7SSdKTgbiPbHAJRwY2dsdzxIsd/pVCY+7tzT4/6OBjDCNN7LUMX5Id3RpNvuaBtRM5ZQ
         +oxUHqoU2rci7xEBk1jfR2YCoC07YB+zYsiVUoJrjtdppAGmek3uq03h5D3vhuBN+/MG
         EYMg==
X-Forwarded-Encrypted: i=1; AJvYcCUHlHBN2nxzU3lkq2Jlj2jpKWhZcrWQOq+wZ5W+gLHwR77sToVRfIfpQCyFAd1ncBmZiill@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxuwSEsu9RYrrdMVG0O9mTRb7DxzzQ5e2GBr5Nmdl1YwN8ct4FY
	jjHUI3A6jvFpTPsW7J36KJ66BJ60ZbnfzKlXHF3b3Ue4IQ2t+xO1
X-Gm-Gg: ASbGncuTU7fIkXmLL5qjjE9LpXzEXVN0oRRvNcG/XRPnKGblnOEJKOo9yr/Ev42DSjh
	8rKbzet9n+2ZEadogztEBD6Y7Zf0pVup+ajnp2e2k7WZwi4oBZbs18Eeg2e6fsJLwjLEyR4Lkz8
	yxHwIkB6uwEQuCelM0hi7YcXMzZSAVn6bE6yVhN2gh7G0dShDHqqnMLqNB5NQNhXR4lNndXpo6M
	8F0hfR1lSdBY1yoFT12iYdEPeGT3WXE+itIqAnhEcuVeh1FuC9tKiZYLaKV4T2mwqZahVSHh0hL
	Aph7mgRVOskEFsC98dHkAa6drld1oE3guWQfWYzf3xr4/ZSETxk7tUrJ769rO57cTEPwbCeo6C4
	=
X-Google-Smtp-Source: AGHT+IG9ie7fqKNGJWF7Y+kt49uc2UgicuRafQ2V42xQkc4m9sIgaFPPKe6p8VC1C1BzAEmH3Y53Ww==
X-Received: by 2002:a05:6000:186c:b0:38d:eaee:3b32 with SMTP id ffacd0b85a97d-38f6e977bb1mr11520142f8f.26.1740435242237;
        Mon, 24 Feb 2025 14:14:02 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7114sm244154f8f.74.2025.02.24.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 14:14:01 -0800 (PST)
Message-ID: <ddf80337ae8f7d5d3c8fda38bbc48a68c384be1a.camel@gmail.com>
Subject: Re: [docs] [PATCH v2 1/2] ref-manual: cover UBOOT_ENV variables
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Date: Mon, 24 Feb 2025 23:14:01 +0100
In-Reply-To: <D80L3KLEZTJ9.T3ONJF2WKEGK@bootlin.com>
References: <20250224082729.3325776-1-adrian.freihofer@siemens.com>
	 <D80L3KLEZTJ9.T3ONJF2WKEGK@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 22:14:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6441

Hi Antonin

I will just send a v3 which fixes all your findings, except this one
needs clarification:

snip
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 Adding a script ``boot.cmd`` as=
 an uImage to ``/boot``::
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UBO=
OT_ENV =3D "boot"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UBO=
OT_ENV_SUFFIX =3D "scr"
>=20
> Or shouldn't you set UBOOT_ENV_SRC_SUFFIX to "cmd" here too? I'm a
> little
> confused as why you refer to boot.cmd yet "cmd" is not defined here.

UBOOT_ENV_SRC_SUFFIX ?=3D "cmd" is the default.

I have spent many hours trying to understand the code that handles the
UBOOT_ENV* variables. It's super complicated. In uboot.inc, there is:

do_compile () {
if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" =3D "scr" ]; then
${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script \
-d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}
fi
}

do_install () {
if [ -n "${UBOOT_ENV}" ]; then
install -m 644 ${B}/${UBOOT_ENV_BINARY} \
${D}/boot/${UBOOT_ENV_IMAGE}
fi
}

Depending on the file ending respectively the UBOOT_ENV_SUFFIX
variable, something different happens: Either
 * a script which can be loaded by U-Boot's source command
   or
 * an image including a script which can be handled by U-Boot's load
   command
   ends up in /boot.

In u-boot-config.bbclass there are more variables defined:
 * Documented variables:
   UBOOT_ENV_SUFFIX ?=3D "txt"
   UBOOT_ENV ?=3D ""
   UBOOT_ENV_SRC_SUFFIX ?=3D "cmd"
 * Variables which are considered as internal and hence not documented
   on purpose:
   UBOOT_ENV_SRC ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
   UBOOT_ENV_BINARY ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
   ...two more...

So my patch tries to keep it as simple as possible but still cover the
2 relevant use cases. To make it more clear, I added:
"It defaults to ``cmd``."
to the UBOOT_ENV_SRC_SUFFIX section.

I hope this makes it more understandable without a need for dropping
all these details on the users.


Note: It was even much more complicated when the kernel-
fitimage.bbclass was in use as well. The kernel-fitimage.bbclass is now
decoupled which simplifies (or maybe I should say fixes) it quite a
bit.

>=20
snip

Thank you for the review!
Adrian


