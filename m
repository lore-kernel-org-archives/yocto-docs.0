Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668A2CC6B33
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 13:04:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39664.1792069474668064640
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 06:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MaSzlxc0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afbd2c386so3142852f8f.3
        for <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 06:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792069473; x=1792674273; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/lbO53gvSfcIJmChAGmcErgCV/AlUPsvGTo6k6F712o=;
        b=MaSzlxc0Fxlo0Be2W9dOUUM2v4xGkwesJaSZ1WnnX5FSxeZHgX1CCtyQStERAenvJ6
         LbV+nwJZZWFWQ/hOb8aB8ItfsjCQeReR6J6lT3o3nqH+40/UzsL/T0wUmGDwvLwtGW4D
         uxOt3bujVzpvbstEocfpEDW8JvWN0ktCZo8ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069473; x=1792674273;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lbO53gvSfcIJmChAGmcErgCV/AlUPsvGTo6k6F712o=;
        b=vfbAyLRteDdblV/eq+V0A+N23E1AFCA+RGrUS4GOEELnscZGxcxgM07eU4lsp6zOjH
         Q5Dbnudgpt7UwIJ0JZUVO1zQJKNeMa0n5/c9Dau2Jcp6vEOih11Lwx1yOhkAlsM0S74s
         i9kdk6nQPBuYGcCZYakvZnS7O6iAAhd09jYaXrREeBtYspFmK4T6bU1XdN4qTlXySbfM
         9WIZ21DhC8X8CKC3NGiBe+c2kblKmycRT6KpYj4OV1ZYGMGHwJbPjdMfaSP7vCCEilST
         ep6oAdj31vj7026eT+UyTktIwZQrhq/4FAMKPby2dKGhgd4hKDUw1dVVQWv/cf+KA+l+
         iqKQ==
X-Forwarded-Encrypted: i=1; AKwUvByphgBKyH/tvSW3UutSt98VlHniqBwVTDVDt1P50iFsqologBDlT1Yih1hjZCdiHlo5MNJb@lists.yoctoproject.org
X-Gm-Message-State: AFq9FYJHf31yX/e2hI9iIGlbu4UOZC4sB0ESRFRX6QkmJbgjnYmHMZYy
	V9+BllBh6i9RrrBzkEps6ytyBwM6k5NcjXySIPGplSdEdzzcMQRhGM3ntzkL62nuURg=
X-Gm-Gg: AYBFou3obY8teRegR4Aqg7RK7FTp1C6qhwekXbt1UKI4WdZrxU6OMdtfMxlRq5PWoJm
	51hCPrVSxLR1lCuCSCvH/rBsziRMlA0QX/nx4M0dE0ew5sSdqNwY+Smbb3h/TO5GD/nVq77S/dn
	Dw7mXBIY/cwhLt+W9/IgRzyzsfuNY6ZViQ3AfbqDhvhdQOtWVLkLZODDhgP999f26JXgMZwZgud
	xWgfh2bWuR4q8NvDg9CUphuJfFLWuuBaZ+hWcAkYzUQ+2PnWPgnvv7flOw5TXRtZB15fTQO3pWl
	XTnLe6uOtCNitEfszL6dTRgijBIG9MjyPymn18AG8+NpGeBfQNyEg5v27blrflgt6tuCw4iRKig
	EC6aGZDgd4gW9hmQQqi+aFszLeBEezLb3TnrVPKbrDw/yFOvW3RRWagSadaK7nYD7DDWn4f3pK6
	DXu9AjwNxAAHfeacH+d4jn1XLpN5OLGwfYZ0AWOZOZOwaPvdDHscuqwX6hQA5+YoIzlEbfRWgJE
	/NbFxaVInF87iqnuGU26JAh8WGYD3xKX3iUC3y0wxNVo+UgkqjMOk5M0Wuxm0Y=
