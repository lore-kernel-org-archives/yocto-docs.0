Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B20C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 11:40:24 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.3501.1655293222758907845
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 04:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UNYKSEI4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id o8so14998983wro.3
        for <docs@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=qBKmYb5Il0hnA6h4mLxFa85PzAOuqE2RoFSo6bmEa+k=;
        b=UNYKSEI4KbvMkGj049Pm3iYnBw0oeXj+aigpIbSX6qjd8WJ2BGDi4EUWAfqB9BwdHB
         NIcuW4Vs9Gc7WCVRx1RCSqo0TqQQxqcqUqO04oaMqDOwHEPrYFdpI0FOSrKIbk9LU6WF
         21DqlJJtnS1UYrt+vGgkOsP3xtJenIR9NDzIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=qBKmYb5Il0hnA6h4mLxFa85PzAOuqE2RoFSo6bmEa+k=;
        b=gUNuRkLRduJaEqvAhF3SYvJcG7swEerY2T8JFGU6+M5Ks1QX0kh2aukYSPhQ9/8NJK
         Y1MzF7MNB5/FJ8ldhTJKqZMsvnzD8bSgIsxE4luOtoRj9AyuU1W8zsmQifTtcnlZ4RrL
         KvZfF3E1BMgBHaRixhyclCMswH0x0nNzZ+QqVhn1Iez/pgZOk5t6arViumOMSUlIiBmN
         VwdIu+CY2xwzg1yPgQQmOyDqNmlzafNOm0EzHXFMsxfG5ea/8MDlbSeYQpA6xuI8wuV5
         e9Qbb/4HWoSG4orgcdydaIaoycpA4frqaXEcCRFjWladvRjOnauJUnZuprFLoEBqVnOI
         6Lsw==
X-Gm-Message-State: AJIora8efn3qbh4e5c3bpin2t2MpxY16KQSyVezWrd5tambQDj2D2KWg
	Em0/x1LP9aFZjZVLgLBjIO0JMg==
X-Google-Smtp-Source: 
 AGRyM1toyh72Yrn8RxmRK0k9uwjwdLBaq2hGtxg7fZozGd5wTiTkp609jME1yIVWHGS8HFHeGniQeQ==
X-Received: by 2002:a5d:6d8b:0:b0:218:4dc8:293e with SMTP id
 l11-20020a5d6d8b000000b002184dc8293emr9549359wrs.612.1655293221280;
        Wed, 15 Jun 2022 04:40:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5217:2b74:ee57:d3bc?
 ([2001:8b0:aba:5f3c:5217:2b74:ee57:d3bc])
        by smtp.gmail.com with ESMTPSA id
 l30-20020adfa39e000000b00215859413f3sm15061027wrb.107.2022.06.15.04.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 04:40:20 -0700 (PDT)
Message-ID: 
 <9a0a57e5f81321816ee07cf0f18c33d1b73d7283.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] doc: Makefile: publish pdf and epub versions too
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Date: Wed, 15 Jun 2022 12:40:19 +0100
In-Reply-To: <37b58867-3670-aa38-0bea-d800ce73e5ba@bootlin.com>
References: <16F8C055A720EC59.22184@lists.yoctoproject.org>
	 <37b58867-3670-aa38-0bea-d800ce73e5ba@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jun 2022 11:40:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3004

On Wed, 2022-06-15 at 11:14 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> On 6/15/22 11:12, Michael Opdenacker via lists.yoctoproject.org wrote:
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >=20
> > [YOCTO #14357]
> >=20
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >   documentation/Makefile | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/documentation/Makefile b/documentation/Makefile
> > index 9fb6814c8f..e013f68e7f 100644
> > --- a/documentation/Makefile
> > +++ b/documentation/Makefile
> > @@ -22,10 +22,10 @@ help:
> >  =20
> >   .PHONY: all help Makefile clean publish epub latexpdf
> >  =20
> > -publish: Makefile html singlehtml
> > +publish: Makefile html singlehtml epub latexpdf
> >   	rm -rf $(BUILDDIR)/$(DESTDIR)/
> >   	mkdir -p $(BUILDDIR)/$(DESTDIR)/
> > -	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/$(DESTDIR)/
> > +	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/epub/TheYoctoProject.epub $(BUIL=
DDIR)/latex/theyoctoproject.pdf $(BUILDDIR)/$(DESTDIR)/
> >   	cp $(BUILDDIR)/singlehtml/index.html $(BUILDDIR)/$(DESTDIR)/singlein=
dex.html
> >   	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)=
/singleindex.html
>=20
>=20
> Note that a possible issue with this patch is that the current=20
> autobuilder for docs may be missing packages (LaTeX in particular) to=20
> generate the new epub and pdf outputs.
> How shall we proceed?

Do we know exactly what is needed? Could we add it to the buildtools-
docs-tarball?

We could quickly hack the docs target in a test branch for -helper to
check whether we have what we need (which we likely won't right now)?
This might fit in with the other sphinx version issues?

Cheers,

Richard





