Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1377ECAAD5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 15:56:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.351.1662134191407071744
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Sep 2022 08:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H+kcJVCw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so1657688wms.5
        for <docs@lists.yoctoproject.org>;
 Fri, 02 Sep 2022 08:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=+F31VeaM65ImIk3eg7C3ElhoBQvPlWf9k7kuLLUGTwY=;
        b=H+kcJVCwMqdQpRDC+8XD3AGzXU4guug8Okcc1wgF6EM2BaOEur9ihL+6v9JzCftia/
         IHAQfBrQm7a+SB7ZTpirvX2i3EDkcE/H95EpQLBTmVsZ1a0/Flhg66oj9C9GjOMytqxt
         nF0vq8xBCFhyiezuFuUXfUgeqSZeqo5VYUQu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=+F31VeaM65ImIk3eg7C3ElhoBQvPlWf9k7kuLLUGTwY=;
        b=XnBG2XDfhSfyHjtbC6BXwuEVtZ9383dZd5q/pCNNhSMFSQZZ638ZX7duwxCvpF6Ogq
         1/6vLbJQffNQeKcVkledNQLNEKoNxGT5qiGxsL78jmeahNYvgqaXfmZjHZzYricmh5Nt
         wromm0jiTwQpfpsr/isn6mK67BSGAtKirp4plxxuwWmhOtALKL7Ws+GnpwsyOO1eHlex
         FyCfsy5rDI2SeoNuBvCFrt5IUR0KsEnEkZfPs2MKiPz/LnyWo8OOZx8HLdGEYTg794iw
         xdT3JbejWy2VooMuJYErYwatjSTc5Y3TbLbg19VISuH9PZaeZW0FiPeiLO4AXAij7qJQ
         CDtw==
X-Gm-Message-State: ACgBeo2NIswvzBanOaNt+a96AzFWHcG9Voh96Qv0Ie0z3/Jy73kW4FZg
	RsL15s2XxOy2ms8efkX4XDzf6Q==
X-Google-Smtp-Source: 
 AA6agR60hhZuixDslwAOKCNqK1U2EWnSH/O405cn/4UuK8emapMAVq+dVE5cfpULcjbjVohZGuZlSw==
X-Received: by 2002:a7b:ce89:0:b0:3a5:cefe:80f6 with SMTP id
 q9-20020a7bce89000000b003a5cefe80f6mr3501758wmj.113.1662134189859;
        Fri, 02 Sep 2022 08:56:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cbec:572b:ff3a:e320?
 ([2001:8b0:aba:5f3c:cbec:572b:ff3a:e320])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c349500b003ab1a870daasm2304392wmq.5.2022.09.02.08.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 08:56:29 -0700 (PDT)
Message-ID: 
 <832988652fd0646394de3145564a068ba6c59b51.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [docs] [PATCH v2] doc: bitbake-user-manual: Add
 definition for BB_PRESSURE_MAX variables
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, Aryaman Gupta
 <aryaman.gupta@windriver.com>,  bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org
Date: Fri, 02 Sep 2022 16:56:28 +0100
In-Reply-To: <a7c1377a-b3e1-fea0-9b67-5d5cb652871a@bootlin.com>
References: <20220812182236.1650194-1-aryaman.gupta@windriver.com>
	 <a7c1377a-b3e1-fea0-9b67-5d5cb652871a@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 Sep 2022 15:56:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3132

On Mon, 2022-08-29 at 14:46 +0200, Michael Opdenacker via
lists.openembedded.org wrote:
> Hi Aryaman,
>=20
> Many thanks for the patch! Apologies for the late review, I was away on=
=20
> vacation.
>=20
> See my comments below:
>=20
> On 8/12/22 20:22, Aryaman Gupta wrote:
> > Add the definitions for the BB_PRESSURE_MAX{CPU|IO|MEMORY} variables in=
 the
> > bitbake varibales glossary. Further information on how to determine a g=
ood
> > threshold will be added to the Yocto reference manual in a later commit=
.
> >=20
> > Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
> > Signed-off-by: Randy Macleod <Randy.Macleod@windriver.com>
> > ---
> >   .../bitbake-user-manual-ref-variables.rst     | 30 ++++++++++++++++++=
+
> >   1 file changed, 30 insertions(+)
> >=20
> > diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.=
rst b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
> > index 12aef3cb..9b2027de 100644
> > --- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
> > +++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
> > @@ -482,6 +482,36 @@ overview of their function and contents.
> >  =20
> >            You must set this variable in the external environment in or=
der
> >            for it to work.
> > +
> > +   :term:`BB_PRESSURE_MAX_CPU`
> > +      The threshold for maximum CPU pressure before BitBake prevents t=
he
> > +      scheduling of new tasks. Once the :term:`BB_PRESSURE_MAX_CPU` th=
reshold
> > +      is exceeded, new tasks are not started until the pressure subsid=
es to
> > +      below the threshold. If :term:`BB_PRESSURE_MAX_CPU` is not set, =
CPU
> > +      pressure is not monitored. A threshold can be set in ``conf/loca=
l.conf``
> > +      as:
> > +      ::
>=20
>=20
> Actually, here you can just use "as::" instead of "as:" followed by "::"=
=20
> in the next line.
>=20
> > +
> > +         BB_PRESSURE_MAX_CPU =3D "500"
> > +
> > +      Information about how to set a suitable value and some other cav=
eats to
> > +      consider can be found in the
> > +      :ref:`Reference Manual </ref-manual/variables:BB_PRESSURE_MAX_CP=
U>``
>=20
>=20
> I'm afraid you'll have to add this reference in a later commit, because=
=20
> for the moment, this creates a warning that is turned into an error.=20
> Sorry, this is the pain of managing two manuals at once. You may say=20
> "Yocto Project Reference Manual" then.
>=20
> By the way, you had an extra backquote at the end of your reference.
>=20
> > +
> > +   :term:`BB_PRESSURE_MAX_IO`
> > +      The threshold for maximum IO pressure experienced before BitBake
> > +      prevents the scheduling of new tasks. The IO pressure is regulat=
ed in the
> > +      same way as :term:`BB_PRESSURE_MAX_CPU`. At this point in time,
> > +      experiments show that IO pressure tends to be short-lived and re=
gulating
> > +      just the CPU can help to reduce it.
> > +
> > +   :term:`BB_PRESSURE_MAX_MEMORY`
> > +      The threshold for maximum memory pressure experienced before Bit=
Bake
> > +      prevents the scheduling of new tasks. The memory pressure is reg=
ulated in
> > +      the same way as :term:`BB_PRESSURE_MAX_CPU`. Note that any memor=
y
> > +      pressure indicates that a system is being pushed beyond it's cap=
acity. At
>=20
>=20
> s/it's/its/
>=20
> > +      this point in time, experiments show that memory pressure tends =
to be
> > +      short-lived and regulating just the CPU can help to reduce it.
> >  =20
> >      :term:`BB_RUNFMT`
> >         Specifies the name of the executable script files (i.e. run fil=
es)
>=20
>=20
> Would you mind sending a V3 fixing these, please? This one should be=20
> ready to merge.
> Thanks in advance, and thank you for your patience :)

Aryaman is no longer at Wind River so we may need to handle the tweaks
ourselves.

Cheers,

Richard


