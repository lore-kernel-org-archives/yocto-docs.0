Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C475CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:04:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46294.1778490258340542598
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 02:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tCL51t2q;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso47020525e9.0
        for <docs@lists.yoctoproject.org>; Mon, 11 May 2026 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778490257; x=1779095057; darn=lists.yoctoproject.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sc1D44xH03fT62wgWIBgngSkk8ivcW/B+4p1K/gyMk=;
        b=tCL51t2qF/VlMVgY9GDOCEMoBxv5+060ie+CZlishbgR+syfqa3gtN0eYwPBhVrAk6
         pe9HBQAz8o1Fyu6plJ288uZeWeclBWlk2RNhD2OrH5TDHNAkPYReTVqB4i4CmJj/GKCc
         fCKllEbz5ZfhE8C9xZ1SKIyDnTOJ/RuWL8eY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490257; x=1779095057;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/sc1D44xH03fT62wgWIBgngSkk8ivcW/B+4p1K/gyMk=;
        b=mADJAKC935M4tS1mItJ8rxwZGk9y7KjkZGGIDc5qeeTyKW/npgMBrKHPl+4lYJFRaj
         XSM5acK7dRRNgSrDIafWpRwDaqvRmKyzrNng9qKQrojCHNHqTiET5vXi6dAoGEx9S4pA
         ktebVdxfc8780Ff4UnMYy/sQImiDwZFRnieGK6FWyETDeMvvZ7g010tbHoYmnOuBxsp/
         KlnM4PC4ELEs+yDlPfwdl90pDsH/qtfDxt8CEeUGG6lndpuVfrGbCTxArPExYwv0BrqH
         qlVUsRYJ/we+HYJw05pzs5d8dtW7H3GURj9TK5gLMdS9UpKfFzAtFGOE9xGlN9sP8Y03
         VPuw==
X-Forwarded-Encrypted: i=1; AFNElJ+/9jYnymi8zsHDRDfqqlyTP75HSOFXYgp3FFe3UZ073NQERjzSqUPo6EvygAMbLg/LckTQ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YynFDTDAnZ8bEPwpeDCOuRFll7EVdGdcc8O/WDo49t+o7R336Dc
	GrvoCkfEL+EjCpPz8qmIH57E74RhcyL6/tTiRUMTkZHujqZn/2ffxuSpg+m/NwnSlQi0aC3wAi/
	jskIxZD8=
X-Gm-Gg: Acq92OG+cD3DawDYyNEP6gsFuMNzbVRqa9E6tiDGRB94kUwfzSg32lzZtxJSUW8Db0Z
	98VyC5Gf0EXeokWl1vPfHC1RQL01YpZ2HSDNHmvFcFUqam3AGrkT4P1FaqfkT2vRR4Jy3V8Uaie
	f6BRSdJPC20eUpbU04Y3raiMLKSr2ccZsjGS4vFVL5kCcCkJ8rHM23zAp0uSdlwfgfu0qYSVpFx
	udMHVxN+WxBoaJWaoe4MWBrQ7cA83+FPNNVj6mSq+Urpd7U7fen23W33Zn+PCCyUAi9hAaxeFvL
	e0Y91g3+g5MojglJH5u7slY/ltHBNBgF0EsrijZ86BabwEPOoj41G77Y7dnVq6ObXvXoIX2Wo69
	j5bNZUFEOof4qwvJa3/cVXKuYsv1eC6eni0xRkoy875ewDaAy/SH71O7OgHz6k8zBDzoGDJNgC5
	ldHWL1QyRtAmJgLfKpxA8q0Uy2HiCad5zb8hvEWTkPTS2QDj/1ku6cM5zJSl8C9UW/ESZJBTNu8
	J6pXIlkG8A=
X-Received: by 2002:a05:600c:c494:b0:48d:35e:82cb with SMTP id 5b1f17b1804b1-48e51f410c2mr358673315e9.28.1778490256413;
        Mon, 11 May 2026 02:04:16 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e5630sm158331355e9.8.2026.05.11.02.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:04:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 11:04:15 +0200
Message-Id: <DIFQ6GAIYIM2.37U1WCDQ30TPA@smile.fr>
Subject: Re: [docs] [PATCH] ref-manual/variables: document the 'dynamic
 layer' concept
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <mw.choi@telica.co.kr>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.0
References: <gab162622225.0.1778403896896@telica.co.kr>
In-Reply-To: <gab162622225.0.1778403896896@telica.co.kr>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 09:04:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9436

On Sun May 10, 2026 at 11:04 AM CEST, =EC=B5=9C=EB=AF=BC=EC=9A=B0 via lists=
.yoctoproject.org wrote:
> Hello,=C2=A0I have attached a patch to document the BBFILES_DYNAMIC varia=
ble in the reference manual.=C2=A0
> Best regards,=C2=A0Minwoo Choi
>
> (=EC=A3=BC)=ED=85=94=EB=A6=AC=EC=B9=B4=C2=A0FW=ED=8C=80 =EC=B5=9C=EB=AF=
=BC=EC=9A=B0 =EC=A3=BC=EC=9E=84=EF=BD=9CMinwoo ChoiMobile. +82 10-4845-3293=
E-mail.=C2=A0mw.choi@telica.co.kr=EC=A3=BC=EC=86=8C.=C2=A0(16006)=C2=A0=EA=
=B2=BD=EA=B8=B0=EB=8F=84=C2=A0=EC=9D=98=EC=99=95=EC=8B=9C=C2=A0=EC=9D=B4=EB=
=AF=B8=EB=A1=9C40=C2=A0=EC=9D=B8=EB=8D=95=EC=9B=90=C2=A0IT=C2=A0=EB=B0=B8=
=EB=A6=AC=C2=A0A=EB=8F=99=C2=A0411=ED=98=B8

Hello,

Thanks for working on this.
Can you follow instructions at https://docs.yoctoproject.org/contributor-gu=
ide/submit-changes.html#sending-the-patches-via-email
to send a properly formatted patch? (Most notably, use git-send-email
instead of attaching patches to standard email).

An altenative (that I don't know very well is b4:
https://b4.docs.kernel.org/en/latest/contributor/send.html)

Thanks!
--=20
Yoann Congal
Smile ECS


