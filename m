Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C883CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 17:36:08 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.288079.1697650559679690815
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 10:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cTolht/s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32d81864e3fso5528880f8f.2
        for <docs@lists.yoctoproject.org>; Wed, 18 Oct 2023 10:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697650558; x=1698255358; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m7m/QLGshXxkM34Ba7bgzuv3ah8KsVeIn6cfq4fZhPo=;
        b=cTolht/sL8lOwhNmHdrj+57i+JMYYOpqcybV+EPSmifV8RiPhgXPGxEeP5INkQhwj8
         zGkAMLhIZ93gl//2iBxGoO3yFkmd/YVqGxf7WnBQ5ydHueaVHuMoy4b6RkP3dx6M5a6V
         oEnoRNCGzjc+gaKOm50D8r9pSHPJjl2w5hvqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650558; x=1698255358;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7m/QLGshXxkM34Ba7bgzuv3ah8KsVeIn6cfq4fZhPo=;
        b=HOuEbdqwv1yPxAIFgIA9/jLw1PvSAo8AC+YwBl89+XcLtaQVASGuNs4QXald0Nrtmp
         EYOKIBDbyu3Kj59c2NXew1jq/I4YrYiL1v/8s3S+ARo4epyzjXP9A0xGocXlCsRX2HQU
         HmmnL6QVY2Q7LchPJ3YabVKr4vbuy8KXLuSFausqZHxvwNyzYJqFRyf2Va0hAcezxN6i
         p52JA7mMGAEHSPbtTYajXLGIpTbquTrOnJYmzdrsgDxGlZxZql3voKrFzrWOKOl71tzR
         fce7016X9g3yEtjb7XeNzw9oPgQUYy5Hk9/PA5pWYDq0BWJyl3xx2JubhbHYl3J1LQv6
         h2PA==
X-Gm-Message-State: AOJu0YwGV8m3L/HmFE2k+khhX4MF1IKX2XziTFOi4AeCRet6VAAqzAxB
	ZThHPadFrYB3LD9fjRfdJRBkBg==
X-Google-Smtp-Source: AGHT+IHRJvfDAyw/+l1Gqw4mkZRuJskDk8T/eqsjQDksO1eYk/+j5HwnPIwuZv8JvGlXgPgzgR8tVg==
X-Received: by 2002:adf:e3ce:0:b0:31f:db1b:7296 with SMTP id k14-20020adfe3ce000000b0031fdb1b7296mr4180368wrm.21.1697650558127;
        Wed, 18 Oct 2023 10:35:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb? ([2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb])
        by smtp.gmail.com with ESMTPSA id q15-20020a5d574f000000b0031980783d78sm2573894wrw.54.2023.10.18.10.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 10:35:57 -0700 (PDT)
Message-ID: <f296756f07267e29d23732acf41e7c799d7f4d22.camel@linuxfoundation.org>
Subject: Re: [docs] Documenting YP processes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Marta Rybczynska
	 <rybczynska@gmail.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
	yocto-security@lists.yoctoproject.org
Date: Wed, 18 Oct 2023 18:35:57 +0100
In-Reply-To: <ef4d2c98-e7f2-4c3d-8a59-dd5d1e181dea@bootlin.com>
References: 
	<CAApg2=TOJg06EP3JJmaoC-mxzPM3=4WkW0y3ADuuXRVsccoefw@mail.gmail.com>
	 <ef4d2c98-e7f2-4c3d-8a59-dd5d1e181dea@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Oct 2023 17:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4410

On Wed, 2023-10-18 at 16:57 +0200, Michael Opdenacker wrote:
> Hi Marta
>=20
> On 18.10.23 at 16:23, Marta Rybczynska wrote:
> > Hello,
> > I'm writing the "official" documentation for the YP security processes
> > and I'm realizing that I do not know which document to put it into.
> > There is no "YP Processes" manual. What about adding a "Security
> > manual"? It can then include:
> > - security processes
> > - a single place describing how to submit CVE fixes
> > - links to other manuals for relevant material and/or rewrites if neces=
sary
>=20
> IMHO, it does makes sense to create a new "Security Manual". We=20
> currently have=20
> https://docs.yoctoproject.org/dev-manual/vulnerabilities.html with some=
=20
> useful details contributed over time, but a separate manual would=20
> probably get more of the attention this topic deserves.

I'm torn between a security section in the Development Manual or a
separate one. I don't think we want too many manuals so I have a slight
leaning to a section but am open to persuasion.

Cheers,

Richard