X-Received: by 2002:a05:6000:1788:b0:48d:dc6f:219a with SMTP id ffacd0b85a97d-48ddc6f2463mr24177672f8f.27.1792069472599;
        Thu, 15 Oct 2026 06:04:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8627:1727:8a8a:57f5? ([2001:8b0:aba:5f3c:8627:1727:8a8a:57f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967a0dsm18439287f8f.3.2026.10.15.06.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:04:31 -0700 (PDT)
Message-ID: <7dbc1fbb0314b61bbc2913aa004f8ebfd968cc03.camel@linuxfoundation.org>
Subject: Re: [docs] [bitbake-devel] [PATCH 3/4] knotty: convert warnings to
 errors when -W is passed
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, 
	bitbake-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	docs@lists.yoctoproject.org, Ross Burton <ross.burton@arm.com>
Date: Thu, 15 Oct 2026 14:04:30 +0100
In-Reply-To: <DM5EQUZ5TIGZ.1KG28FB6KB03G@bootlin.com>
References: <20261013-warn-as-errors-v1-0-ab3658758ceb@bootlin.com>
	 <20261013-warn-as-errors-v1-3-ab3658758ceb@bootlin.com>
	 <5d6d74ea44bf61549823ccde83e4c4ed1e274dc4.camel@linuxfoundation.org>
	 <DM5C7YSFK5Y8.14E684HX5TS18@bootlin.com>
	 <6563fc5659f06a1a6b1eb72ec05b9109dfe9f64a.camel@linuxfoundation.org>
	 <DM5EQUZ5TIGZ.1KG28FB6KB03G@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 13:04:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10680

On Thu, 2026-10-15 at 14:23 +0200, Antonin Godard wrote:
> On Thu Oct 15, 2026 at 1:49 PM CEST, Richard Purdie wrote:
> > On Thu, 2026-10-15 at 12:25 +0200, Antonin Godard wrote:
> > > On Thu Oct 15, 2026 at 10:58 AM CEST, Richard Purdie via lists.yoctop=
roject.org wrote:
> > > > On Tue, 2026-10-13 at 14:13 +0200, Antonin Godard via lists.openemb=
edded.org wrote:
> > > > > When -W is passed, modify the handlers to show warnings in red an=
d set
> > > > > the return value to 1. Add a summary line informing the user that=
 the -W
> > > > > option was used as it might not be obvious when looking at the bo=
ttom
> > > > > the end of the console log.
> > > >=20
> > > > The trouble is this doesn't make warnings behave exactly as errors =
and
> > > > I think that is going to confuse people :/.
> > > >=20
> > > > Specifically, if an error is encountered in a task, it will error a=
nd
> > > > fail. The warning will show an error but continue anyway. I also
> > > > suspect the warnings will still show as warnings in the log files a=
nd
> > > > only appear as errors on the console.
> > >=20
> > > Good point. So there's two directions this could take (if we want tha=
t feature):
> > >=20
> > > - Make this option change the behavior of warnings, and make them _ac=
t_ (not
> > > =C2=A0 just look) like errors, so a given task would stop in case of =
warning.
> > >=20
> > > - Rename the option and make it clearer: warnings are still warnings =
but the
> > > =C2=A0 return code will be 1 if there are any.
> > >=20
> > > =C2=A0 Maybe "-W,--fail-on-warnings: Make bitbake return 1 if any war=
ning is
> > > =C2=A0 emitted"?
> > >=20
> > > I feel like the second option might be best as the first one is chang=
ing the
> > > behavior of tasks and I also think this might not be desirable.
> > >=20
> > > With the second option it allows having a positive exit code on warni=
ngs while
> > > still being able to have a look at all of them (not only the single o=
ne that
> > > stopped the build as would happen with the first option), just as you=
 would with
> > > a normal bitbake execution.
> >=20
> > I think we need to see if there are others wanting this feature or not.
> > I think with new option additions like this, we need to see a clear
> > demand from the userbase for it. That feedback may also make it clearer
> > which behaviour people would want.
>=20
> Ross (copied here) was talking about it on IRC[1]. Hard to say which way =
or the
> other was desired from this conversation though. It did give me the idea =
to
> contribute this feature as I also need it sometimes.
>=20
> I personally have seen multiple projects where builds started in CI envir=
onments
> needed to stop when warnings are emitted. I'm happy to keep my scripts as=
 they
> are but I thought this series would make things a bit easier for users.

Do you really want to "stop" on warnings though? Usually you want a
list of *all* the warnings, not just the first one. You probably do
want to continue through all the rest of the tasks too.



That makes it sound like you want to just change the exit code, which
is a bit of a different discussion...

Cheers,

Richard

