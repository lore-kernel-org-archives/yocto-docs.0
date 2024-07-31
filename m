Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B451C3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 12:10:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.41203.1722427850151015755
 for <docs@lists.yoctoproject.org>;
 Wed, 31 Jul 2024 05:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XXDeQdce;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4281abc65daso29631705e9.2
        for <docs@lists.yoctoproject.org>; Wed, 31 Jul 2024 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722427848; x=1723032648; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEgITounLw7kGxid25BMdkpn9thEs9UYV2NelTTfSuE=;
        b=XXDeQdce+fDqLrhg2wK7KCdy04kTwjvat8447z+ILddrA08s/RGsCyHSeIlUoQqiNS
         d2/8yi17mvWP0vSENo1ch3XoYc1iN0o78jubJSE178rBdzHhnFWKUN3I8khtZprgEAhx
         ZJthZlp1KCKYpaJHc/02h7LJeCfO9tGRGCvQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722427848; x=1723032648;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FEgITounLw7kGxid25BMdkpn9thEs9UYV2NelTTfSuE=;
        b=uzQG6AAmhHTK1BE7Q80wqvpFAoH3lJ7t95gSwb6eevI1Yw7+pDRIXQJrEPlYxh78h5
         ieiEgiiLJ7lzSUy4/ewIVeC9Yi3zpSzX10WSE0UVfKZfrPHk04oM8iH2FfMB8bJnFNHJ
         Y6NHAQQZMxpZQ4IbCMusZbGY1a65khkhyX6sJsMgwZ6xkJOo/QUJuOQr0W9ZWkpsWYVV
         Uab/kNJ4TJSuTfGYCa4MLSswdN+T/YFhyOEx26961cQuihqiJiCkcecqyS4LQNkO0Jgr
         HmPZiP9yhu4fNhaKcddNCeAG/GS+FTwDH6Xa2tSYgBwiCn2mFk+m5fR3oxDCdrQApSGV
         MZDA==
X-Forwarded-Encrypted: i=1; AJvYcCWhVh+8aB503vqBhqfSM9Oa4O6kFQgoTjOmUl0UwwpNGx6QNVxtveQ7Fs/cjEOMMaQ1lm9ezrcbVx+DPH+0INvGSyD1Tbux17DuUD0=
X-Gm-Message-State: AOJu0YyDJbvi6r1T7RKFXLaCvnKTnm0KJl2e9IHF/vq3WjikMaULvonK
	+H8+waCyxcThhuGHNYG+npzww3glygJ0QcOZVdhPjm6vg4/4PajDCdztGdCP54VhgX1OqVv/2/i
	ozy0=
X-Google-Smtp-Source: AGHT+IFIPkcRrvSSuWFobsCRKmQfaMs9FOwG63zI511xTCqzPXpgoV7UbU6zrOy/gihrk3l1IVEA1Q==
X-Received: by 2002:a5d:6daa:0:b0:368:255d:e874 with SMTP id ffacd0b85a97d-36b5d08ea7amr12650731f8f.46.1722427848359;
        Wed, 31 Jul 2024 05:10:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2932:9b7a:93b7:1fac? ([2001:8b0:aba:5f3c:2932:9b7a:93b7:1fac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b368706c2sm16868583f8f.117.2024.07.31.05.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 05:10:48 -0700 (PDT)
Message-ID: <70e5a96498fbb040979ce58fe4c999a53392edec.camel@linuxfoundation.org>
Subject: Re: [docs] no mention of SSTATE_SKIP_CREATION in variable glossary
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 31 Jul 2024 13:10:47 +0100
In-Reply-To: <8cc9eab4-8419-188b-1f2c-89ec78af5550@crashcourse.ca>
References: <8cc9eab4-8419-188b-1f2c-89ec78af5550@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 31 Jul 2024 12:10:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5332

On Wed, 2024-07-31 at 06:09 -0400, Robert P. J. Day via
lists.yoctoproject.org wrote:
>=20
> =C2=A0 i see no mention of the variable SSTATE_SKIP_CREATION in:
>=20
> https://docs.yoctoproject.org/ref-manual/variables.html#term-S
>=20
> should it be there?

It is considered more of an internal variable and not recommended so
I'd prefer not.

Cheers,

Richard

