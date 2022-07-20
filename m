Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA8DC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 13:26:06 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.53899.1658323561253814604
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 06:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KGlMJ5Sm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id h8so3404180wrw.1
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=g1lktD+COkEsTj059W0sVuzumm+G+jX8i9veD4MhYRY=;
        b=KGlMJ5SmGb0HCHJN5CDVnQofWfPwcbF8DEKY50OLUr1CqfM+lPFEX5bDO66f2Lb0l3
         mfH8VHCOEJGCHJo+X7un64juzwLriI9s5kNdpw6z5UnWA3vsmUj9n+BTbr+hkbiQDyHx
         TSL3fV1I7pgcrRNgZYDpGcz2xgth6Rkx6R/Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=g1lktD+COkEsTj059W0sVuzumm+G+jX8i9veD4MhYRY=;
        b=lnOPucDnm0VJm2DNLSaHyNtFeFhBIjzep7E5XZG36wADnP6HGk/NgraweWptRpy43k
         pw3QPR3nhxR9nd/9C6SQ8Dw1liD4s57Lu/A8FLYhOSfF72hyKUlTZY9E5wultW3L9DXF
         1DZLUIiNZiIXx2eSgX+NSJhwPM/imhoW+KQzG3Ym7bLATlx96MxVcsbo7I3hFXEBB9no
         V93znWKIcYNii46VOWe77QX9dbaqNILlR7D/b4SZNPkeOdCXOLyesTKVEy+Z0UTx/5Sj
         9w+2o8m3vZl41AdHFfU6yl9xDFqb1a3CdRqjr4FQSO2IRZjuxl+WrzuPJbBd1H0xkG+I
         J0EQ==
X-Gm-Message-State: AJIora9U4ilUWcl9Q9MqtUz5v2ZB/r5shHv1oVkjBXOcmamqdkT2caay
	OU4EoobGLYcdvQ+qKUNtSJK0Sw==
X-Google-Smtp-Source: 
 AGRyM1tv84pvLwdTdC7jjDHtp4BZPGMbi5rKPcqQTbLxal7fll+GdlMQcuJtCR6zeObtdq6l/7dp7Q==
X-Received: by 2002:adf:d226:0:b0:21e:3f64:4e2a with SMTP id
 k6-20020adfd226000000b0021e3f644e2amr5594307wrh.304.1658323559620;
        Wed, 20 Jul 2022 06:25:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:feec:14a3:c5ce:5d56?
 ([2001:8b0:aba:5f3c:feec:14a3:c5ce:5d56])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003a32251c3f9sm3020839wms.5.2022.07.20.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:25:58 -0700 (PDT)
Message-ID: 
 <5bf6639b0021dcc15e53e298064f2a30033fcf8b.camel@linuxfoundation.org>
Subject: Re: [docs] [master] Pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	michael.opdenacker@bootlin.com
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 20 Jul 2022 14:25:57 +0100
In-Reply-To: <91e02526-fd34-2858-30fd-aac9ef324d54@theobroma-systems.com>
References: <8d2564aa-adde-1ed9-b303-5572326d9733@bootlin.com>
	 <91e02526-fd34-2858-30fd-aac9ef324d54@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Jul 2022 13:26:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3080

On Wed, 2022-07-20 at 15:08 +0200, Quentin Schulz wrote:
> Hi Richard,
>=20
> On 7/20/22 15:01, Michael Opdenacker via lists.yoctoproject.org wrote:
> > Hi Richard,
> >=20
> > Here are changes for master, in particular the update of the hash serve=
r=20
> > host (happening soon) and the set_versions.py update from Quentin which=
=20
> > will allow to take his changes to run-docs-build.
> >=20
> > Thank you in advance
> > Cheers
> > Michael.
> >=20
> > --=20
> >=20
> > The following changes since commit=20
> > afa895871e8ec18f4861f48f70b8a54cc2e4cb98:
> >=20
> >  =C2=A0 documentation: remove obsolete PEP517_BUILD_API (2022-07-15 12:=
30:30=20
> > +0100)
> >=20
> > are available in the Git repository at:
> >=20
> >  =C2=A0 git://git.yoctoproject.org/yocto-docs master-next
> >=20
> > for you to fetch changes up to 5004957d1c65d03d3e296bc9f0a00982457a27f8=
:
> >=20
> >  =C2=A0 docs: BB_HASHSERVE_UPSTREAM: update to new host (2022-07-20 14:=
50:03=20
> > +0200)
> >=20
> > ----------------------------------------------------------------
> > Aatir Manzur (1):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref-manual: Sphinx note directive for D=
ISTRO_FEATURES definition
> >=20
> > Lee Chee Yang (1):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 migration guides: release notes for 4.0=
.2
> >=20
> > Michael Opdenacker (1):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docs: BB_HASHSERVE_UPSTREAM: update to =
new host
> >=20
> > Quentin Schulz (2):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docs: ref-manual: variables: remove sph=
inx directive from literal=20
> > block
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docs: auto-generate releases.rst
> >=20
>=20
> This will likely break the autobuilder unless=20
> https://lore.kernel.org/yocto-docs/20220719081214.1924835-3-foss+yocto@0l=
eil.net/T/#u=20
> is applied in yocto-autobuilder at the same time.

Thanks, I merged both.

Cheers,

Richard

