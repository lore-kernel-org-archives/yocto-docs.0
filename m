Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FEBC54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 11:12:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.21610.1747912329910822212
 for <docs@lists.yoctoproject.org>;
 Thu, 22 May 2025 04:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WBASptm4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf257158fso60641735e9.2
        for <docs@lists.yoctoproject.org>; Thu, 22 May 2025 04:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747912328; x=1748517128; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UK4aAkdI1kHDmMB7j7zzh2/+dvBY3pbpvFCxg0cq/vY=;
        b=WBASptm4l4dx3Sy862UTb3J1VLfPQ4kliAPouGFAllqeHrUP7hMkLYKuvFEux877V0
         CCFj4yr2rmACslfqe7KU73MjwN25Q/oFRTxjQ1D5jAjxSPu0ye17dLT5/Z7OwvhO0P9J
         yLeZz7c44hkpLuywdeyvPf30GyS+9sfL4bRzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747912328; x=1748517128;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UK4aAkdI1kHDmMB7j7zzh2/+dvBY3pbpvFCxg0cq/vY=;
        b=VLmeQ3cE54jH8th25B7Z5Ki8z0PcOBpBrSyJMHz26X8XkvDq0Gp3O80ocin2YbPJt7
         zuhS1pRS3bAZ7cMiIT4lF91aXbWamZhwr2u5+S1MUWEFCHzmT8iNehAebctFCobZ5c4j
         ylicGbrSLZEguKHde7rESnU5q2fsAP05GBPt60QEqLwBA8C6HLuepjHYoPdGk5RjiZTk
         XDYv1r1Gh3SCqZgw35w8aH1WNTDvigGlgVVEXfEDRQ1Ba8IQYPASAuf0mGZ/MqMk+A+1
         vl4wOZPl3NB/yew3eYh9ZlYZxH/TR9nw3/PVnbesi6tdwOXGvxmNWuExTq17jtbGkczP
         HISA==
X-Gm-Message-State: AOJu0YxJM8BV2qtUf51p3QzDdxKE2wnUgC63rBEoqzCxMhYjds26cy/8
	2eLq7mk1dBpOyK5uiHan+9CCmCC1D1eaMnVZicljadZWD8CaFUJp/dD33/Fba71g2Vs=
X-Gm-Gg: ASbGncttwTORpAb3yHjF2SGOAGrWv5yraZIeIhOW/oRfYlgs3aVf7LMAam5Kd+fQzit
	cDlAaJCfkZPBayGy4iOaZ40FDiJgsTsbzfCUP3E0ajv+sc6dnuW69lW89iKfoJG8KdyXaKiqHG9
	qjqEJImTNICfCUelw8CTIn1HjF4qADoqg4jYdgU4cOoVHge7Xq64kFf2SGXXuCJ3Ak0kSx2aagF
	+uJ1lQ+YdizRVY/tyM4HGsq0paRiaTxjbCQBfw3KP0Xxg6KAPnMGO/rOCvhlo4ddkB1YF7sAq74
	mYynJLZN0EKLMjLRCA5AtnpbP6Vmw8LhG9wmWeyKQWNtLwueLQOSCffUJ+1JqbYvordfGEGYfVA
	NEwwfFgJmBmvSZlF5jpySUgfAjZEStS3uVgeQGiA8P2h05XG1xG8=
X-Google-Smtp-Source: AGHT+IFUMODfOKDMZO8hv78jp54D7KE45aaPDLHdZdynYuBvTZ2L6dAEejYquNpvOkJbh/rQ9pNweg==
X-Received: by 2002:a05:600c:a36a:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-442fefdaba1mr253084675e9.4.1747912328156;
        Thu, 22 May 2025 04:12:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f7cf:689b:6e57:f0de? ([2001:8b0:aba:5f3c:f7cf:689b:6e57:f0de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm98132925e9.36.2025.05.22.04.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:12:06 -0700 (PDT)
Message-ID: <d11158333f8ac0f2d6525e593ba7dd0ce6a57369.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] fetch2: Ensure a valid symlink in `PREMIRRORS` case
 when using shallow cloning
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Koch <stefan-koch@siemens.com>, 
	bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org, liezhi.yang@windriver.com, 
	niqingliang2003@gmail.com, alex.kanavin@gmail.com,
 quentin.schulz@cherry.de, 	simon.sudler@siemens.com, jan.kiszka@siemens.com
Date: Thu, 22 May 2025 12:12:04 +0100
In-Reply-To: <20250521163311.2745308-1-stefan-koch@siemens.com>
References: <20250521163311.2745308-1-stefan-koch@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 May 2025 11:12:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6878

On Wed, 2025-05-21 at 18:33 +0200, Stefan Koch wrote:
> - Since `ud.path` contains in that case the `PREMIRRORS` prefix path,
> =C2=A0 this change ensures that a correct symlink is set up.
>=20
> Signed-off-by: Stefan Koch <stefan-koch@siemens.com>
> ---
> =C2=A0lib/bb/fetch2/__init__.py | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/lib/bb/fetch2/__init__.py b/lib/bb/fetch2/__init__.py
> index 2de4f4f8c..052505456 100644
> --- a/lib/bb/fetch2/__init__.py
> +++ b/lib/bb/fetch2/__init__.py
> @@ -1117,7 +1117,12 @@ def try_mirror_url(fetch, origud, ud, ld, check =
=3D False):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 origud.method.build_mirror=
_data(origud, ld)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return origud.localpath
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Otherwise the result i=
s a local file:// and we symlink to it
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # This could also be a link t=
o a shallow archive
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ensure_symlink(ud.localp=
ath, origud.localpath)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # When using shallow mode, ad=
d a symlink to the original fullshallow
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # path to ensure a valid syml=
ink even in the `PREMIRRORS` case
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if getattr(ud, 'shallow', Fal=
se) and not os.path.exists(origud.fullshallow):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ensur=
e_symlink(ud.localpath, origud.fullshallow)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 update_stamp(origud, ld)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ud.localpath

I guess the one problem here is that we're teaching a general function
in __init__ a fetcher specific issue :/.

Ideally we probably should have some fetcher specific function calls
for this to preserve the independence of the parent methods...

Cheers,

Richard

