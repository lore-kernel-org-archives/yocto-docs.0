Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D271061B37
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 11:36:30 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17934.1774956984309655127
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 04:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WLevGei8;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89cc797547fso59764066d6.2
        for <docs@lists.yoctoproject.org>; Tue, 31 Mar 2026 04:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774956983; cv=none;
        d=google.com; s=arc-20240605;
        b=FPlvSoTyDMZr8Cfj/aL5CaNevOLhxnugNtJxxnRVyhQljHS6G3LGcPKAgI0L6XflBP
         qhRjB5/+i7asP4p8okA4oWzihzwakN17594oezixR0yUTGOk0LOxoVuTFu67G7N/tI1f
         +T3Wmee5KlbqjcxBX0rwbe9J5t6sdICsEDak/+JRC5hH3p2hIpxc2M48POUeRXFidxoP
         JGMCT7BxYQ++fMGGdBNTkoCMKzwn19+LliNDEEHNKPqwpfajt885f/8QMGGG/GXD8R4C
         Ld/a16LQnGgwC7avhCNoN/SzgFhhhcntTmwBaUqSuVlzTyjmpSRn83WbSScYrxpUAnx/
         KoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h4sX3sfpRkPwhRvXB0shIqboIZjnXH4OsSAG1Uxbs04=;
        fh=gnZ1gfO3dKYvKF6ffaKwkNFfC4Wm9FNaHZXJzeQ5ebU=;
        b=f6FxmVGUNoOXFsXAz2QUxzMr6+pUrrFszQkEXPHXWih8Y/gItJXpH893XiHvZ1hA9a
         eXe/CIBb4ccQ8dlmU6biFUVLz4FTnmzMnzdlmwJjTGBF9sBKVv4FeSKHX5ZJ9zUDFH+Q
         1Oxyr+KNvwn/vDB+lhK3Y9glMNIm+ULxglnPuDSTM9hlL/Khxv6sXKI/txMXoLuRKvDA
         /eZl/IyJPvswvH5rVy6FdLe1cRDDh9Ngf5RmaEffCHtEqQZnqvxhO/xFHE7GC87PuxwI
         Gklo7ZOAXEx1QQbqPOXwzrF4IEoxf71Pz7szjtAEaU4y30G+QLN6N9tsI/IJYdgltQvh
         PQLg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774956983; x=1775561783; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h4sX3sfpRkPwhRvXB0shIqboIZjnXH4OsSAG1Uxbs04=;
        b=WLevGei89AGBWPs6QGB55wRcD/jrPfYoVu5Omo8eDbKjyR1y9+wIarxuVnFsR3VLni
         zMjxsAqkQ3y1nsRyWqNRUrRh0cAR0Vzoefk+v3E0+xBeMRAhxvNW0Ma+fW2nY3aTHBeQ
         LSja+NwinRIO+8sEUN9ADOyrKXL+4coyVSvSOx1EbwqaWVHnpbvVAg4RqY0bsWxUO4xA
         GvZ1eykeUPwNnDPMAR9+0QuM9dEnkVcR5EkJGepy+rCmTwuZRm9N5b/S/tpeVmzwL7LN
         kPtowDBkp42XGnJyVD75Zmin8R65WCVvOwVs76XcAMPRdhGCeY+gNXhryREr+QNpxiL8
         HznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956983; x=1775561783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4sX3sfpRkPwhRvXB0shIqboIZjnXH4OsSAG1Uxbs04=;
        b=EMRR6b/fK8lvQExD9LOi5xRUAlbFbohqrGcdwitq67ZclXeBpbDtfmJ62dvO3DnpLB
         syFHMLOOntHQw1iJ4aubpD8Lh7Sd/KjAT9BPLnCg2qLf8ybJpnm5bYPb+AYzDVVQkMui
         uPAlFouhx2eQydKwfj7hWCyEeUQaIwikI7BwIKX/X1W8YLJMD1wCOXK/rvzv+y0XoaEk
         l9ZxEwTx3GbePjYhhK0uGzfITrq/SpEhRKTfRSFthp9carlC3YKwJP2YKORgTpYWXP7h
         IAEQtu2BlEDR6yR0t0bjhcPvvF6D2awfKrYX9sgNdDewP4pNBFfLwH5gUQxswY+1vTZc
         kqhg==
