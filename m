Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B43C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 09:51:38 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.9545.1670579495328731571
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 01:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CtLmB+Bl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id ay40so3166411wmb.2
        for <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 01:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5kU6pd5ZfiqKBoL4zuDD53CRaTogbVOHcl7t0jHnlU=;
        b=CtLmB+Bll137M1Q6SD1DHiVLlMLStS74E8NCQd9aPjXwtfrPCqtT0BTGfYbQmZ6zSG
         jY3nbNlfDJu+esxJztwP9TOiWy+6lx2UDc6UR66J410cPLCVuJaKDbM3TNTrAuFPTJFA
         Q7ZUiMezPAhUQOXgldfX/LD3AMGQfOvtZAGeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n5kU6pd5ZfiqKBoL4zuDD53CRaTogbVOHcl7t0jHnlU=;
        b=l9WWuPxJDlBxKrjYCUacCDFVL7T1lz0uC9cQd6C6o1GMugo2PojQ4kUfiUhPWRb865
         B/iIUttOzYgzeU10VBc9bqt69E5RNzhI+i/Mt9ZNnU0iBo5jmrh1p0msLRWtZ0gNsTJc
         pg8SeyRlDn7GZjeT4biuRHPv7jmnStT3sBBtkua8zNEYuHcBRTXO+FM90mm/HggevBht
         QKTjvL8jI6Lsj+uEtycSW4+k3entCC62CQtHaP1SxKqU/H7MEson0YWr/1mj+iAjYqVU
         NgooDFqriJG+M+ZsHZ3dRy5gxcrCSeAcHXS92BbbAegqbALfjewLGQSzIEixDsD+fBZx
         lkNw==
X-Gm-Message-State: ANoB5pkxUvSX4be1m9kapi7VQG2B3j1ShM9UX7LSlJXLgRvQVa+n1vV5
	idYszMrpAtQ/xYSq2ZS6QBId/w==
X-Google-Smtp-Source: AA0mqf5kPzb/OxT+zFWnlXDcdNTm5CjrYgbFKyj2HBLF9w2LEx+TExOpibTQFQXxi3x/zfZJrf69eg==
X-Received: by 2002:a05:600c:3483:b0:3c6:e63e:23d6 with SMTP id a3-20020a05600c348300b003c6e63e23d6mr4485898wmq.5.1670579493614;
        Fri, 09 Dec 2022 01:51:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b77:8930:5aaa:e9c4? ([2001:8b0:aba:5f3c:9b77:8930:5aaa:e9c4])
        by smtp.gmail.com with ESMTPSA id x4-20020a05600c2d0400b003d1e763ba46sm1262392wmf.10.2022.12.09.01.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 01:51:33 -0800 (PST)
Message-ID: <6c1159837c55133a2b1bd7ef56a78776cc1b9406.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] manuals: add missing references to variables
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@theobroma-systems.com, michael.opdenacker@bootlin.com, 
	docs@lists.yoctoproject.org
Date: Fri, 09 Dec 2022 09:51:32 +0000
In-Reply-To: <9a3732e1-5b70-b6ad-a071-2b14e6b9c46c@theobroma-systems.com>
References: <20221207203928.511207-1-michael.opdenacker@bootlin.com>
	 <9a3732e1-5b70-b6ad-a071-2b14e6b9c46c@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 09:51:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3530

On Fri, 2022-12-09 at 10:48 +0100, Quentin Schulz via
lists.yoctoproject.org wrote:
> Hi Michael,
>=20
> On 12/7/22 21:39, Michael Opdenacker via lists.yoctoproject.org wrote:
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >=20
> > [YOCTO #14508]
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >=20
> > ---
> >=20
> > Missing references detected by:
> > - Listing all variables in the YP manual:
> >    grep "^   :term:" documentation/ref-manual/variables.rst | sed -n -e=
 's/^\(.*\)\(:term:`\)\(.*\)\(`\)/\3/p' > /tmp/yocto-vars.txt
> > - Then grepping each variable in the manuals, either in the middle of a=
 line, or at the
> >    beginning or at the end:
> >    cat /tmp/yocto-vars.txt | while read var; do echo $var; git grep " $=
var " *.rst | grep -v " =3D ";  done > /tmp/unreferrenced-vars1.txt
> >    cat /tmp/yocto-vars.txt | while read var; do echo $var; git grep " $=
var$" *.rst | grep -v " =3D ";  done > /tmp/unreferrenced-vars2.txt
> >    cat /tmp/yocto-vars.txt | while read var; do echo $var; git grep "^$=
var " *.rst | grep -v " =3D ";  done > /tmp/unreferrenced-vars3.txt
> > Then inspecting the 3 results files and fixing the true positives manua=
lly.
> > There were many false positives too, but this reduced the number of lin=
es to inspect.
> > ---
> >   documentation/dev-manual/building.rst         |  6 +-
> >   documentation/dev-manual/packages.rst         |  2 +-
> >   .../migration-guides/migration-3.0.rst        |  2 +-
> >   .../migration-guides/migration-4.1.rst        |  2 +-
> >   .../migration-guides/release-notes-3.4.1.rst  | 22 +++---
> >   .../migration-guides/release-notes-3.4.2.rst  | 10 +--
> >   .../migration-guides/release-notes-3.4.3.rst  |  6 +-
> >   .../migration-guides/release-notes-3.4.4.rst  | 10 +--
> >   .../migration-guides/release-notes-3.4.rst    | 72 +++++++++---------=
-
> >   .../migration-guides/release-notes-4.0.1.rst  | 20 +++---
> >   .../migration-guides/release-notes-4.0.2.rst  | 14 ++--
> >   .../migration-guides/release-notes-4.0.3.rst  | 34 ++++-----
> >   .../migration-guides/release-notes-4.0.4.rst  | 22 +++---
> >   .../migration-guides/release-notes-4.0.5.rst  | 12 ++--
> >   .../migration-guides/release-notes-4.0.rst    | 28 ++++----
> >   .../migration-guides/release-notes-4.1.1.rst  | 46 ++++++------
> >   .../migration-guides/release-notes-4.1.rst    |  8 +--
>=20
> NACK for the release notes. AFAICT, most of the changes are in lines=20
> that are commit titles. You cannot expect the release manager to do=20
> those changes so it'll always be out-of-date.

Whilst we can't expect it, I'm not sure if there is an issue with
improving them and adding references if someone has such a patch?

Cheers,

Richard

