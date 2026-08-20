Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7C1C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 13:23:32 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7046.1787232207865558874
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 06:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=KGwHPoFx;
 spf=pass (domain: baylibre.com, ip: 209.85.160.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-43bf9548df4so1826633fac.0
        for <docs@lists.yoctoproject.org>; Thu, 20 Aug 2026 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787232207; x=1787837007; darn=lists.yoctoproject.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQR7tOLYqX1dC3EzO/NiEhMgG4W4+mDiQ0kKSN3efj4=;
        b=KGwHPoFxXaxtO2CYZrPHzvlpNUlaonMeIZcr4XTLPpPVt2NhaoZcCsQ6FiF8lvVHVt
         XaNLK0iDkStMCsjl1B4e3nv2PfzuiclqPCiFLhJCZ0MWhEL2TdvGcd6IFTYTTVkOkIcx
         DvKBWZQ0XTFlYWI0Gic//Si6SGLDQm+xJD+LNhRE5GP6KjX/iQQJ8+VhnyU4Y95qZzak
         bxQTInRYMc9U1YhJ0uhgD5m5m8Xwp2jNSzDyc/wJB9ePn3wG7svF4/Cwv13jR+XxAYN2
         gcK9J8laHJ3qXctWPOhuKV0C2LPpNZ1OA3CgIs/aJYSRbQet7q2HfFdrMS3bQELK4tFy
         CTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787232207; x=1787837007;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQR7tOLYqX1dC3EzO/NiEhMgG4W4+mDiQ0kKSN3efj4=;
        b=RRtXUXxy+IBqNACTvbRxSgrBdvIEMlT3ZoNeFD/1XcUA04ufFOY2d95zh3qnwFOdh9
         R2vWi/8XAvoWUtsZM1p69HdK6YrTyoy8FmakubCO/eDADpWEKQCeAaUSWkOnoXa84v1i
         rZVxq1XJrpefNhKreFpDG6xueVDf9DK2Qcg/hsQsAIMbKOD+/ny+JCKlSo8y6PDYJeVP
         /ydrMxtyHjBWoMcSsy+JKw+AXYsLQcxET8jGFcbG5AdmDdJilAqBPb7Qam0g3OZ/7aR1
         YMB/WzoicM84oPmRe/vTbDwf+U2ILMKmEtG7FJKF5Dr3ywFyuZnJRLshqKVStPYRSrOi
         1RNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVJsGTfFvXpAPU0wR1BiLQD2HL6v7hUq4cVzl6W876iSZJyGDgb2cVqRhrQsVYRzAOW2LM@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwgESjfn+ZlDVdC3iiDx1MvXquIt0WXD/d/NHla/V4+XcG2EBNH
	VpyQ0yRd/G2yXy1MUnnil5PwdpF8g1YWp3qKmUmnFjH3+kS5cWy3Q8dKnN5zhwSpDyw=
X-Gm-Gg: AR+sD10gAOrnM/YmwM7l62N05gZSCcUAe9EpPjc5X5X4Ol/rBDJIj0JCB9OvX6u+HZw
	59KDvdY30pSUXDtUA1/0me6C6RpQgwvDH81eDvgr9nC+SorTuXRSetWlW6cg11hUI4W6Sve9egl
	xvROYO5Fb7k2Y7ZU4x5pRcOBA0lCEGvoW1WhvfAEacxiJZI6Mqgq8lsVeVmlhohFsjRXqXHOpjd
	rL5V9lDUFgh4eTStBTiKhs9vlfWlU0sSEbjMOEZHSQY4Ce3/Ciu82CWQFR5F6uYJr+hgklrwSWu
	tPEHCENXrTWgSRfF8n08pjxEo6yxHq3qYUMPck+/PXgcO8oenXZ2WAuVuVqG/ME/4sDYs5dIb5n
	KdxU9bs0yoQm8fQ53BjSuCsXF/ueNmPqd195hkFSr16bDPhaTJH51xJ9D66ZpTaICtKuqKce1kY
	Jb6OeSTCIjDbWpsOez3B6Q3hkEL4s+1eGn30NJ0gcak3Nwhc+bqG1Dvz+CwM+UACUL
X-Received: by 2002:a05:6871:c8e6:b0:456:baee:4819 with SMTP id 586e51a60fabf-462f65c3badmr12270440fac.11.1787232206966;
        Thu, 20 Aug 2026 06:23:26 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4632a6ca866sm1592083fac.6.2026.08.20.06.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 06:23:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 09:23:24 -0400
Message-Id: <DKTSXW5WZTQW.383TF2WMPIE77@baylibre.com>
Subject: Re: commands to do "pip install" in docs README file need enhancing
From: <tgamblin@baylibre.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.22.0
References: <959e65b6-e7eb-bcc3-992f-bed7276c8449@crashcourse.ca>
In-Reply-To: <959e65b6-e7eb-bcc3-992f-bed7276c8449@crashcourse.ca>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Aug 2026 13:23:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10302

On Thu Aug 20, 2026 at 7:20 AM EDT, Robert P. J. Day wrote:
>
>   I just went through this with another Sphinx-based documentation
> repo -- installation instructions that advise the reader to install
> Python modules with "pip install" fail on my Debian 13 system with:
>
>
> $ pip install sphinx-lint
> error: externally-managed-environment
>
> =C3=97 This environment is externally managed
> =E2=95=B0=E2=94=80> To install Python packages system-wide, try apt insta=
ll
>     python3-xyz, where xyz is the package you are trying to
>     install.
>
>     If you wish to install a non-Debian-packaged Python package,
>     create a virtual environment using python3 -m venv path/to/venv.
>     Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
>     sure you have python3-full installed.
>
>     If you wish to install a non-Debian packaged Python application,
>     it may be easiest to use pipx install xyz, which will manage a
>     virtual environment for you. Make sure you have pipx installed.
>
>     See /usr/share/doc/python3.13/README.venv for more information.
>
> note: If you believe this is a mistake, please contact your Python
> installation or OS distribution provider. You can override this, at
> the risk of breaking your Python installation or OS, by passing
> --break-system-packages.
> hint: See PEP 668 for the detailed specification.
>
>
>   Yes, there are solutions, such as using "pipx" instead of "pip", and
> what have you, but it seems that the README file should be augmented
> with an explanation as to how to deal with the above given that the
> "pip install" commands are, in some cases, guaranteed to fail.

Creating a venv like the error suggests (or via uv) is simple enough and IM=
O
best practice for anything like this. You could submit a change to provide =
short
examples, even replacing the references to pipenv earlier in the file.
>
> rday



