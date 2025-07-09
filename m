Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98C0C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 13:34:24 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.15957.1752068059074578605
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 06:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=doxIVFWc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453634d8609so38595195e9.3
        for <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 06:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752068057; x=1752672857; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDIn5AumqWElntZUcUKh+PC5xNXvky3vEwv++P41EOY=;
        b=doxIVFWcz+PVPtve8DIw7sSQebjR3lvqXToWnZLyAEZFQbM6yOjOv3AtGwod01EQL3
         vdi/jDcPumuhldxMZ5Lu91fJXyaryxc6MJdS33/ERqD+fpekdkJZxbeBzNzfngNJJBAn
         5ZEF884ObFAfszH1w5TwW68QjhEZPYEheK3sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752068057; x=1752672857;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BDIn5AumqWElntZUcUKh+PC5xNXvky3vEwv++P41EOY=;
        b=VfP9PC/63CvFYLGwg+IKCDTkAxkg7AE5MasKo2ywpKZ/JE/ytz3I8CcxF0EY+CKPJo
         emMCH0NgAp0CoHswi0yETz9ERhzc1PyfLFEWkmv0dP5aFNJ42XUi3Dt5fHT6mlKlb/N9
         VrP+wGwZ9C2b3wvws5Ux7mfzn15N6x7vWeE5zolJnyC7WjKfxT3q3/IpE4MuMQqU63wF
         /sFYC1mZcG+iTnecnuZBm80kjn75U+3I+ovKJLLO5nx9kp0k9gqyxlRW6x73kGvsQtHw
         vAdifrKc1iyKrThhPGpIprM88PgbeCzB2UgncddCxu+hydaHIvD2ku52UCff9tW29DAt
         LOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV+ydnRfnF82abUKpFmWPyEOGA5JUJuYcPfqK+Iky3aIcvYtn0T9Fh9DqsbrUC2t/zm1jg@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzqfQ+cpnwkdnkNwABoAYGx/dGbROc42tckgabuwcD4n0ikIgQV
	kKlAemt/OJhFL9BIN8bS6BhuyVfOiZAicqFjlyfssAGNHNV88JC68dcCXqUFro1nQEs=
X-Gm-Gg: ASbGncu+/5dBv61dGyhCL1FdXeIUeXmyOf/GlV0vngKvVShEdRXiG5kbTJz5aidVren
	5KKdcvjOV32W3Jvm5wb0T+XrZKELiXdM692tbqR9Qu4lQNBuzm43zsfT9OHYrb0pAKcj90vqpdM
	27t8qdwbykdB3x43IpLUkK2BpmlDKqzNtEyj8JyMeMl4hHys2GxlbgQ6M3oiVA65907OmvStfuq
	58LL3Lrc/PspjAHhoFNQ29D1OSiDNrswsiAJ/RDOINUsN37Cu5XmPehwPb82jiNpkgsotqlhq0V
	IIADEgmuyMK9tRuhBNeTQD7RQjNzz+oyBVGTKamfj0JngVjIfu7SFfcn7MKuEO5MvEBaz5mLoZF
	v5GDGvUJGJlUsnUYx27P8SF6ZsPxoxcT0a8pYQjxtF26lvHbwBCc=
X-Google-Smtp-Source: AGHT+IEa23CW3ZgrqjPLF2LdjksxkRu9uY/Rp3GXLInfHoGKJaJas2DtPM+8yFPKzoWROBw63EbNIQ==
X-Received: by 2002:a05:600c:358a:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-454dab9e5b2mr2352145e9.2.1752068056984;
        Wed, 09 Jul 2025 06:34:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d1ac:c847:b6ee:165f? ([2001:8b0:aba:5f3c:d1ac:c847:b6ee:165f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm15845261f8f.27.2025.07.09.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 06:34:16 -0700 (PDT)
Message-ID: <63ac037ab19af1c1fa58290261318bebcc2db6be.camel@linuxfoundation.org>
Subject: Re: [docs] more docs curiosity: "inherit_defer" in the BB manual
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 09 Jul 2025 14:34:15 +0100
In-Reply-To: <764e27fc-0e53-777a-3427-4989e8d79403@crashcourse.ca>
References: <764e27fc-0e53-777a-3427-4989e8d79403@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 13:34:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7296

On Wed, 2025-07-09 at 09:31 -0400, Robert P. J. Day via
lists.yoctoproject.org wrote:
>=20
> here:
>=20
> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-us=
er-manual-metadata.html#inherit-defer-directive
>=20
> that section strongly suggests that the sole reason to use
> "inherit_defer" is that you want to inherit some class, but you're
> not
> sure which class *yet*, so you use a variable that will, at some
> point, be set before parsing is complete. or possibly it will involve
> a programmatic condition.
>=20
> =C2=A0 so what is the purpose of using "inherit_defer" on a fixed bbclass
> name such as this?
>=20
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/qemu/qemu-native.inc#n3
>=20
> what is the rationale of inherit_defer'ing a fixed class name? or is
> there more to this that i'm missing?

native has to be last. That means it has to be deferred.

I think bitbake now happens to handle this magically after more recent
changes, just to complicate the story.

Cheers,

Richard

