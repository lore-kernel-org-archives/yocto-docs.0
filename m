Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF096E77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 23:22:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.42987.1735082543264572136
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 15:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cXz+i3kN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3863c36a731so4084364f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 15:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735082541; x=1735687341; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZNve/ORcEl2iRfb5orX1DmyVYLfPweVCdnFPhRS/nA4=;
        b=cXz+i3kNB3FfsOH61caioDr/relct/QIrTKJQIQg92kwhyEaBTpwW1w63yHVXuakjz
         WAARCx7V7k6xQZ+8loiIjfY29Fa53kVGUDwvWH/t0ydBAIiNliGkyWYh1XgqaxCtOtm4
         TJOnmjAcKjI4Im1j9hTxx4+TG6xmsmrXD1GUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735082541; x=1735687341;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNve/ORcEl2iRfb5orX1DmyVYLfPweVCdnFPhRS/nA4=;
        b=qhN7UZU6PmqWhuP4j1UUcVZo+WMbrl1y4JP8zh4yXc/5iKxRo1MWO/Gq3BcJ6ws3fT
         wARzyyMKllkWOAwD6c35N9ktr4aYstUvm2BQrRC3Xgd+OZ4sNnOyYqVInGrA6awrIHq4
         ts324csGw5XYARNFmIMPqtjwoCNmW7kYlhNlataYXQtkGFO5KqgjvEwcAy9Mjv9k0ymI
         Y2l28LvYz9JQSU6P1UmDANEV0aAw9ikLiHNTyr4igV+ox1pQo9IdsQ5ZSil1IMxDWe/v
         A/7nF3s1+8Zb7Q7DY5uyOcHmYoxG67m2GRzlRdOoTAbi4HdR7c0ZO35YpULgbBk1czvj
         cyVw==
X-Forwarded-Encrypted: i=1; AJvYcCU8bgf+nOsqjLKujvaONCwJRFffO8kBKwjKuPddpf2L5nUykyjOQzrZ5UMP5me/EKGnJOwS@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzvzTJvUegRX+0quNvmo4cHgSxxGPabZxOnpntuUg8ottsh/DTh
	3BhsqAPu6iq6M8X5ZLisK+gZmSHvgxzsWEKEf/P24LNfZZJWKoOGXL54xOGaWkI=
X-Gm-Gg: ASbGncvpbZ1gpYPf3chkTE+ELXnLifvUvRf6Gmbv36crab1rU6Z7VjjebIrjYBI4VQK
	Qw9P+teZgIPt40+u5eFwZqvHxWKi9MJVPjEaggC7wdeuLjyKTHtDNUCUeOqbyPAGlGNo+KSFfD+
	6cfUqm0nRhI6K5NpB8tuByLQhzdaiTfMC98kmY2DyNKWzNd78OiVUS6EYvWI218UyENH84EFXFW
	E/y2DW8nB3TSx1pBbeJ0DODrXjytT7Jc/YivkQQ+hfN5X/BaP4TiKNMg/3zQyfwENl/X+1We4xf
	NqmjUgSDFvOsI5XqASR48Ok1XgTv8fYuo26dHHihU0BGOA==
X-Google-Smtp-Source: AGHT+IHaANCV6IyuvYmADa++AVitimh1fZJO8kfr7H0n9Bt9U4ixkc+yk6+B7UxT5KJSRI4yg0TAxA==
X-Received: by 2002:a05:6000:4021:b0:385:f6b9:e762 with SMTP id ffacd0b85a97d-38a223f760bmr14921043f8f.36.1735082541356;
        Tue, 24 Dec 2024 15:22:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:28b2:b947:41d3:af7c? ([2001:8b0:aba:5f3c:28b2:b947:41d3:af7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013ecsm215271265e9.16.2024.12.24.15.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 15:22:19 -0800 (PST)
Message-ID: <42f3567668e35a5398dbbeefc408d71e90292463.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] Set max supported Python version
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Javier Tia <javier.tia@linaro.org>, docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Ilias Apalodimas
	 <ilias.apalodimas@linaro.org>
Date: Tue, 24 Dec 2024 23:22:17 +0000
In-Reply-To: <d507bfc4-a4ab-45e8-adee-6503896fc045@app.fastmail.com>
References: <20241224221625.4092917-1-javier.tia@linaro.org>
	 <0fc165187afd965a79989a412d16bc77271248a3.camel@linuxfoundation.org>
	 <d507bfc4-a4ab-45e8-adee-6503896fc045@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 23:22:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6028

On Tue, 2024-12-24 at 17:13 -0600, Javier Tia wrote:
> On Tue, Dec 24, 2024, at 4:54 PM, Richard Purdie wrote:
> > On Tue, 2024-12-24 at 16:16 -0600, Javier Tia via
> > lists.yoctoproject.org wrote:
> > > When Bitbake is used with Python 3.13, it generates numerous
> > > build
> > > issues that do not occur with Python 3.12. The documentation is
> > > clear
> > > for the supported Linux distributions, but not for the supported
> > > Python
> > > versions.
> > >=20
> > > Signed-off-by: Javier Tia <javier.tia@linaro.org>
> >=20
> > Can you be specific about which version of bitbake you saw the
> > issues
> > with? I was hoping we had resolved most of the issues with 3.13, at
> > least in master. We do aim to work with new versions of python but
> > it
> > obviously takes time to catch up and for fixes to make older
> > versions.
>=20
> With Bitbake from poky master (284a08b6e40761f) and BitBake from the
> latest master (c9906bb289dcfd9). Python 3.13.1.=20
>=20
> Issues:
>=20
> - "ERROR: ParseError in None: Not all recipes parsed, parser thread
> killed/died? Exciting." I noticed it was solved in Yocto Bugzilla,
> but I reopened the bug because I believe it is still not fixed.
>=20
> - The problem mentioned on
> https://wiki.yoctoproject.org/wiki/Pseudo_Abort=C2=A0with several poky
> recipes (base-files, update-rc.d, qemu, and u-boot) and other recipes
> from other layers.
>=20
> Please let me know if more information is needed.

We have a fedora41 worker in the autobuilder cluster which has:

fedora41-vk-1:~$ python3 --version
Python 3.13.0

As you can see here:

https://valkyrie.yoctoproject.org/#/workers/54

is it running builds successfully. There is therefore some difference
in your environment and I'm not sure it is python 3.13 that is the
cause of the problems you're seeing.

Are there any tracebacks in bitbake-cookerdaemon.log? Which distro is
this?=20

The pseudo aborts are likely a different problem with a missing libc
intercept or similar issue and secondary to the other problem.

Cheers,

Richard









