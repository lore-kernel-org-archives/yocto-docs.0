Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5CAC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 13:02:22 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.6794.1655902939474290994
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 06:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HFOgxWNy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id i10so19553128wrc.0
        for <docs@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 06:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Eutkn9ZlVve9fWY1UVJ6q6maCF51/wu9roX3dac01Bs=;
        b=HFOgxWNyZVff4Auqu2eFGNjzKWURuUvmH0fWf0dsWUU64WRKwd76BCJxLNjxyRelvv
         0Kd/hO1yPSz45vW6MIMiBpm0SxHLd2NO9lLKwVhoxPl0Nf3zo50cVeYSoDRuE+pgxoTf
         X79BdyPs1ayAOUqwCpW9Y2t9iJIt+KZuO7uj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Eutkn9ZlVve9fWY1UVJ6q6maCF51/wu9roX3dac01Bs=;
        b=1p9g/aY8KY6flEDR1WQiP7pL6tXm5rGmUu6M8WtDgYjkocDEZiywhN/RKL4xLEZe5I
         hOLaMGbtL5ZNrH/6reZuZBM+nCyDYqO813aI/GpSYUqSFUxpurLZoIiyaBx0J3UNTc1f
         N+t86XCbk2ZeAlQPF9gLkOx5UfT+kpvPaHAQizC+PH/ER48DCrcGfofpOGkJrMCpUeVo
         I4Q5+k8xGpwdONCOXBlzhvh583g7Hf+4AkLSBYLyWY2wckNrL16z/gfBDXm70tKTfvCx
         bb5JJ9XutzJN8leQhkUAex42Yf/S/6XFDv+G4TfnxD9DyKENZ7S2TTQA2vnyFdDaZxHM
         t5gg==
X-Gm-Message-State: AJIora9ErVqLeM+9gL9ZNfHs56d6ulK7Zyzp3Qt9DLYb9Xlzg2imVIKe
	UySPjRiFm5NrTMykYwW+tvbphg==
X-Google-Smtp-Source: 
 AGRyM1sG3ycXsvzbxw9BaEFhBJ1/yKo4bFxflB8jr155x1bJOdVR5dIEiNeFq00278orICM9fL5G/g==
X-Received: by 2002:adf:f80c:0:b0:21b:89a6:9132 with SMTP id
 s12-20020adff80c000000b0021b89a69132mr3381558wrp.170.1655902937615;
        Wed, 22 Jun 2022 06:02:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b8dc:82a2:aabd:2c47?
 ([2001:8b0:aba:5f3c:b8dc:82a2:aabd:2c47])
        by smtp.gmail.com with ESMTPSA id
 x24-20020a7bc218000000b003942a244ee7sm21439803wmi.44.2022.06.22.06.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 06:02:15 -0700 (PDT)
Message-ID: 
 <528312534e2c03df8673fdae16b18313a272049c.camel@linuxfoundation.org>
Subject: Re: [yocto] [PATCH yocto-autobuilder-helper 4/4] Revert "scripts:
 run-docs-build: do not turn sphinx warnings into errors"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	yocto@lists.yoctoproject.org, Quentin Schulz <foss+yocto@0leil.net>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, YP docs mailing
	list <docs@lists.yoctoproject.org>
Date: Wed, 22 Jun 2022 14:02:14 +0100
In-Reply-To: <f14b7aa4-fa3d-7bcf-ec43-e58d0abdf507@bootlin.com>
References: <20220315163115.2186540-1-foss+yocto@0leil.net>
	 <20220315163115.2186540-4-foss+yocto@0leil.net>
	 <f14b7aa4-fa3d-7bcf-ec43-e58d0abdf507@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jun 2022 13:02:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3021

On Wed, 2022-06-22 at 14:50 +0200, Michael Opdenacker wrote:
> Hi Quentin
>=20
> On 3/15/22 17:31, Quentin Schulz wrote:
> > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> >=20
> > The patch was meant as a quick temporary work-around to have the docs
> > built and published.
> >=20
> > Now that releases where -W flag is set (turning warnings into errors)
> > are appropriately patched to make those warnings disappear (on Sphinx
> > v3.2.1 which is the one used on the builder), this patch can be reverte=
d
> > so that next time a warning appears the doc building will fail but will
> > not destroy the doc website (because of commit
> > 6a4e6ef18d1415c719be51c773d7c57cae5549cf "scripts: run-docs-build: make
> > the script fail hard ASAP when there's an error", since rsync will not
> > be run if any error happens before).
> >=20
> > This reverts commit 931d409b255a85f2217ca093d8391a678ce00ddb.
> >=20
> > Cc: Quentin Schulz <foss+yocto@0leil.net>
> > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > ---
> >   scripts/run-docs-build | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/scripts/run-docs-build b/scripts/run-docs-build
> > index 73cba3f..b9b331b 100755
> > --- a/scripts/run-docs-build
> > +++ b/scripts/run-docs-build
> > @@ -33,14 +33,14 @@ cd $bbdocs
> >   echo Building bitbake master branch
> >   git checkout master
> >   make clean
> > -SPHINXOPTS=3D"-j auto" make publish
> > +make publish
> >   mkdir $outputdir/bitbake
> >   cp -r ./_build/final/* $outputdir/bitbake
>=20
> We're trying to build the docs with Sphinx 5.0.0 on a special branch,=20
> and we're getting warnings causing the builds to fail:=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/114/builds/487/st=
eps/5/logs/stdio
>=20
> If this patch hadn't been reverted, we would probably be fine.
>=20
> What should we do now? Patch docs for all past Sphinx based releases? If=
=20
> we tolerated warnings, we would have to do this less often when we want=
=20
> to upgrade Sphinx.
>=20
> In my opinion, another more trouble-free solution would be not to=20
> regenerate docs for past releases, but instead only for the latest=20
> commits in the branches we currently support.
>=20
> What do you think?

We use the ability to regenerate previous releases to update the
switcher lists and potentially other style related changes in future
which keeps the docs looking consistent. We may have to disable the
errors on warnings :(

Cheers,

Richard



