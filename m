Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F57C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 10:25:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.9269.1702981513073682357
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Dec 2023 02:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fscRko6b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d2764c0f2so5732795e9.2
        for <docs@lists.yoctoproject.org>; Tue, 19 Dec 2023 02:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702981511; x=1703586311; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=46/LPV3yvF1zgpoVu2mlBKFt3dLTl25M3CLFVkAFCNU=;
        b=fscRko6bKiY9pd53BdMajVbsQNsTWijpfcfwr3lR+pDLQahrggL3RYcegIvFvEIelc
         eqQeL4JfI2+/oqqwkqQgjH51MZnNNjqVm2dCuWVXxYlGb4/4xdrQE7/9FI36VTGh2Ku4
         rUH/mpa43abIxx/klsyp9MnDVDD6XoYWMZEJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702981511; x=1703586311;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46/LPV3yvF1zgpoVu2mlBKFt3dLTl25M3CLFVkAFCNU=;
        b=kKGEqzlOZidU5XveOUomkcaFxUt2OKYNCn0sdEmFy3BFU7YItYXX67Wkvp0yXR2ZtB
         XR9u1CYPh6GKPretwsC81S1Ks0vTQuw29h5xtiLr1oyeLMoh8PEfcZjuJGW69+tTded0
         +T/4EwO+n/qBy5OPkAKa7gb7bQx6OWU+jVuda5hiqKFPf9LDD8NKdzjLF85CSRWpKaxm
         IUCe1TOwl0EXQHg5ohzEnZexmtSBpFXzLN6NOWayxHv86B1W6ybNAsPeEVoEAw/uPE3j
         ZZazrEcpHWdugBD0PT9M73u/p1HQh4+0raXdLFT+OxFc87jg/jOlS0IJYNp1bpciN+Jt
         XqMA==
X-Gm-Message-State: AOJu0Yxf1C9vyML/QZmbv5fI0EUeNSwWW5aa5RYqXBnomGsOGgzW12KO
	7S9iWSYixCZY1rpNNf1go0F8JA==
X-Google-Smtp-Source: AGHT+IE39I0Jv41FnajZmIU8DKAlxvvYrRNoN3c8kFDbbEfNjSRvTyU0COGA9JhO2BtBYTdgBfcIEQ==
X-Received: by 2002:a05:600c:4fd6:b0:40b:5e1f:6fe5 with SMTP id o22-20020a05600c4fd600b0040b5e1f6fe5mr8689598wmq.58.1702981511317;
        Tue, 19 Dec 2023 02:25:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b87d:537f:7c6:e419? ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id hg12-20020a05600c538c00b0040c41846923sm2099223wmb.26.2023.12.19.02.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 02:25:10 -0800 (PST)
Message-ID: <ed80038150aff772343b79d24185a600412d1d2a.camel@linuxfoundation.org>
Subject: Re: [docs] [yocto-security] Documenting security advisories
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, Mark Hatle
 <mark.hatle@kernel.crashing.org>,  Marta Rybczynska <rybczynska@gmail.com>
Cc: yocto-security@lists.yoctoproject.org, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Tue, 19 Dec 2023 10:25:10 +0000
In-Reply-To: <360a6c05-ec1e-4cef-b2d3-de18bd52aadb@bootlin.com>
References: 
	<CAApg2=RSBvoPrS4F5ZOxtwEN97188huhA0LSQ_WXT3vocarb5g@mail.gmail.com>
	 <a4b99195-4cf4-4392-b8be-43357fb22002@kernel.crashing.org>
	 <360a6c05-ec1e-4cef-b2d3-de18bd52aadb@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Dec 2023 10:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4727

On Tue, 2023-12-19 at 11:00 +0100, Michael Opdenacker via
lists.yoctoproject.org wrote:
> Hi Marta
>=20
> On 18.12.23 at 20:27, Mark Hatle wrote:
> > On 12/18/23 9:37 AM, Marta Rybczynska wrote:
> > > Hello,
> > > When discussing security processes, there is one thing that we haven'=
t
> > > set up for now. This is, where are we going to put any possible
> > > security advisories affecting the Yocto Project. The need to release
> > > such an advisory could happen one day.
>=20
> Good idea to anticipate this!
>=20
> > >=20
> > > A security advisory describes in more detail a single issue or a
> > > series of issues. Gives the context, workarounds, information about
> > > the version where the issue is fixed. An issue from an advisory is
> > > likely affecting multiple versions of YP, and might have different
> > > fixes for each version. The advisory will be referenced in the CVE
> > > issue, security aggregators etc.
> > >=20
> > > Where can we put such advisories:
> > > * mailing list of the affected layer/module
> > > * general documentation in "Release Manuals", using a separate sectio=
n
> > > for advisories with links from each of the affected versions? OR a
> > > separate manual section?
> >=20
> > My suggestion is send it to both yocto-security and have a=20
> > yoctoproject.org/security page that just lists each advisor.
>=20
> What about the yocto-announce mailing list too?

We have a specific place for mailing list security issues which is the
yocto-security list. I don't think this makes sense for announce.

> Hey, what about a notification from the tool itself too, something that=
=20
> would catch users' attention if their version is impacted? Like the=20
> build system running a CVE check on its own version?

That has a lot of "phone home" potential privacy issues unfortunately.

>=20
> Well, there would be room for advisories in the docs, typically under=20
> the "migration-guides" folder for release notes and migration guides.
>=20
> The pros of using the docs are that they are reviewed by the community,=
=20
> and they may be easier to find next to release manuals.
>=20
> The cons I see are that docs take more time to update because of the=20
> review process, compared to a page on the website if members of the=20
> security team already have access.=C2=A0 Unless Richard, Michael H. or th=
e=20
> documentation maintainer rushes them in. I guess you don't have much=20
> time when you submit a CVE issue.
>=20
> I guess this also depends on how and how many times each advisory is=20
> modified, and whether this should be a collaborative process or not.

I suspect the time for docs patches should be ok in general and if we
really needed to we could turn something around quickly. I'd not expect
many updates but improvements should be fine using the usual processes.

Cheers,

Richard