X-Forwarded-Encrypted: i=1; AJvYcCWQOvzk+NlxPdCnc6zR+50RpRNSBqIKdy+LRD4IQVFL2mTyqnSuDr0uNuVS2YYtYwO4y37p@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YycjH+R0yAR9f9aWAU8uvsS+1h1T1eSaINq1B425GQXs2Rsp7Ns
	LAnPnXkL0sxo42MYubL5cdXYYGIlGw5SBHTC01nxu4cewJxfF/9Hkb7Nkbxj09bKyDK6ia2kc2P
	huGBexWw6XBFrLMduaYxolrjwCiCRJK0=
X-Gm-Gg: ATEYQzwcHyGEgG1wQUNwj/UZwyQmjyiQPdcgpeuED+U04mMPHdXnlnQgXaiMX7OxXzI
	3b4Q1s3k4rQlc9sGBWWV8l1dk1rfibEmXQOLUReFrBzhLiPBCkPzyAa6OhCNPfRqqO8LCgzZwSH
	NFSy06oWo1fu0PTQ51+hBgNL/C6ZdMikBSJN+SMdpl/pcyn8qXy/lEMU2nj435b6IGUU6ylSLRc
	oIN07SYH60xxAjT/W+PR/5L7+YNGcDDglOqEzR8jxTkaIL/xxfEGi+uD9uS4v6iR4skkh+t74Hx
	ISVhzwbYJLLQA4aamiZeBRytKOerazejdq1Y0Nc=
X-Received: by 2002:a05:6214:762:b0:89c:da2b:4903 with SMTP id
 6a1803df08f44-89ce8f073ebmr235849606d6.46.1774956983142; Tue, 31 Mar 2026
 04:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260331-docs-fixes-v1-0-45ee34341e72@bootlin.com>
 <20260331-docs-fixes-v1-1-45ee34341e72@bootlin.com> <6f743774-fe4b-4e9e-ba99-6ffe1d76a51b@cherry.de>
 <57bb4e5300a4be34f4cfddcf41d9a21b5b7bc579.camel@linuxfoundation.org>
In-Reply-To: <57bb4e5300a4be34f4cfddcf41d9a21b5b7bc579.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 31 Mar 2026 13:36:11 +0200
X-Gm-Features: AQROBzD7BDdp8nZW0GcSg9rSVctMZdWCHJRw1HyNjDT33VuDjC52_mM0psJlRMI
Message-ID: <CANNYZj9U3BYUv-cvQvmu7d=8O82Gdg-2GSon6vNJ71BMi6bKsg@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs] [PATCH 1/2] bitbake-setup: rename "abort"
 rebase conflict stragegy to "halt"
To: richard.purdie@linuxfoundation.org
Cc: quentin.schulz@cherry.de, antonin.godard@bootlin.com, 
	bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000078ce23064e50601a"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Mar 2026 11:36:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9150

--00000000000078ce23064e50601a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There=E2=80=99s a simpler rationale too: this follows =E2=80=98git rebase =
=E2=80=94abort=E2=80=99. If git
upstream finds a better word, we will follow. And I agree that all of the
proposed alternatives are less accurate.

Alex

