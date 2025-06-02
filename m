Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D58EC5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 13:40:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.49970.1748871606842542850
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 06:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rbe3i5Qc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cd6b511cso26493545e9.2
        for <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 06:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748871605; x=1749476405; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UXcj3Vu3AfsI00kwLDKJe0y/XU2BDPq+Ez81qmhJvEM=;
        b=Rbe3i5QcAjBaWprIWzMRAX2PmdU8zTcWJ6ltS2tma3ur69RbGwcMWFUMIiFl+5VigQ
         vRWrCd+RnZhSSA8jB4GyhuuWtYv9QZxVcShfEMuqiYaZraofYfJNeocwY1WTPHPOGnlT
         E4gPX3nF6kgKibpgg2sXM7Qn2DXcRWZvhwV20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871605; x=1749476405;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UXcj3Vu3AfsI00kwLDKJe0y/XU2BDPq+Ez81qmhJvEM=;
        b=niAaGjJzmiNvl+lKQWmwCynmB54xbBPvgH8svRxQ4QrOESR95iiQeW8XOu26xS9/Sa
         manrxLBYc5XT4jHXnAej5yKeksZ0eZEXlXMbjBW/geTqukou+DYHw/AGV/jvaXNTs1rs
         88/2H+vv5ZX4uBb9Nbfn9tdaoy7FMEYFREF8ROnyTx6c/AymUTGL6UiI4I3pQxVOJZW6
         NsYII5Yv5vrc0yCVrj8bpQDzIJt9I2TSYSud29RKU2H6auKBzPdXSOikaU04K3ssI+fQ
         RVNuB0LjNOPUxaAIUk/gH580H4nDzpHB1O1k/8belvKGiyQkfV5BX/9y43avyykeTvYd
         YKQA==
X-Gm-Message-State: AOJu0YyeIwOXTORAu59YrTSX4DV79hSDisfRMlhSaGsOc9Bl3Dg0HBLp
	VDWfNsOACrZQumGEC4KDo/JLHy8b3XI4hW8gN+mK+X5cgn629LnOgHGC7EF0Nh5KeBQ=
X-Gm-Gg: ASbGncui1wrY03u04y6Mp9QqoqhVjCVrQgK30d7HakmllqS9gKoYowi+qV85AJutLIM
	GpD+Aq+ugySrSmVoBK2L3qvOSgNwHz/OvYMUNWH5urgjA4TcLyflLs+wlbgg3hxDlRfgfK9GIeb
	rWHt6PETKi66oGw8OpJ1kRxM+U6DryN1nSMEXyfxHTj9851wkYD1xBMX3bOyaFgBSB7ZMF+tfiA
	R6gJAAdhAnGTRkyd0jhKxS+qrOoAqgrxbZ1DVXKqBimks0Y7uZRezzXfPut4AlOaHFrDPdXBH4y
	fit8MSlM1+EZv6jocSsZ+vmVLo7gVmuiJ8ahQyNKKUaS3mvGGCMsViYgTgWfKXzeqPj4AIjZxVT
	+oKv3dQO4GSYN7+qj3mpLpwsl0dXOxosdDgBKzItx
X-Google-Smtp-Source: AGHT+IF/wbhNZh/ddGE/uy/u/mMHPqg/GCNoXBKxIOzqHFyXfd+luDeqFiF9sl8Wr6rKKvu9OkwExg==
X-Received: by 2002:a05:6000:2c12:b0:3a4:d64a:3df0 with SMTP id ffacd0b85a97d-3a4f7a025bdmr10665198f8f.4.1748871605155;
        Mon, 02 Jun 2025 06:40:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dac2:e1a5:9f09:aee2? ([2001:8b0:aba:5f3c:dac2:e1a5:9f09:aee2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb80e9sm121095015e9.27.2025.06.02.06.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:40:04 -0700 (PDT)
Message-ID: <e9e6e07b2c61235036fbcbaf4b26aebf848f9385.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] Update Ubuntu essentials list, replace
 liblz4-tool with lz4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 02 Jun 2025 14:40:03 +0100
In-Reply-To: <5c9a3bab-b96e-bacc-beb7-1f0341b4bcb3@crashcourse.ca>
References: <6f93430f-7953-39b6-caf7-b144f37ab657@crashcourse.ca>
	 <565461c8bbac11ca798213c50c0e3ab6eee575ef.camel@linuxfoundation.org>
	 <5c9a3bab-b96e-bacc-beb7-1f0341b4bcb3@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 13:40:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6977

On Mon, 2025-06-02 at 09:17 -0400, Robert P. J. Day wrote:
> On Mon, 2 Jun 2025, Richard Purdie via lists.yoctoproject.org wrote:
>=20
> > On Mon, 2025-06-02 at 09:02 -0400, Robert P. J. Day via
> > lists.yoctoproject.org wrote:
> > >=20
> > > Update the "Ubuntu Essentials package list" by replacing the
> > > obsolete
> > > liblz4-tool package name with the current lz4 package name.
> > >=20
> > > According to Quentin Schulz:
> > >=20
> > > "According to pkgs.org, 20.04 lz4 replaces/provides liblz4-tool,
> > > same
> > > for 22.04 and 24.04 and for some reason, liblz4-tool requires lz4
> > > package, so I think it should be fine to replace it yes.
> > >=20
> > > "Debian seems to have the same packaging in Bookworm and
> > > Bullseye, so
> > > probably fine to do the change. They only seem to be adding a
> > > changelog and copyright, and require lz4 package in any case."
> > >=20
> > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > >=20
> > > ---
> > >=20
> > > diff --git
> > > a/documentation/tools/host_packages_scripts/ubuntu_essential.sh
> > > b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
> > > index f3388c88c..c4231188b 100644
> > > ---
> > > a/documentation/tools/host_packages_scripts/ubuntu_essential.sh
> > > +++
> > > b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
> > > @@ -1 +1 @@
> > > -sudo apt-get install build-essential chrpath cpio debianutils
> > > diffstat file gawk gcc git iputils-ping libacl1 liblz4-tool
> > > locales python3 python3-git python3-jinja2 python3-pexpect
> > > python3-pip python3-subunit socat texinfo unzip wget xz-utils
> > > zstd
> > > +sudo apt-get install build-essential chrpath cpio debianutils
> > > diffstat file gawk gcc git iputils-ping libacl1 lz4 locales
> > > python3 python3-git python3-jinja2 python3-pexpect python3-pip
> > > python3-subunit socat texinfo unzip wget xz-utils zstd
> > >=20
> >=20
> > Do we actually need lz4 on the system to run a build? This seems a
> > little strange to me...
>=20
> =C2=A0 Good question ... HOSTTOOLS definitely insists that it be there.

I suspect we could/should probably change that (and ASSUME_PROVIDED)
but I your fix is correct as things stand.

Cheers,

Richard

