Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3942C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 08:27:14 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.44449.1748852831740321339
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 01:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E9ld0KxO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450d37d4699so17383865e9.0
        for <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748852830; x=1749457630; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOkYQijyOQZDW5nxoIEIsh57WT4mrQQ3mytAMmO8EkI=;
        b=E9ld0KxOcp01RCw088x5yPaF6Vg+fKvQ3nYl1W0cZGtgAGTV0h9BuwEyub3sA0C/wI
         cefC9vwuBgtfOmqsmLwVoKZ6xhsasL+N9rHgZ6A4xargp2QnUD7N9zKwLKUXo0cTAFIk
         E/4C8PDZ7tEXjCTTLkdelGa7aTPI46q3D2EH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748852830; x=1749457630;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vOkYQijyOQZDW5nxoIEIsh57WT4mrQQ3mytAMmO8EkI=;
        b=V31NCUp7Fhf9tqWdEasarDose/JE562H/Oc+Hqv0lFonnNy2S85Pp4ceWzAQI4i+Ga
         3GqQq2kkaL+7DnlnYSEUou31s9zAkC7obGTXCyysWJVTk38yDzdzzY3SAzGwkBZ3uLAm
         yp4fsFpIfEzIgx+3/MHQdnKn6KH5y4Tvk3PMXeIGDUBqYZ1/MUkrapoim3dhSyQntCPh
         zuu1U8qL6QIFGE8Z01Swj4jknqAmynwGUEYR8fvya9kCj0HxQrO5LN45e5DR8os8SDGM
         oTyzPfbXYOFZJyOtMAyrN8mbkrp6FucNU68hom7gt/ORBdtwBCl+PGqLvjvzX8E/fops
         OMwA==
X-Forwarded-Encrypted: i=1; AJvYcCUopfkO8jVBgVzBPXgTKMNGwhapaOzlO8eEz5R9ta7dj9YzYRl5hj4ZY79X3M8suBotMN4u@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxS2nA2x3BkJuUZkV8o/oyT3d3YHsRAcWuvnjj0xBPwttSzcoqr
	q3HvXSh1mBlu6M2IZe8JcLft25Mstu5QHRHj6umbjhiBXKLM/oLylcNP6j4VTr0zKzQXnJ4pW2h
	YpH8fRAU=
X-Gm-Gg: ASbGnctzr+dkdkjcXxObmBDqBRjId5qEXKJuTjvEOXTStJdakcJPsqyHyoJ8/TiOX9d
	uk5TWbg2Yo+iwoqMACo38+MtJoMUcgBRp52rmXhWkvl3KP1ZsMe4v/7Xp2PsS2jW8F6bpcI2iy3
	uZTC5y6FlCnd6gw6X4PojNpJLIsXGhJFTZ/P/FbvqwC3RCgWykQ/Rtr8ZybuZlx7BaDb8AXYz2c
	azN+fVSpScuj7OTmBp5VD7Gget6k0D7KN7K+0bwboPeAPPFBOjq6GK4ertCB1vGpYNbvkBjrN+C
	b1Ms462mClwX5gEDlz0+PUNOYTFA/QFyyuCuJZR2UXVz2ZRfuITyQsPuGqms+b4bibtYa0WtBf5
	WAwxxxFiTVEgKp1GfC9a0Y0v9losVD01+ddwAqG6ct/YTPMsJqW4=
X-Google-Smtp-Source: AGHT+IHzNK2h/7UQZrEbVcFGJvOHhU8Tp3W/cOnXwpEQvJbhBg89prW9/LXd6cPmpPopQAnHPpbPYw==
X-Received: by 2002:a05:600c:3b8e:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-450d65441cbmr94224255e9.25.1748852829864;
        Mon, 02 Jun 2025 01:27:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:907c:f576:5b06:73b7? ([2001:8b0:aba:5f3c:907c:f576:5b06:73b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000f3esm113684305e9.23.2025.06.02.01.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 01:27:08 -0700 (PDT)
Message-ID: <0f71b6fcdff6c9a7d4d56ba525ac116e552bb753.camel@linuxfoundation.org>
Subject: Re: [docs] I think BB_NUMBER_THREADS explanation in bitbake manual
 is "backwards"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 02 Jun 2025 09:27:08 +0100
In-Reply-To: <c7121488-35ba-93c9-7734-d7e80165eba4@crashcourse.ca>
References: <c7121488-35ba-93c9-7734-d7e80165eba4@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 08:27:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6956

On Mon, 2025-06-02 at 03:57 -0400, Robert P. J. Day via
lists.yoctoproject.org wrote:
>=20
> If you read the early note about BB_NUMBER_THREADS here:
>=20
> https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-use=
r-manual-execution.html
>=20
> it advises the reader how to *maximize" execution parallelization by
> cranking up that variable to match the number of processors. Except
> that in the OE and poky layers, that's *already* maximized with the
> use of (from bitbake.conf):
>=20
> =C2=A0 # Default to setting automatically based on cpu count
> =C2=A0 BB_NUMBER_THREADS ?=3D "${@oe.utils.cpu_count()}"
>=20
> So that note is advising the reader to do what is already the
> default.
> What is missing is the rationale for *decreasing* the value of
> BB_NUMBER_THREADS, to dial back the load on the build system, which
> is
> pretty much the only reason I ever use it.
>=20
> In short, I think that note would be more useful if it simply
> explained the purpose of BB_NUMBER_THREADS, that it is already
> maximized by default, and suggest why you might want to *decrease*
> it.
>=20
> Thoughts?

This bitbake manual has no insight into what default value OE gives it.

Cheers,

Richard

