Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7AEC61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:40:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7133.1788266399943930701
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 05:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OCe+N0He;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso37074725e9.0
        for <docs@lists.yoctoproject.org>; Tue, 01 Sep 2026 05:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788266398; x=1788871198; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EtOkaA7PYMqM+PBa9HPb3ypuT5o7HhdoTYVvV8RNXfI=;
        b=OCe+N0HedyV+bxmQiXiJUccw+yktwUdYjeSH0idHseJpTcMqjX8IIz2L+SbRoR5tJ8
         yv5zE/s8Got5zxz3mGPNeLW3lfkx1Iqw1dT/MoJ8I05K7p9/DgRnVeTs6OhzPvx0HlAE
         NepAvTv4u8Wfe4/EXhFgH3peOqJfWqyrQ0QHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266398; x=1788871198;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtOkaA7PYMqM+PBa9HPb3ypuT5o7HhdoTYVvV8RNXfI=;
        b=P8qnWmFfgcLK65YP9wfse7qQvDYbUj/O2odO10BbUKMS3Qjd5GEZW8vN26YJR+CAtk
         OXTXRSMuSo1UTZH9hAmbyo73sABFjDut0gG2H32hmoR9uu81+icNe4Ay4GcXlZ8ghKuX
         Srr+JMLH5ZyO1r3VwRf7jqjXIui6fGZgPvrN9hgUXJcqwlt51WYfqm4tzDNsQbBiy4xS
         442znivlx9UFD7OYjvAf2hfvpB6T20m66b0NckSVItYlEteGj01GcgaYFc3i+8bdIb+M
         GddiwPJ80mF+pd/ZuoslHsPZn4/T2jq3XulCV0dthyG0M0TcyciokqBEZn3nOqw/foIN
         a5lA==
X-Gm-Message-State: AFuF++mDeOutzMrLxg74rMR4UvUaUxuG4KLuSWlqLy7nlseCo76VBVfk
	cECidG9Qd6WhQb4PK34zw98ZK0ZgsNhMlqCP8tqpJgn31AUcZk4AgdpYhIdGxO4NPZY=
X-Gm-Gg: AR+sD11ksvy4imJVTD6crsGlYw/8dQsVHdvXaeQMuzhUH1cjvvp4rCZT2/2fk+/BA29
	7cM5oQTV0ss3Mz2/QGgrW2MM4x2tnH5sgHvKM81Que9DgnhDEpdAdcE8j3qNzUjwdMe77vAsD1H
	Y85+qo9JTwcljt+Bv+q7CFq/x5zXd9KgKDkWMpXycsoxyLqdjYQdrvD2UYhEsHfDsIBE+cB1KGN
	gB17fLORoYnU/2puuW+Aggk+/rwUoz9O8cSj/ZGqPxT8mUd7peGLQiEmjRBOoHheSNY7iLslrRn
	C1ASX37JPf41gdxXry6a4a4jBVBBAMRwd/hpdt8fshF1typHfzI9PW/mpzHeYto1z8PKZr/QT+v
	7TjR9tPaEgA3ItW9z6fkXg1rt8BV3M8vG6uCYodvVdGStEhc7rKxuvA8jglI6QfjZPCx06KQdlF
	3y7aKUkCrspP9cltKkMkW+vQ6qOC4vZsILJ2x7uZvI+POovpCUD4Z9QysdV1rLDnhx/Rt/i3/ez
	zA363yaJsO41YpXXWEEv8TvpUbh4sfxviILMNvPQNLpKul4KWz5QOZ0eia0S02J
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr466672535e9.12.1788266398113;
        Tue, 01 Sep 2026 05:39:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9e4b:8577:fa6f:4727? ([2001:8b0:aba:5f3c:9e4b:8577:fa6f:4727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce08b8esm59370305e9.3.2026.09.01.05.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:39:57 -0700 (PDT)
Message-ID: <46683f729dac1a9cba4fde5b597254f20fff9b40.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: add ccache
 in distros
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, Jose Quaresma
 <jose.quaresma@oss.qualcomm.com>
Cc: docs@lists.yoctoproject.org
Date: Tue, 01 Sep 2026 13:39:56 +0100
In-Reply-To: <178826523033.129557.2771369482806275703.b4-reply@b4>
References: <20260831095856.2298-1-jose.quaresma@oss.qualcomm.com>
	 <DL322H0N4CF5.IO2KG3IOZPKD@bootlin.com>
	 <CADWMC-bO57E5JZPfNXCp0rjOH-hGyWGyF8_bnBrvf8NrHRaDjg@mail.gmail.com>
	 <DL34MCC6G8T0.12NMB0V503NE4@bootlin.com>
	 <CADWMC-bz-ukZqh1ZCj-0xL3Fi7S_ynaRRXiemFZdVZhNur9pkw@mail.gmail.com>
	 <178826523033.129557.2771369482806275703.b4-reply@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Sep 2026 12:40:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10430

On Tue, 2026-09-01 at 14:20 +0200, Antonin Godard via lists.yoctoproject.or=
g wrote:
> On 2026-08-31 14:06:28+01:00, Jose Quaresma wrote:
> > > in
> > >=20
> > > I think this should then be stated in the ccache class documentation,=
 in
> > > documentation/ref-manual/classes.rst. The host requirements should be=
 kept
> > > minimal, IMO.
> >=20
> > The documentation [1] already mention the requirements for "-native"
> > targets:
> >=20
> > ASSUME_PROVIDED +=3D "ccache-native"
> > HOSTTOOLS +=3D "ccache"
> >=20
> > [1] https://docs.yoctoproject.org/ref-manual/classes.html#ccache
> >=20
> > This requirement was added last year
> > https://github.com/openembedded/openembedded-core/commit/cc91a0f6500e88=
dd96a56307226fcfd16c60c342
>=20
> Still, I don't think it really is a requirement, and I think the way forw=
ard is
> to actually remove this from ubuntu_essential.sh, fedora_essential.sh,
> opensuse_essential_15.6.sh, and opensuse_essential_16.0.sh so that all di=
stros
> are aligned.
>=20
> If you agree, can you send a follow-up patch?

I agree with this FWIW!

Cheers,

Richard

