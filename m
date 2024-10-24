Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7860CFA47F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 10:31:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.11521.1729765864586024118
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Oct 2024 03:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NR0CsSqX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43152b79d25so7131375e9.1
        for <docs@lists.yoctoproject.org>; Thu, 24 Oct 2024 03:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729765863; x=1730370663; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=upYlFT3tzWh52TND2cfBGm0O2VVCP18U3QvYIrbKEdQ=;
        b=NR0CsSqX4NV7LCz9C9YGfEt80BM/iH6VRBdxoNOj+qqZFUnHV0VEwUfd+m2rFkFD8+
         e+1YgawW18P4ottBDYCafT/j8hv48cuwEyVx+PhuShkuCHOJlWEIiND9C0j+n+6spp1e
         fHIQSHJ8UhXZGSwdEBqc7cGMucikyO6IoeaCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729765863; x=1730370663;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upYlFT3tzWh52TND2cfBGm0O2VVCP18U3QvYIrbKEdQ=;
        b=h6A5Kd8VmtKrVosHYtcGGNznPV2YwxngFrfjri3nRc/fICT2qb5A/Iu7KGORrjuhPd
         Ke+9uJX+k3PKZ3FxdPnFSdk64PJe6mS6i0Kv4XyYa5iakTUgIGF88DpuY7XiRdKK6NUM
         o8nDMW/ebCn7WeEDHsv3+QKa6qtyFboj4D6IHtp4qrE9lcPBdD29N3/RlYNdvL5UAqUy
         M7lWsqTvlANWQWYzeasumJw4CO0RaPZVMj+FbfPYvuLvZYORO+3xKy1m0IvDSjElq+g+
         H+SYi969Gb4/SimARGNHzS/HQmTFP8lnVwSlGeP6cjNcebX/cvI2MVIzSPjFq3QFGMv1
         bdZw==
X-Forwarded-Encrypted: i=1; AJvYcCU1VIrXHMQoz4zcPrjlnYmJpVScEm/5gZsxj/7V73bBqKkLd8pr2EVimKS5VCznyBtTwV5f@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxgl0363SfFZ3c5phidYGzsSg72GifS0xX3Au44m1/IdeUkSXGe
	9f/TjVOvHG4lCVn6KgYn9U4yc2azISlRskJgF+m8gKdkURmEqr1zVHor20Rn0y4=
X-Google-Smtp-Source: AGHT+IHx8RmIO6fkuSRvBm0qJZfNELEBHNZpBaW4unRDPWjsO0cC1GGtZ+R6rvyDXKzhk/qVSqY80A==
X-Received: by 2002:a05:600c:4ecb:b0:431:5aea:964 with SMTP id 5b1f17b1804b1-4318415c2damr45887855e9.19.1729765862847;
        Thu, 24 Oct 2024 03:31:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f? ([2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bd6856sm41458265e9.6.2024.10.24.03.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:31:02 -0700 (PDT)
Message-ID: <dcb9d19c783f9e550da815986ca64d21b2d4471d.camel@linuxfoundation.org>
Subject: Re: [PATCH] ref-manual: faq: add q&a on class appends
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Oct 2024 11:31:01 +0100
In-Reply-To: <20241024-faq-class-append-v1-1-673c675cc6aa@bootlin.com>
References: <20241024-faq-class-append-v1-1-673c675cc6aa@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Oct 2024 10:31:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5581

On Thu, 2024-10-24 at 11:14 +0200, Antonin Godard wrote:
> Add the suggestion by Richard to the FAQ, with some minor rewordings and
> additional punctuations.
>=20
> Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> =C2=A0documentation/ref-manual/faq.rst | 19 +++++++++++++++++++
> =C2=A01 file changed, 19 insertions(+)
>=20
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/=
faq.rst
> index bab284bbfdefae02c284204d3c94891a8238239a..3dcb1f862e24716be703f9fd3=
e811d2fb9ed34a0 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -259,6 +259,25 @@ Within the :term:`Build Directory`, is the ``tmp`` d=
irectory. To remove all the
> =C2=A0build output yet preserve any source code or downloaded files from
> =C2=A0previous builds, simply remove the ``tmp`` directory.
> =C2=A0
> +Why isn't there a way to append bbclass files like bbappend for recipes?
> +------------------------------------------------------------------------
> +
> +The Yocto Project has consciously chosen not to implement such functiona=
lity.
> +Class code is designed to be shared and reused, and expose some level of
> +configuration to its users. We want to encourage people to share these c=
hanges
> +so we can build the best classes.
> +
> +If the ``append`` functionality was available for classes, our evidence =
and
> +experience suggests that people would create their custom changes in the=
ir
> +layer instead of sharing and discussing the issues and/or limitations th=
ey
> +encountered. This would lead to bizarre class interactions when new laye=
rs are
> +included. We therefore consciously choose to have a natural pressure to =
share
> +class code improvements or fixes.
> +
> +There are also technical considerations like which recipes a class appen=
d would
> +apply to and how that would fit within the layer model. These are compli=
cations
> +we think we can live without!
> +
> =C2=A0Customizing generated images
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> =C2=A0

Looks good, thanks!

If/as/when I see anything else which should be in there I'll try and
note something down. We should really try and collect more of these.

Cheers,

Richard

