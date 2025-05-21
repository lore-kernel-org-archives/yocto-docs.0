Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71610C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 10:22:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.7948.1747822960871873406
 for <docs@lists.yoctoproject.org>;
 Wed, 21 May 2025 03:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HXH1rxPr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-445b11306abso24003545e9.3
        for <docs@lists.yoctoproject.org>; Wed, 21 May 2025 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747822959; x=1748427759; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fr0qgxFtgANCgJz6YuSJ5X2seDhaVg65bi9vHc4T0yA=;
        b=HXH1rxPrPCAnb18z01Ewh30lOMEUkpBGrUFiGQNDHMzAsA4YxeeMOgbzkZIlPDZaYK
         Phuwwrinw9MUpPgK1SQzj91YTRpcCUY4zrUYedqE+b6GedWVEZedQ2Rstf2Hcf70PrxS
         faPpFc/0ZBUMWSQJrZsUIt7Ea020r2vd6ov6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822959; x=1748427759;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fr0qgxFtgANCgJz6YuSJ5X2seDhaVg65bi9vHc4T0yA=;
        b=bf4LSAELKy5z6IMEvIY++UIwUQD8bOBLI7RhhcB4JvDmIT/4iRxzkS54LtgR9SnX2c
         BAub0AJ/qB/RIKYSVdcQlH8B5Sbg7jLAwegc8gFO9YtJNtdMdZw113w71XZlm27bQXpC
         gpsrMLwULZGEzFcjRFOdzeLmt0gs442/VoVENTp40JLmSkUwjWkhiF9wMWwA0AmqQbEi
         H0UVW1Q8jlCXxnGZwML+ZwhA+t+jNVriJgLUb19XOfpj3gOJmm+NbHdYMW/IW9zZr2gN
         hk+5/jwI/xOPtpCqhLs9rHCwW2eXblKiIGVm9Rvhp+EM5s6F8eVV2/XgPlRj614ZxDaP
         uIeA==
X-Gm-Message-State: AOJu0YwexjLBbO68V0XSS3WZTQtjHcv3WawiWHfAGLQSZdMRdFJb2dw0
	SEO/5KIpcAizMdJocHyZaNDhwp0F7A9/XX9Uxz3bAUSSfi/gg/xgx71Xin9ku+/84ek=
X-Gm-Gg: ASbGnctsdfW0fCstn1+6kwDV4WS1cBzrTOemr7e+WwjNbZk2vZ9r+UCcX7RnS5hPHlg
	ctbhNeK0bwh3HmR27/NUTvPufBOL97hE+rNyyv2jNIRQr3bZ8aIAhrvAWYcPpJFHhpnDkOQw1mt
	zBWjKtIB1t2YJFi9dVCXKLxLRcBFnJ6WeRXnoV/eWwJxVYszbBGHg7eWdpI+/gmPOLHeBoxGXlC
	VFg5ZUGGdHwr13SljhCJedYH1OKTt2Hw73omW9jDYk1ae4BaqAhtmxuK1EytKsgc12zdkIRHMNJ
	cKz+wrTZaN3nRtkYwvjMJoPROW44L7842kOHLihZrcQHxurdDRhyEqD8jogZU5dfxSBit0+hVTc
	U8b/aEaER5UWOVRbQbss6azUD1A2MiYfKdGmewR5K
X-Google-Smtp-Source: AGHT+IH5fRtbxG5qDmROjyHBC+8DxQMjfIdy5IWHw3YMo13usNlX0NmGheRU8PuIsSjQO1FmvPo4Tg==
X-Received: by 2002:a05:600c:c059:10b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-442ff571262mr123818355e9.15.1747822958568;
        Wed, 21 May 2025 03:22:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b5da:39cf:fb42:2a73? ([2001:8b0:aba:5f3c:b5da:39cf:fb42:2a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aef8asm65916035e9.29.2025.05.21.03.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 03:22:37 -0700 (PDT)
Message-ID: <e8c25ab66dd3f0c393c727b6eacc1301f51e23df.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] fetch2: Ensure a valid symlink in `PREMIRRORS` case
 when using shallow cloning
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Koch <stefan-koch@siemens.com>, 
	bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org, liezhi.yang@windriver.com, 
	niqingliang2003@gmail.com, alex.kanavin@gmail.com,
 quentin.schulz@cherry.de, 	simon.sudler@siemens.com, jan.kiszka@siemens.com
Date: Wed, 21 May 2025 11:22:36 +0100
In-Reply-To: <20250521091153.2445853-2-stefan-koch@siemens.com>
References: <20250521091153.2445853-1-stefan-koch@siemens.com>
	 <20250521091153.2445853-2-stefan-koch@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 May 2025 10:22:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6860

On Wed, 2025-05-21 at 11:11 +0200, Stefan Koch wrote:
> - Since `ud.path` contains in that case the `PREMIRRORS` prefix path,
> =C2=A0 this change ensures that a correct symlink is set up.
>=20
> Signed-off-by: Stefan Koch <stefan-koch@siemens.com>
> ---
> =C2=A0lib/bb/fetch2/__init__.py | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/lib/bb/fetch2/__init__.py b/lib/bb/fetch2/__init__.py
> index 2de4f4f8c..7459adb00 100644
> --- a/lib/bb/fetch2/__init__.py
> +++ b/lib/bb/fetch2/__init__.py
> @@ -1117,7 +1117,12 @@ def try_mirror_url(fetch, origud, ud, ld,
> check =3D False):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 origud.method.build_mirror=
_data(origud, ld)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return origud.localpath
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Otherwise the result i=
s a local file:// and we symlink to
> it
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # This could also be a link t=
o a shallow archive
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ensure_symlink(ud.localp=
ath, origud.localpath)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # When using shallow mode, ad=
d a symlink to the original
> fullshallow
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # path to ensure a valid syml=
ink even in the `PREMIRRORS`
> case
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ud.shallow and not os.path=
.exists(origud.fullshallow):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ensur=
e_symlink(ud.localpath, origud.fullshallow)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 update_stamp(origud, ld)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ud.localpath

FWIW this looks/sounds like the right fix to me. Is there a test case
we should add?

Cheers,

Richard

