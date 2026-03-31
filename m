Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726BD1061B26
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 10:43:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16977.1774953786728646703
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 03:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S9/lBHRF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b9144790dso3009439f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 31 Mar 2026 03:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774953785; x=1775558585; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IEvcWM7rYZmbniJsn9pfwraaDcTqrl+1QRa9ybk5bmc=;
        b=S9/lBHRF6h4gp+Y5mck88e4vjjP0GErku2xFWkWNk1tfX/ZpwobcOh6zGpDvyG5D0i
         aCrtJ9t8T7gLDQUdiDsgZkTqscyOHY35RKiFKHcCeWICLhm0DC52+kNM/G8ufQqcr9mF
         PlcZOwWxlxsTWKl0nBIOxSnSCkcGJJncXxFUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953785; x=1775558585;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEvcWM7rYZmbniJsn9pfwraaDcTqrl+1QRa9ybk5bmc=;
        b=e3+5kocHkUCDN3yTE5tt48BK0Od3na9eaoRqVAP3w5TTvvmHHrGqEr4sPDtrRUYwdo
         N6GnJdyKrAmsZ8LaSoeAAFT7+H9m5zzonswb7z4uLYXAZURZ59oIKjajQkUGPXvQgCTw
         RmNzBvDazUWZPpr+I6fnTCX9NrGYUfzzR/oaa4f5kTcFYN2UvhkVIucADI/8QCfygmHK
         GeTHYr2lAaj8jgXiUmReBy7jLEnrWkV/yhX7tR/cOQaqZYi/1EZmGf8/i9CPJTNAFshN
         H3H5HodCXvsbekrjmEoWfkDajKfR9Kr9+UA0nDmhq5Gs0RmHUGdwjz4PKJNBaeVPPPff
         AW7g==
X-Forwarded-Encrypted: i=1; AJvYcCVMQk2ROLoTqFGKBhIaz1xDx0LGrUJ4zC8LVQwSb8KMWBf9eBD67TwOU13hNZLsoT/T4Sn2@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzNPSoHHhY229iDAu8tuQheAwXtvK7iA4qbxRln/I5N3iW8x9uC
	cFEAX/Vb3f9SrmdLoyWAXtbYh6ZGIRg631RR+/pX6IU2xmqTUNqUUtiT2Ak/9pq5mFA=
X-Gm-Gg: ATEYQzxgwamzv3k21rSVNMpYoMGY6a77UqrNyAT8DAJByFn+a/ubuD1hflkWvsY0rwI
	AIzA7vVn+7Gxcalp7myQktemgv4hqVvSrzTykNWCWXtdvVE+IJHw+o/EchwGeexWUZgLO8ThOND
	CvsPh6VaMFHFbnLLxwhlycO7J0xhn9P0b/MGpvU5KTr4IMGr+sOcXR65Kw2qDdipyKsPc2pRPpp
	5qrApNhq2sZNJe4zM1TwbllaNO6T+gUJz3p/mJNXGEU2NOQ/Go+IxOKqRMKSDFP7iv9H52Oj7vr
	xy0RtIwGn/u/ixiqMtUuupHnn0O1fKbAOAs6CvtbEeZmJbJYB6RujCeLp9JZQOKWUPEBMDc2s9E
	MVl81hA5okQPlWqbhdaG/eAEgXd2HrRIMODJvh5Xd40uLxlS+Cf+hm4Bb7VacXeLAZ7MsjIIazk
	KDnCsHb87nlnRG7Rs3Ypp1QJ/H1U+wCppMQrj47flceY/QjYxI29scV0tYPNkc/+TNuK5gXKYAs
	u8iqXSYa02ANPM5
