Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1F9CC6B3C
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 11:50:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37747.1792065003345604235
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 04:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h9LCGSxV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ff680331aso21971675e9.3
        for <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 04:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792065001; x=1792669801; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y4RE4qn2Tf4xNwGevvOdi1sIXSfmEvtIegvCTHmueDs=;
        b=h9LCGSxV8lh5x6GibiYJo8L+z/rkYkbZjuX23kqfn6tCihNTTlAmwH2QzNcUIQdIeE
         PfpuIpQH7hQnHYtw1G8meAwD8cn4iOuXb9MxFtBtJ+0BMskRXgIAq3b0X6sh/KbjtsRm
         17yQGCADP59eI6uicAST2xhbExYMftm5mydfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065001; x=1792669801;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4RE4qn2Tf4xNwGevvOdi1sIXSfmEvtIegvCTHmueDs=;
        b=zcuBK7YYeL/o5Wr42MwH8t1QGvTw8d1nJUDbwgBJhktbcMf/cVctQ4lHNHO2pDUhe/
         WLxxyM15oJdGVLi1wFkRMmA2HiUszu4HMwVV8b6BYJy+U5skQBJP0vVviMKlJot9cSyz
         37FyCfus6HslgWgX1n/xzK6mcX8/TrRGYpf0/6qVCbhZUzeiFn55kIJejgLtG5QiOnZb
         Y2A/b49n7zcIm0GBAOfIOhqdJkNWGWrGSZURpimP96J/azgqjjIyWG+Zk0XtAmVLPhcE
         C+/+qTh8V+eqRGksnjlas+Z98TWaHKAeM4FF1jcfs4SFNiyyrYK8WqO3DjaBSzcibU1Y
         K7xg==
X-Forwarded-Encrypted: i=1; AKwUvBwdBQa8VRiPga0kGrvf3yVxIdJZB7ifbf51OVGK/Yp8mejnRapY+90FQGI4QlVsRsD0SNWM@lists.yoctoproject.org
X-Gm-Message-State: AFq9FYLr80Ex7bbpRgcXhVskaELP8RZewDpbpCpE+Bg1vo/mLid4Bzdl
	WRsJiN3fNfCC9cCg95zhSatsvTTJQmsOi/tKBpsyvBxliV5WAqMbfdtx97YJmKoskcY=
X-Gm-Gg: AYBFou2ECkenGhVEgygeyOYdisF91+i8TQATSSregcSihRHj29nM/bdfXWgKIh9yjNp
	p3xuHVJF2jYzNdXak/7359wvLSB4RuuMKyJbSi1YAFl3/+4xrTPBuOKVtDetjNKvTjw5dVP2t57
	EnOP/2tBR5oUsnuLts69s+ItiKyqES9ISe5TaZJujcBapMSNxJaXD+SNxsZgC0WPM4x/FXqfsT0
	3b08e7yka7h0tnH1QFxWg/erMf7IsoGogAnNzILx1BjBCklVdizFJoJiO7pJuPl07cAmiZQa+hf
	JhP/HghL0qkZWL6CYAl0lZiIGU/8yeAybINV1MVCobKnWScJaaFxWWZqvr9Ig+jcVX4z6DgZQYg
	J1q0wiNaVcp8Hn5WpA+l+65Pf0fNdrZsa3o3V5Bg+w0QcESitnl6feK3qqw7MejDg69BXdMmK+A
	YDiBo49Xn46mBD4b9yuQBRIdJNEqrz1Df1OLi8vge/bzHqjlqferfErjq93F9s2JixGYSAjlmth
	pFZ2x0O2FXZBSAMZU9/7zRrJi9OOuCNmqbdnlY/zv37z+CFbQ==
X-Received: by 2002:a05:600c:3b8b:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a18e4a7cfcmr469108035e9.26.1792065001323;
        Thu, 15 Oct 2026 04:50:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8627:1727:8a8a:57f5? ([2001:8b0:aba:5f3c:8627:1727:8a8a:57f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7268680sm11005302f8f.25.2026.10.15.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:50:00 -0700 (PDT)
Message-ID: <6563fc5659f06a1a6b1eb72ec05b9109dfe9f64a.camel@linuxfoundation.org>
Subject: Re: [docs] [bitbake-devel] [PATCH 3/4] knotty: convert warnings to
 errors when -W is passed
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, 
	bitbake-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Thu, 15 Oct 2026 12:49:59 +0100
In-Reply-To: <DM5C7YSFK5Y8.14E684HX5TS18@bootlin.com>
References: <20261013-warn-as-errors-v1-0-ab3658758ceb@bootlin.com>
	 <20261013-warn-as-errors-v1-3-ab3658758ceb@bootlin.com>
	 <5d6d74ea44bf61549823ccde83e4c4ed1e274dc4.camel@linuxfoundation.org>
	 <DM5C7YSFK5Y8.14E684HX5TS18@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 11:50:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10678

On Thu, 2026-10-15 at 12:25 +0200, Antonin Godard wrote:
> On Thu Oct 15, 2026 at 10:58 AM CEST, Richard Purdie via lists.yoctoproje=
ct.org wrote:
> > On Tue, 2026-10-13 at 14:13 +0200, Antonin Godard via lists.openembedde=
d.org wrote:
> > > When -W is passed, modify the handlers to show warnings in red and se=
t
> > > the return value to 1. Add a summary line informing the user that the=
 -W
> > > option was used as it might not be obvious when looking at the bottom
> > > the end of the console log.
> >=20
> > The trouble is this doesn't make warnings behave exactly as errors and
> > I think that is going to confuse people :/.
> >=20
> > Specifically, if an error is encountered in a task, it will error and
> > fail. The warning will show an error but continue anyway. I also
> > suspect the warnings will still show as warnings in the log files and
> > only appear as errors on the console.
>=20
> Good point. So there's two directions this could take (if we want that fe=
ature):
>=20
> - Make this option change the behavior of warnings, and make them _act_ (=
not
> =C2=A0 just look) like errors, so a given task would stop in case of warn=
ing.
>=20
> - Rename the option and make it clearer: warnings are still warnings but =
the
> =C2=A0 return code will be 1 if there are any.
>=20
> =C2=A0 Maybe "-W,--fail-on-warnings: Make bitbake return 1 if any warning=
 is
> =C2=A0 emitted"?
>=20
> I feel like the second option might be best as the first one is changing =
the
> behavior of tasks and I also think this might not be desirable.
>=20
> With the second option it allows having a positive exit code on warnings =
while
> still being able to have a look at all of them (not only the single one t=
hat
> stopped the build as would happen with the first option), just as you wou=
ld with
> a normal bitbake execution.

I think we need to see if there are others wanting this feature or not.
I think with new option additions like this, we need to see a clear
demand from the userbase for it. That feedback may also make it clearer
which behaviour people would want.

Cheers,

Richard

