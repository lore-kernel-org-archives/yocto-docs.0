Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC25CD8CB9
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 15:57:18 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83206.1781020632730733376
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 08:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V0LKXQok;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490afc47455so30129415e9.2
        for <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 08:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781020631; x=1781625431; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+NZMtIofuSlWynry4pj0npPZdAsOkakxqYQQ4PW0Ks=;
        b=V0LKXQokvXAoeXSizyIcnHPg/MlAoSl4BXeeBE95YFyYYwkuGNY613NJZv9d6UMu0f
         AIu7ZwsYQQVEnu0s7MfsrAQ/iBZktfaVMxC7XvmQ9+gvMJsmEPdDfl0QkP7GlTuSxrA1
         QsajOC/c/ockgm0YW/gYg+pbjfyoG4WygnAF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020631; x=1781625431;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+NZMtIofuSlWynry4pj0npPZdAsOkakxqYQQ4PW0Ks=;
        b=tIIp+KcNbuJaP/sNlpUj6CbSGnKrdZPimxYCg9tMw03NXjETOpbNFnT0nGhiUfa6Od
         R9Jf012mRpOFE1lh3E/powpBqZ4XV0lj3mrr3p4Epp5DH2z11hDNmZw3CogdsqTO7uLt
         +DojK/Taq1gWnnot+HcReqd8easI6tfgvh3bpg2m0QwmKQ6Ml0qYG9irlJaaA9CxiA4F
         b4fm/U6eSZIiRnouDWKe0sa2jpwOGv6RHb+KeDIIvp/ODCphZY1iyXWfHeOyybTorq3u
         o4CQ628BHlWolQvHwwENk3YVuLw3EtE85fvCZclo6XhBOjEtvgyZC+S4mk2NksHjPnML
         73sw==
X-Forwarded-Encrypted: i=1; AFNElJ867DTKjGTo/TzmZzSAXX3H/QdWym7/A7oALCwfaV9lxPfkI4o7C9aVgFtz3+tHjxknTDUx@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx/z1jWLLENUlap84fxuTaTU8Y7NQ5W3aHvVWi8Z5KoXI5xDnib
	fbAIX8YVjuHDuVQS168+T/pCgU7QUoy8FvDwWUgXDIsFzoSC0wKfdobzpkmaF06bTIZU5e4tXsL
	5169o
X-Gm-Gg: Acq92OEeDX5pXCbTPiVPtzyj+l9MMqMFptRlV07OLisGVaUvUf2LD6hHKSaavEW2Bj1
	BpmXaJYTY/Ptp61SemZD3P+GDGAVnxnV4jK0edj0MmBUdq6L2+tCNbjQOKej3kVAv3lpH5hoc20
	88EcR6YKEmOIyN9IeY3eojzW8H+oXz0TKdlhF3QLfajLPRx2VkP7x4bg8UI/5Mk0UKUudmfAfy4
	ICxDXZKTAruGI96IBbMb9L8/0t+XHzeqtHmdVJPRB0OQkMZd1XCyZvBjjGgvla3XzMyTh0pgKUT
	oTMkjrbdDDkNPS9G91gmKynwURGss3TQLATTi5iVCx7asASwcLKYmK9lsCi1Dn+2L5oYpE+9yNv
	S05KBPPcchpoFGt+EEXpBEq56qZOAShXWKInUeuEUWznwQ+oKhRvPQcmBAb4bTuTjAKkRj6EnTz
	HDkMlmmAIV3V93oWpzEIYfW4rKKA5AexxwhKVf9OaWqE7iFMVrc+1LwV4MUKRP9S7hRIflhjrZ4
	502JwfeXc8D1/+Q4MooeLBGRoM=
X-Received: by 2002:a05:600c:821a:b0:490:4973:91a0 with SMTP id 5b1f17b1804b1-490d71fa976mr42713165e9.10.1781020630881;
        Tue, 09 Jun 2026 08:57:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1? ([2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3e59f5sm519756785e9.14.2026.06.09.08.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:57:10 -0700 (PDT)
Message-ID: <dc7c0897403cdbcf8cd3cc81d846b005a0d6744c.camel@linuxfoundation.org>
Subject: Re: [docs] some questions about "Post-Installation Scripts" section
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Tue, 09 Jun 2026 16:57:09 +0100
In-Reply-To: <1a3cabf4-b125-abd1-ac52-a45007cc9103@crashcourse.ca>
References: <1a3cabf4-b125-abd1-ac52-a45007cc9103@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 15:57:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9665

On Tue, 2026-06-09 at 11:37 -0400, Robert P. J. Day via lists.yoctoproject.=
org wrote:
>=20
> i'm curious about the content of this section:
>=20
> https://docs.yoctoproject.org/dev-manual/new-recipe.html#post-installatio=
n-scripts
>=20
> =C2=A0 let's start with the first sentence:
>=20
> "Post-installation scripts run immediately after installing a package
> on the target or during image creation when a package is included in
> an image."
>=20
> =C2=A0 my understanding until now is that scripts defined with
> "pkg_postinst" can run at one of two times:
>=20
> =C2=A0 1) on the build host when a package is installed in the image, or
> =C2=A0 2) on the target *during first boot*
>=20
> that first sentence suggests it can be run "after installing a package
> on the target". that doesn't sound right, is that supposed to mean at
> first boot? it seems confusing.

The sentence is correct and post install scripts can be run after
installing a package on target. You're missing a "3) a package is
installed on a target".

> =C2=A0 next, that entire section makes no mention of the use of checking
> the "$D" variable, which is still widely used to check the context of
> the execution of that routine (on-host versus on-target).
>=20
> =C2=A0 consider a fairly straightforward example from the alsa-state.bb
> recipe:
>=20
> =C2=A0 pkg_postinst:${PN}() {
> =C2=A0=C2=A0=C2=A0 if test -z "$D"
> =C2=A0=C2=A0=C2=A0 then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test -x ${sbindir}/alsactl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${sbindir}/alsactl -g -f ${loc=
alstatedir}/lib/alsa/asound.state restore
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0=C2=A0=C2=A0 fi
> =C2=A0 }
>=20
> this is clearly(?) meant to run only at first boot as the entire body
> of the function is surrounded by the test for empty $D, so this one's
> easy.
>=20
> =C2=A0 (side question: should that routine simply have used
> pkg_postinst_ontarget? would that have been exactly equivalent?)
>=20
> a somewhat stranger example is from keymaps_1.0.bb:
>=20
> =C2=A0 PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATU=
RES','systemd sysvinit','systemd-systemctl-native','',d)}"
> =C2=A0 pkg_postinst:${PN} () {
> =C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES','systemd sys=
vinit','true','false',d)}; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "$D" ]; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OPTS=3D"--root=3D$D"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 systemctl $OPTS mask keymap.service
> =C2=A0=C2=A0=C2=A0 fi
> =C2=A0 }
>=20
> this one confuses me since the test for a non-zero $D surrounds only
> *part* of the function, suggesting it's possible to run on the target
> at first boot, but surely the bb library functions are not available
> at that time, are they?=C2=A0 i'm not sure how to interpret that one.

The package needs to be installable from a package feed, or built into
an image, so the code handles both cases.

Cheers,

Richard