On Tue 31. Mar 2026 at 12.43, Richard Purdie via lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Tue, 2026-03-31 at 11:00 +0200, Quentin Schulz via
> lists.yoctoproject.org wrote:
> > Hi Antonin,
> >
> > On 3/31/26 10:14 AM, Antonin Godard via lists.yoctoproject.org wrote:
> > > As per [1], do not use the word "abort" and replace it with "halt" fo=
r
> > > the rebase conflicts strategy. This is something we try to follow in
> our
> > > documentation.
> > >
> > > [1]: https://inclusivenaming.org/word-lists/tier-1/abort/
> > >
> > > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > > ---
> > >   bin/bitbake-setup                                                 |
> 8 ++++----
> > >   doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst |
> 6 +++---
> > >   doc/bitbake-user-manual/bitbake-user-manual-fetching.rst          |
> 2 +-
> > >   lib/bb/tests/setup.py                                             |
> 8 ++++----
> > >   4 files changed, 12 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/bin/bitbake-setup b/bin/bitbake-setup
> > > index b02cbc2b1c4..33cbefb4914 100755
> > > --- a/bin/bitbake-setup
> > > +++ b/bin/bitbake-setup
> > > @@ -167,7 +167,7 @@ def _get_remotes(r_remote):
> > >
> > >       return remotes
> > >
> > > -def checkout_layers(layers, confdir, layerdir, d,
> rebase_conflicts_strategy=3D'abort'):
> > > +def checkout_layers(layers, confdir, layerdir, d,
> rebase_conflicts_strategy=3D'halt'):
> > >       def _checkout_git_remote(r_remote, repodir,
> layers_fixed_revisions):
> > >           rev =3D r_remote['rev']
> > >           branch =3D r_remote.get('branch', None)
> > > @@ -458,7 +458,7 @@ def merge_overrides_into_sources(sources,
> overrides):
> > >               layers[k] =3D v
> > >       return layers
> > >
> > > -def update_build(config, confdir, setupdir, layerdir, d,
> update_bb_conf=3D"prompt", init_vscode=3DFalse,
> rebase_conflicts_strategy=3D'abort'):
> > > +def update_build(config, confdir, setupdir, layerdir, d,
> update_bb_conf=3D"prompt", init_vscode=3DFalse,
> rebase_conflicts_strategy=3D'halt'):
> > >       layer_config =3D
> merge_overrides_into_sources(config["data"]["sources"],
> config["source-overrides"]["sources"])
> > >       sources_fixed_revisions =3D checkout_layers(layer_config, confd=
ir,
> layerdir, d, rebase_conflicts_strategy=3Drebase_conflicts_strategy)
> > >       bitbake_config =3D config["bitbake-config"]
> > > @@ -1273,9 +1273,9 @@ def main():
> > >       parser_update =3D subparsers.add_parser('update', help=3D'Updat=
e a
> setup to be in sync with configuration')
> > >       add_setup_dir_arg(parser_update)
> > >       parser_update.add_argument('--update-bb-conf',
> choices=3D['prompt', 'yes', 'no'], default=3D'prompt', help=3D'Update bit=
bake
> configuration files (bblayers.conf, local.conf) (default: prompt)')
> > > -    parser_update.add_argument('--rebase-conflicts-strategy',
> choices=3D['abort', 'backup'], default=3D'abort',
> > > +    parser_update.add_argument('--rebase-conflicts-strategy',
> choices=3D['halt', 'backup'], default=3D'halt',
> > >                           help=3D"What to do when a layer repository =
has
> local modifications that prevent "
> > > -                             "an in-place update: 'abort' (default)
> aborts with an error message; "
> > > +                             "an in-place update: 'halt' (default)
> halts with an error message; "
> > >                                "'backup' renames the directory to a
> timestamped backup and re-clones from upstream.")
> > >       parser_update.set_defaults(func=3Dbuild_update)
> > >
> > > diff --git
> a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> > > index c22e19bd665..c7b73001404 100644
> > > --- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.r=
st
> > > +++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.r=
st
> > > @@ -458,9 +458,9 @@ In addition, the command can take the following
> arguments:
> > >      local modifications or commits that prevent an in-place update.
> Accepted
> > >      values are:
> > >
> > > -   -  ``abort`` (default): stop with an error message describing the
> problem.
> > > +   -  ``halt`` (default): stop with an error message describing the
> problem.
> > >         The repository is left in its previous state (the failed
> rebase is
> > > -      automatically aborted). The error message includes a hint to
> re-run with
> > > +      automatically halted). The error message includes a hint to
> re-run with
> >
> > This is not what halt means. Maybe 'reset' would be a better choice? Or
> > if you really want to follow the recommendations from that website, I
> > guess "cancel"?
>
> The trouble is none of these alternatives really match what abort
> means, reset and cancel do mean something different. "abandon" might be
> closer but still isn't right. "attempt" maybe? If we get too creative
> with this, users just won't understand what it means :(
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19290):
> https://lists.openembedded.org/g/bitbake-devel/message/19290
> Mute This Topic: https://lists.openembedded.org/mt/118593422/1686489
> Group Owner: bitbake-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/bitbake-devel/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000078ce23064e50601a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There=E2=80=99s a simpler rationale too: this follows =E2=
=80=98git rebase =E2=80=94abort=E2=80=99. If git upstream finds a better wo=
rd, we will follow. And I agree that all of the proposed alternatives are l=
ess accurate.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div>=
<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue 31. Mar 2026 at 12.43, Richard Purdie via <a hr=
ef=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;richard=
.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded.org">lin=
uxfoundation.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)">On Tue, 2026-03-31 at 11:00 +0200, Quentin Schulz via <a href=3D"http=
://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yocto=
project.org</a> wrote:<br>
&gt; Hi Antonin,<br>
&gt; <br>
&gt; On 3/31/26 10:14 AM, Antonin Godard via <a href=3D"http://lists.yoctop=
roject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a>=
 wrote:<br>
&gt; &gt; As per [1], do not use the word &quot;abort&quot; and replace it =
with &quot;halt&quot; for<br>
&gt; &gt; the rebase conflicts strategy. This is something we try to follow=
 in our<br>
&gt; &gt; documentation.<br>
&gt; &gt; <br>
&gt; &gt; [1]: <a href=3D"https://inclusivenaming.org/word-lists/tier-1/abo=
rt/" rel=3D"noreferrer" target=3D"_blank">https://inclusivenaming.org/word-=
lists/tier-1/abort/</a><br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godar=
d@bootlin.com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0 bin/bitbake-setup=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 8 ++++----<br>
&gt; &gt; =C2=A0 doc/bitbake-user-manual/bitbake-user-manual-environment-se=
tup.rst | 6 +++---<br>
&gt; &gt; =C2=A0 doc/bitbake-user-manual/bitbake-user-manual-fetching.rst=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-<br>
&gt; &gt; =C2=A0 lib/bb/tests/setup.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 8 ++++----<br>
&gt; &gt; =C2=A0 4 files changed, 12 insertions(+), 12 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/bin/bitbake-setup b/bin/bitbake-setup<br>
&gt; &gt; index b02cbc2b1c4..33cbefb4914 100755<br>
&gt; &gt; --- a/bin/bitbake-setup<br>
&gt; &gt; +++ b/bin/bitbake-setup<br>
&gt; &gt; @@ -167,7 +167,7 @@ def _get_remotes(r_remote):<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return remotes<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; -def checkout_layers(layers, confdir, layerdir, d, rebase_conflic=
ts_strategy=3D&#39;abort&#39;):<br>
&gt; &gt; +def checkout_layers(layers, confdir, layerdir, d, rebase_conflic=
ts_strategy=3D&#39;halt&#39;):<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def _checkout_git_remote(r_remote,=
 repodir, layers_fixed_revisions):<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rev =3D r_=
remote[&#39;rev&#39;]<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 branch =3D=
 r_remote.get(&#39;branch&#39;, None)<br>
&gt; &gt; @@ -458,7 +458,7 @@ def merge_overrides_into_sources(sources, ove=
rrides):<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 layers[k] =3D v<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return layers<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; -def update_build(config, confdir, setupdir, layerdir, d, update_=
bb_conf=3D&quot;prompt&quot;, init_vscode=3DFalse, rebase_conflicts_strateg=
y=3D&#39;abort&#39;):<br>
&gt; &gt; +def update_build(config, confdir, setupdir, layerdir, d, update_=
bb_conf=3D&quot;prompt&quot;, init_vscode=3DFalse, rebase_conflicts_strateg=
y=3D&#39;halt&#39;):<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 layer_config =3D merge_overrides_i=
nto_sources(config[&quot;data&quot;][&quot;sources&quot;], config[&quot;sou=
rce-overrides&quot;][&quot;sources&quot;])<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sources_fixed_revisions =3D checko=
ut_layers(layer_config, confdir, layerdir, d, rebase_conflicts_strategy=3Dr=
ebase_conflicts_strategy)<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake_config =3D config[&quot;bi=
tbake-config&quot;]<br>
&gt; &gt; @@ -1273,9 +1273,9 @@ def main():<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser_update =3D subparsers.add_p=
arser(&#39;update&#39;, help=3D&#39;Update a setup to be in sync with confi=
guration&#39;)<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add_setup_dir_arg(parser_update)<b=
r>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser_update.add_argument(&#39;--=
update-bb-conf&#39;, choices=3D[&#39;prompt&#39;, &#39;yes&#39;, &#39;no&#3=
9;], default=3D&#39;prompt&#39;, help=3D&#39;Update bitbake configuration f=
iles (bblayers.conf, local.conf) (default: prompt)&#39;)<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0 parser_update.add_argument(&#39;--rebase-conf=
licts-strategy&#39;, choices=3D[&#39;abort&#39;, &#39;backup&#39;], default=
=3D&#39;abort&#39;,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 parser_update.add_argument(&#39;--rebase-conf=
licts-strategy&#39;, choices=3D[&#39;halt&#39;, &#39;backup&#39;], default=
=3D&#39;halt&#39;,<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 help=3D&quot;What to do when a layer repository has local modi=
fications that prevent &quot;<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;an in-place update: &#39;abort&#39; (d=
efault) aborts with an error message; &quot;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;an in-place update: &#39;halt&#39; (de=
fault) halts with an error message; &quot;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;&#39;backup&#39; renames t=
he directory to a timestamped backup and re-clones from upstream.&quot;)<br=
>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser_update.set_defaults(func=3D=
build_update)<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environm=
ent-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-set=
up.rst<br>
&gt; &gt; index c22e19bd665..c7b73001404 100644<br>
&gt; &gt; --- a/doc/bitbake-user-manual/bitbake-user-manual-environment-set=
up.rst<br>
&gt; &gt; +++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-set=
up.rst<br>
&gt; &gt; @@ -458,9 +458,9 @@ In addition, the command can take the followi=
ng arguments:<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 local modifications or commits that prev=
ent an in-place update. Accepted<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 values are:<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; -=C2=A0=C2=A0 -=C2=A0 ``abort`` (default): stop with an error mes=
sage describing the problem.<br>
&gt; &gt; +=C2=A0=C2=A0 -=C2=A0 ``halt`` (default): stop with an error mess=
age describing the problem.<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The repository is left=
 in its previous state (the failed rebase is<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 automatically aborted). The error=
 message includes a hint to re-run with<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 automatically halted). The error =
message includes a hint to re-run with<br>
&gt; <br>
&gt; This is not what halt means. Maybe &#39;reset&#39; would be a better c=
hoice? Or <br>
&gt; if you really want to follow the recommendations from that website, I<=
br>
&gt; guess &quot;cancel&quot;?<br>
<br>
The trouble is none of these alternatives really match what abort<br>
means, reset and cancel do mean something different. &quot;abandon&quot; mi=
ght be<br>
closer but still isn&#39;t right. &quot;attempt&quot; maybe? If we get too =
creative<br>
with this, users just won&#39;t understand what it means :(<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#19290): <a href=3D"https://lists.openembedded.org/g/bit=
bake-devel/message/19290" rel=3D"noreferrer" target=3D"_blank">https://list=
s.openembedded.org/g/bitbake-devel/message/19290</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118593422/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118593422/1686489</a><br>
Group Owner: <a href=3D"mailto:bitbake-devel%2Bowner@lists.openembedded.org=
" target=3D"_blank">bitbake-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/bitbake-devel/unsu=
b" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/bi=
tbake-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"=
_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000078ce23064e50601a--