X-Received: by 2002:a5d:584b:0:b0:43b:492c:8349 with SMTP id ffacd0b85a97d-43b9e98140cmr27916741f8f.3.1774953784725;
        Tue, 31 Mar 2026 03:43:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e29c:9e31:f797:402b? ([2001:8b0:aba:5f3c:e29c:9e31:f797:402b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf90424fcsm21394454f8f.32.2026.03.31.03.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:43:03 -0700 (PDT)
Message-ID: <57bb4e5300a4be34f4cfddcf41d9a21b5b7bc579.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/2] bitbake-setup: rename "abort" rebase
 conflict stragegy to "halt"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, antonin.godard@bootlin.com, 
	bitbake-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Tue, 31 Mar 2026 11:43:03 +0100
In-Reply-To: <6f743774-fe4b-4e9e-ba99-6ffe1d76a51b@cherry.de>
References: <20260331-docs-fixes-v1-0-45ee34341e72@bootlin.com>
	 <20260331-docs-fixes-v1-1-45ee34341e72@bootlin.com>
	 <6f743774-fe4b-4e9e-ba99-6ffe1d76a51b@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Mar 2026 10:43:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9149

On Tue, 2026-03-31 at 11:00 +0200, Quentin Schulz via lists.yoctoproject.or=
g wrote:
> Hi Antonin,
>=20
> On 3/31/26 10:14 AM, Antonin Godard via lists.yoctoproject.org wrote:
> > As per [1], do not use the word "abort" and replace it with "halt" for
> > the rebase conflicts strategy. This is something we try to follow in ou=
r
> > documentation.
> >=20
> > [1]: https://inclusivenaming.org/word-lists/tier-1/abort/
> >=20
> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > ---
> > =C2=A0 bin/bitbake-setup=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 8 ++++----
> > =C2=A0 doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rs=
t | 6 +++---
> > =C2=A0 doc/bitbake-user-manual/bitbake-user-manual-fetching.rst=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0 lib/bb/tests/setup.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
8 ++++----
> > =C2=A0 4 files changed, 12 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/bin/bitbake-setup b/bin/bitbake-setup
> > index b02cbc2b1c4..33cbefb4914 100755
> > --- a/bin/bitbake-setup
> > +++ b/bin/bitbake-setup
> > @@ -167,7 +167,7 @@ def _get_remotes(r_remote):
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return remotes
> > =C2=A0=20
> > -def checkout_layers(layers, confdir, layerdir, d, rebase_conflicts_str=
ategy=3D'abort'):
> > +def checkout_layers(layers, confdir, layerdir, d, rebase_conflicts_str=
ategy=3D'halt'):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def _checkout_git_remote(r_remote, repod=
ir, layers_fixed_revisions):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rev =3D r_remote=
['rev']
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 branch =3D r_rem=
ote.get('branch', None)
> > @@ -458,7 +458,7 @@ def merge_overrides_into_sources(sources, overrides=
):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 layers[k] =3D v
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return layers
> > =C2=A0=20
> > -def update_build(config, confdir, setupdir, layerdir, d, update_bb_con=
f=3D"prompt", init_vscode=3DFalse, rebase_conflicts_strategy=3D'abort'):
> > +def update_build(config, confdir, setupdir, layerdir, d, update_bb_con=
f=3D"prompt", init_vscode=3DFalse, rebase_conflicts_strategy=3D'halt'):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 layer_config =3D merge_overrides_into_so=
urces(config["data"]["sources"], config["source-overrides"]["sources"])
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sources_fixed_revisions =3D checkout_lay=
ers(layer_config, confdir, layerdir, d, rebase_conflicts_strategy=3Drebase_=
conflicts_strategy)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake_config =3D config["bitbake-confi=
g"]
> > @@ -1273,9 +1273,9 @@ def main():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser_update =3D subparsers.add_parser(=
'update', help=3D'Update a setup to be in sync with configuration')
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add_setup_dir_arg(parser_update)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser_update.add_argument('--update-bb-=
conf', choices=3D['prompt', 'yes', 'no'], default=3D'prompt', help=3D'Updat=
e bitbake configuration files (bblayers.conf, local.conf) (default: prompt)=
')
> > -=C2=A0=C2=A0=C2=A0 parser_update.add_argument('--rebase-conflicts-stra=
tegy', choices=3D['abort', 'backup'], default=3D'abort',
> > +=C2=A0=C2=A0=C2=A0 parser_update.add_argument('--rebase-conflicts-stra=
tegy', choices=3D['halt', 'backup'], default=3D'halt',
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 help=3D"What to do when a layer repository has local modifications t=
hat prevent "
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "an in-place update: 'abort' (default) aborts with=
 an error message; "
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "an in-place update: 'halt' (default) halts with a=
n error message; "
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "'backup' renames the directory to a t=
imestamped backup and re-clones from upstream.")
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser_update.set_defaults(func=3Dbuild_=
update)
> > =C2=A0=20
> > diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-se=
tup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> > index c22e19bd665..c7b73001404 100644
> > --- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> > +++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> > @@ -458,9 +458,9 @@ In addition, the command can take the following arg=
uments:
> > =C2=A0=C2=A0=C2=A0=C2=A0 local modifications or commits that prevent an=
 in-place update. Accepted
> > =C2=A0=C2=A0=C2=A0=C2=A0 values are:
> > =C2=A0=20
> > -=C2=A0=C2=A0 -=C2=A0 ``abort`` (default): stop with an error message d=
escribing the problem.
> > +=C2=A0=C2=A0 -=C2=A0 ``halt`` (default): stop with an error message de=
scribing the problem.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The repository is left in it=
s previous state (the failed rebase is
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 automatically aborted). The error messa=
ge includes a hint to re-run with
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 automatically halted). The error messag=
e includes a hint to re-run with
>=20
> This is not what halt means. Maybe 'reset' would be a better choice? Or=
=20
> if you really want to follow the recommendations from that website, I
> guess "cancel"?

The trouble is none of these alternatives really match what abort
means, reset and cancel do mean something different. "abandon" might be
closer but still isn't right. "attempt" maybe? If we get too creative
with this, users just won't understand what it means :(

Cheers,

Richard


