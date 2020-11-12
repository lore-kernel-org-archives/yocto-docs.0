Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.13433.1605225338540497540
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 15:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nZssjLqC;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id f23so10721560ejk.2
        for <docs@lists.yoctoproject.org>; Thu, 12 Nov 2020 15:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=daCKGNOosl55YU01/61ppz0bKOO24hJOUuHVO0Stk4k=;
        b=nZssjLqC0MII6ypG6w341ZoUkofpL4PQAZx4UMPXeKI5CAGoUvgB+TTYGTOctKyFk9
         UPIufYwMsBZMKY4nYso1Y630C2F9x3c3ZQDsP2kJI1IVAQjZxdrDygXJN27jcpRcml3q
         khYPm4R/mSPtnytUpQP+JYFA82qLv2D/UqXAfo1fUvXZvJTrVGa6KS5ZMTzIF8IbtDkk
         r9XjFF9Opv8n1DfNixp3SHZpToa+tHPJt4FIkQUjVAcaPHYC5TU7uMJPAMw2Xm3baf9P
         YmchrY5pY7wBjXprBEabxRvGA7JSPHmR/NgjUi5hcLzf6t//F4GA1cJkDQp7BxrrIJ5p
         y47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=daCKGNOosl55YU01/61ppz0bKOO24hJOUuHVO0Stk4k=;
        b=LWD6uWdilPX7313DtnGSTQKcst/2mfLsa0AIzg8eypXJPr+0Vb8Gs56NWFctrFchy8
         JJ6M1mFydtNOw5wcoibaaYuDYzHzpkfd5nSZDDhR7GVh7/q/ZOn8cnUiyqbeJYJl3hsj
         DSJxRaBe0fpnHC86toYTO/fVBTL+lPBtHSZHAjTiwgO7bgcWmZRZkQacDq6S22nEbeX0
         DrtCKVxJR9OGYb5OezXwIVadDLMXJ6VsxejGmoJd9Wbz1kBFDMKVRIwPE/vBwgMP6eu0
         FqLVDqQyCSGFPD+St+wTaIoDCkkpuq5mAmJ8nFtvTL9Bo7x2ng6olg1DifQ7dTwwG8za
         b96Q==
X-Gm-Message-State: AOAM5319fyeoPZZH84ZjvSLDM/5AggWNf938tPP+6U3wMfy3Qr3uyfde
	MbNJ/o7sRhb1kbEDuAJv3WeiIEhb/mxbA9U2iZhxdw==
X-Google-Smtp-Source: ABdhPJwTGUNOL5JVqE6czxy82sOxZjn69gP93fU5PLrwyccB2GAM6LQW8OWDB/U4hPARcIB1JyIsnQeXORDR+CQuDaA=
X-Received: by 2002:a17:906:7a11:: with SMTP id d17mr1757408ejo.153.1605225336911;
 Thu, 12 Nov 2020 15:55:36 -0800 (PST)
MIME-Version: 1.0
References: <CAP71WjwQv0xcp02tgARbHtbJ4=ucSFKBy3MVdEdBL4f=vonZww@mail.gmail.com>
 <CAP71WjzYV70G_aW9kqkhuqzzZBAMHt4um2ocNL=6hrHCZGBLOQ@mail.gmail.com> <CAP71WjwF8V7EJs=QnJzGW3iLBs2h7-zBwuvnn-TM+tiez8Or+A@mail.gmail.com>
In-Reply-To: <CAP71WjwF8V7EJs=QnJzGW3iLBs2h7-zBwuvnn-TM+tiez8Or+A@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 12 Nov 2020 13:55:26 -1000
Message-ID: <CAOSpxdZd7YPi=8oZbTqL=ZUg8dOfbjRChBxvdEdrpd5mL_PwUA@mail.gmail.com>
Subject: Re: Sphinx for Dunfell
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000fdd3b005b3f1a58a"

--000000000000fdd3b005b3f1a58a
Content-Type: text/plain; charset="UTF-8"

I'm definitely ok with it!

I'm getting ready to do a dunfell release sometime in the next two to three
weeks, so perhaps we should make the switch immediately afterwards. Unless
you'd like to live dangerously and try to get it out now :-)

Steve

On Thu, Nov 12, 2020, 1:45 PM Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> Steve, Richard, Quentin,
>
> On Tue, Oct 13, 2020 at 9:41 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > hey,
> >
> > Doing the same exercise for the bitbake manual, here are the '/doc/'
> > commits in 3.1 vs 3.2
> >
> > git log --oneline b94dec477a8d48ebceec91952ba290798c56c1f5..origin/1.46
> -- doc/
> > ====
> > 324aaa7f bitbake-user-manual-metadata.xml: fix a minor error
> > f92e19a3 doc: More explanation to tasks that recursively depend on
> themselves
> > e4695176 doc: Clarify how task dependencies relate to RDEPENDS
> > 25c5c79b user manual: properly tag content as <replaceable>
> > be367887 docs: delete reference to obsolete recipe-depends.dot
> >
> > git log --oneline
> > b94dec477a8d48ebceec91952ba290798c56c1f5..origin/master -- doc/
> > ====
> > a7c47f1e sphinx: rename Makefile.sphinx
> > 427721d8 sphinx: remove DocBook files
> > d52190ea docs: static: theme_overrides.css: fix responsive design on
> > <640px screens
> > 9ae5cce7 docs: sphinx: report errors when dependencies are not met
> > ec4c481a docs: update README file after migrationg to Sphinx
> > c87cc35a docs: sphinx: replace special quotes with double quotes
> > ebdeef2c docs: ref-variables: add links to terms in glossary
> > 29081375 bitbake-user-manual: fix bad links
> > a0f37789 sphinx: theme_override: Use bold for emphasis text
> > cbc5ca48 sphinx: theme_override: properly set font for verbatim text
> > 08b1ae23 sphinx: remove leading '/'
> > 99ba6fe9 sphinx: update style for important, caution and warnings
> > d99760cc sphinx: last manual round of fixes/improvements
> > 4f94633a sphinx: bitbake-user-manual: insert additional blank line after
> title
> > 63adcaa5 sphinx: add releases page
> > 3e940d93 sphinx: conf: enable extlinks extension
> > 9921c652 sphinx: index: move the boilerplate at the end of the page
> > 4e461224 sphinx: add SPDX headers
> > cb19159c sphinx: Enhance the sphinx experience/nagivation with:
> > 10a54678 sphinx: tweak html output a bit
> > 219b2348 sphinx: Makefile.sphinx: add clean and publish targets
> > 35fdc185 sphinx: fixes all remaining warnings
> > e11d2dd1 sphinx: fix links inside notes
> > 57300955 sphinx: fixup for links
> > fa304c01 sphinx: override theme CSS
> > 29af1cd2 sphinx: switch to readthedocs theme
> > e8359fd8 sphinx: bitbake-user-manual: use builtin sphinx glossary
> > 6bf6c8d6 sphinx: initial sphinx support
> > 84ccba0f sphinx: add initial build infrastructure
> > 44b57216 bitbake-user-manual: update perforce fetcher docs
> > 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
> > 7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST
> example
> > 06b5cf0a bitbake-user-manual-metadata.xml: fix a minor error
> > c92a266c doc: More explanation to tasks that recursively depend on
> themselves
> > caf42243 doc: Clarify how task dependencies relate to RDEPENDS
> > 647c13d4 user manual: properly tag content as <replaceable>
> > 2effbb6e docs: delete reference to obsolete recipe-depends.dot
> >
> > which indicates the following commits exist in 3.2 and not in 3.1
> > (again, I am filtering out sphinx changes):
> >
> > 44b57216 bitbake-user-manual: update perforce fetcher docs
> > 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
> > 7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST
> example
> >
> > Out of these three changes, I think only:
> > 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
> >
> > Should be backported to 1.46 branch since it applies to 3.1, the other
> > 2 changes are only for 3.2. To bring Sphinx docs into 1.46 branch, I
> > could import the Sphinx files from master branch, and 'undo' these 2
> > commits.
>
> I finally came back to this dunfell backport.. I've done it, at least
> for bitbake, since it was easier. If you are ok with the approach, i
> will do it for yocto-docs as well.
>
> I pushed a branch with 3 patches to bring sphinx into bitbake 1.46
> branch, it's here:
> https://git.openembedded.org/bitbake/log/?h=sphinx
>
> This branch has the following commits:
>
> Nicolas Dechesne (3):
>       sphinx: import sphinx docs
>       sphinx: undo (bitbake-user-manual: Remove TERM from
> BB_HASHBASE_WHITELIST example)
>       sphinx: partial undo (bitbake-user-manual: update perforce fetcher
> docs)
>
> I can't really send this branch as inline patches, since the first
> patch is huge (it contains the whole Sphinx files and the removal of
> docbook..).
> we could potentially squash them all, but I thought it was better to
> better keep track of the thought process..
>
> Consider this as RFC. If you are ok with it, i will prepare a similar
> branch for yocto-docs, and then we can merge both branches
> simultaneously. It will impact the next dunfell release obviously.. so
> we should plan accordingly.
>
> >
> > cheers
> > nico
> >
> > On Mon, Oct 12, 2020 at 2:35 PM Nicolas Dechesne
> > <nicolas.dechesne@linaro.org> wrote:
> > >
> > > hi!
> > >
> > > The dunfell vs gatesgarth documentation are very similar (at least for
> > > yocto-docs, I haven't checked bitbake docs yet). I believe the right
> > > thing to do is to backport the whole Sphinx documentation into dunfell
> > > for the 3.1 next release. The net benefit is that it will be much
> > > easier to backport from gatesgarth and next branches into the current
> > > LTS, which we intend to support for quite a while.
> > >
> > > Here are the "relevant" commits in yocto-docs in each branch so far.
> > > Note that I have removed all commits about SPDX headers since we want
> > > these patches for sure, all non related commits (such as a few
> > > .gitignore changes) and the test manual since it's new in 3.2.
> > >
> > > So what remains is:
> > >
> > > Dunfell
> > > -------
> > > 1a69e2c02 Documenation: Prepared for the 3.1.3 release
> > > 17cc71a8f Documenation: Prepared for the 3.1.2 release
> > > bd140f0f9 Documentation: Add 3.1.1 version updates missing from
> previous commit
> > > 069c27574 Documenation: Prepared for the 3.1.1 release
> > > 98687310b ref-manual: delete long-unused comments in variable glossary
> > > 2deac02f2 ref-manual: Remove long-dead PACKAGE_GROUP variable
> > > 7c4d45e50 ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
> > > 5edeb02f5 ref-manual: IMAGE_TYPES, add tar.zst, delete elf
> > > e3a746396 ref-manual: fix excessive command indentation
> > >
> > > Master
> > > -------
> > > cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
> > > 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
> > > 3aeca3b34 ref-manual: Add documentation for kernel-fitimage
> > > 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
> > > bootimg-efi
> > > 08e25f2b2 ref-system-requirements: update supported hosts lists
> > > afc290e85 virtual/libgbm is the provider of gbm.pc
> > > e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
> > > for other distros
> > > 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
> > > mesa-dri-devel
> > > 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
> > > recent changes
> > > c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
> > > a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa
> check
> > > afec5770a ref-manual: delete long-unused comments in variable glossary
> > > 8e5469aad ref-manual: Remove long-dead PACKAGE_GROUP variable
> > > d694ff63f ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
> > > 7706a240d ref-manual: IMAGE_TYPES, add tar.zst, delete elf
> > > a95b49eef ref-manual: fix excessive command indentation
> > >
> > > Which clearly indicates that the list of differences in yocto-docs
> > > between 3.1 and 3.2 is down to:
> > >
> > > cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
> > > 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
> > > 3aeca3b34 ref-manual: Add documentation for kernel-fitimage
> > > 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
> > > bootimg-efi
> > > 08e25f2b2 ref-system-requirements: update supported hosts lists
> > > afc290e85 virtual/libgbm is the provider of gbm.pc
> > > e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
> > > for other distros
> > > 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
> > > mesa-dri-devel
> > > 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
> > > recent changes
> > > c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
> > > a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa
> check
> > >
> > > I believe many (if not all??) of these patches are candidates for
> > > dunfell. If that was the case that would make the migration to sphinx
> > > into dunfell straight-forward..
> > >
> > > Otherwise, what I can propose is to 'import' the sphinx files from the
> > > current master branch and 'undo' what's not needed for dunfell.
> > >
> > > Steve, Richard: can you have a quick look at the list of patches
> > > above, and tell us which one should *not* be merged in dunfell?
> > >
> > > Note: I have a sphinx/dunfell branch already with an initial 'import'
> > > and a few changes like each history.rst file.
> > >
> > > thanks
> > > nico
>

--000000000000fdd3b005b3f1a58a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I&#39;m definitely ok with it!<div dir=3D"auto"><br>=
</div><div dir=3D"auto">I&#39;m getting ready to do a dunfell release somet=
ime in the next two to three weeks, so perhaps we should make the switch im=
mediately afterwards. Unless you&#39;d like to live dangerously and try to =
get it out now :-)</div><br>Steve</div><div dir=3D"auto"><br><div class=3D"=
gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov=
 12, 2020, 1:45 PM Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@=
linaro.org" target=3D"_blank" rel=3D"noreferrer">nicolas.dechesne@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Steve, Richard, Qu=
entin,<br>
<br>
On Tue, Oct 13, 2020 at 9:41 AM Nicolas Dechesne<br>
&lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; hey,<br>
&gt;<br>
&gt; Doing the same exercise for the bitbake manual, here are the &#39;/doc=
/&#39;<br>
&gt; commits in 3.1 vs 3.2<br>
&gt;<br>
&gt; git log --oneline b94dec477a8d48ebceec91952ba290798c56c1f5..origin/1.4=
6 -- doc/<br>
&gt; =3D=3D=3D=3D<br>
&gt; 324aaa7f bitbake-user-manual-metadata.xml: fix a minor error<br>
&gt; f92e19a3 doc: More explanation to tasks that recursively depend on the=
mselves<br>
&gt; e4695176 doc: Clarify how task dependencies relate to RDEPENDS<br>
&gt; 25c5c79b user manual: properly tag content as &lt;replaceable&gt;<br>
&gt; be367887 docs: delete reference to obsolete recipe-depends.dot<br>
&gt;<br>
&gt; git log --oneline<br>
&gt; b94dec477a8d48ebceec91952ba290798c56c1f5..origin/master -- doc/<br>
&gt; =3D=3D=3D=3D<br>
&gt; a7c47f1e sphinx: rename Makefile.sphinx<br>
&gt; 427721d8 sphinx: remove DocBook files<br>
&gt; d52190ea docs: static: theme_overrides.css: fix responsive design on<b=
r>
&gt; &lt;640px screens<br>
&gt; 9ae5cce7 docs: sphinx: report errors when dependencies are not met<br>
&gt; ec4c481a docs: update README file after migrationg to Sphinx<br>
&gt; c87cc35a docs: sphinx: replace special quotes with double quotes<br>
&gt; ebdeef2c docs: ref-variables: add links to terms in glossary<br>
&gt; 29081375 bitbake-user-manual: fix bad links<br>
&gt; a0f37789 sphinx: theme_override: Use bold for emphasis text<br>
&gt; cbc5ca48 sphinx: theme_override: properly set font for verbatim text<b=
r>
&gt; 08b1ae23 sphinx: remove leading &#39;/&#39;<br>
&gt; 99ba6fe9 sphinx: update style for important, caution and warnings<br>
&gt; d99760cc sphinx: last manual round of fixes/improvements<br>
&gt; 4f94633a sphinx: bitbake-user-manual: insert additional blank line aft=
er title<br>
&gt; 63adcaa5 sphinx: add releases page<br>
&gt; 3e940d93 sphinx: conf: enable extlinks extension<br>
&gt; 9921c652 sphinx: index: move the boilerplate at the end of the page<br=
>
&gt; 4e461224 sphinx: add SPDX headers<br>
&gt; cb19159c sphinx: Enhance the sphinx experience/nagivation with:<br>
&gt; 10a54678 sphinx: tweak html output a bit<br>
&gt; 219b2348 sphinx: Makefile.sphinx: add clean and publish targets<br>
&gt; 35fdc185 sphinx: fixes all remaining warnings<br>
&gt; e11d2dd1 sphinx: fix links inside notes<br>
&gt; 57300955 sphinx: fixup for links<br>
&gt; fa304c01 sphinx: override theme CSS<br>
&gt; 29af1cd2 sphinx: switch to readthedocs theme<br>
&gt; e8359fd8 sphinx: bitbake-user-manual: use builtin sphinx glossary<br>
&gt; 6bf6c8d6 sphinx: initial sphinx support<br>
&gt; 84ccba0f sphinx: add initial build infrastructure<br>
&gt; 44b57216 bitbake-user-manual: update perforce fetcher docs<br>
&gt; 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC<br>
&gt; 7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST e=
xample<br>
&gt; 06b5cf0a bitbake-user-manual-metadata.xml: fix a minor error<br>
&gt; c92a266c doc: More explanation to tasks that recursively depend on the=
mselves<br>
&gt; caf42243 doc: Clarify how task dependencies relate to RDEPENDS<br>
&gt; 647c13d4 user manual: properly tag content as &lt;replaceable&gt;<br>
&gt; 2effbb6e docs: delete reference to obsolete recipe-depends.dot<br>
&gt;<br>
&gt; which indicates the following commits exist in 3.2 and not in 3.1<br>
&gt; (again, I am filtering out sphinx changes):<br>
&gt;<br>
&gt; 44b57216 bitbake-user-manual: update perforce fetcher docs<br>
&gt; 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC<br>
&gt; 7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST e=
xample<br>
&gt;<br>
&gt; Out of these three changes, I think only:<br>
&gt; 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC<br>
&gt;<br>
&gt; Should be backported to 1.46 branch since it applies to 3.1, the other=
<br>
&gt; 2 changes are only for 3.2. To bring Sphinx docs into 1.46 branch, I<b=
r>
&gt; could import the Sphinx files from master branch, and &#39;undo&#39; t=
hese 2<br>
&gt; commits.<br>
<br>
I finally came back to this dunfell backport.. I&#39;ve done it, at least<b=
r>
for bitbake, since it was easier. If you are ok with the approach, i<br>
will do it for yocto-docs as well.<br>
<br>
I pushed a branch with 3 patches to bring sphinx into bitbake 1.46<br>
branch, it&#39;s here:<br>
<a href=3D"https://git.openembedded.org/bitbake/log/?h=3Dsphinx" rel=3D"nor=
eferrer noreferrer noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/bitbake/log/?h=3Dsphinx</a><br>
<br>
This branch has the following commits:<br>
<br>
Nicolas Dechesne (3):<br>
=C2=A0 =C2=A0 =C2=A0 sphinx: import sphinx docs<br>
=C2=A0 =C2=A0 =C2=A0 sphinx: undo (bitbake-user-manual: Remove TERM from<br=
>
BB_HASHBASE_WHITELIST example)<br>
=C2=A0 =C2=A0 =C2=A0 sphinx: partial undo (bitbake-user-manual: update perf=
orce fetcher docs)<br>
<br>
I can&#39;t really send this branch as inline patches, since the first<br>
patch is huge (it contains the whole Sphinx files and the removal of<br>
docbook..).<br>
we could potentially squash them all, but I thought it was better to<br>
better keep track of the thought process..<br>
<br>
Consider this as RFC. If you are ok with it, i will prepare a similar<br>
branch for yocto-docs, and then we can merge both branches<br>
simultaneously. It will impact the next dunfell release obviously.. so<br>
we should plan accordingly.<br>
<br>
&gt;<br>
&gt; cheers<br>
&gt; nico<br>
&gt;<br>
&gt; On Mon, Oct 12, 2020 at 2:35 PM Nicolas Dechesne<br>
&gt; &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; hi!<br>
&gt; &gt;<br>
&gt; &gt; The dunfell vs gatesgarth documentation are very similar (at leas=
t for<br>
&gt; &gt; yocto-docs, I haven&#39;t checked bitbake docs yet). I believe th=
e right<br>
&gt; &gt; thing to do is to backport the whole Sphinx documentation into du=
nfell<br>
&gt; &gt; for the 3.1 next release. The net benefit is that it will be much=
<br>
&gt; &gt; easier to backport from gatesgarth and next branches into the cur=
rent<br>
&gt; &gt; LTS, which we intend to support for quite a while.<br>
&gt; &gt;<br>
&gt; &gt; Here are the &quot;relevant&quot; commits in yocto-docs in each b=
ranch so far.<br>
&gt; &gt; Note that I have removed all commits about SPDX headers since we =
want<br>
&gt; &gt; these patches for sure, all non related commits (such as a few<br=
>
&gt; &gt; .gitignore changes) and the test manual since it&#39;s new in 3.2=
.<br>
&gt; &gt;<br>
&gt; &gt; So what remains is:<br>
&gt; &gt;<br>
&gt; &gt; Dunfell<br>
&gt; &gt; -------<br>
&gt; &gt; 1a69e2c02 Documenation: Prepared for the 3.1.3 release<br>
&gt; &gt; 17cc71a8f Documenation: Prepared for the 3.1.2 release<br>
&gt; &gt; bd140f0f9 Documentation: Add 3.1.1 version updates missing from p=
revious commit<br>
&gt; &gt; 069c27574 Documenation: Prepared for the 3.1.1 release<br>
&gt; &gt; 98687310b ref-manual: delete long-unused comments in variable glo=
ssary<br>
&gt; &gt; 2deac02f2 ref-manual: Remove long-dead PACKAGE_GROUP variable<br>
&gt; &gt; 7c4d45e50 ref-manual: typo &quot;SSTATE_MIRROR&quot; -&gt; &quot;=
SSTATE_MIRRORS&quot;<br>
&gt; &gt; 5edeb02f5 ref-manual: IMAGE_TYPES, add tar.zst, delete elf<br>
&gt; &gt; e3a746396 ref-manual: fix excessive command indentation<br>
&gt; &gt;<br>
&gt; &gt; Master<br>
&gt; &gt; -------<br>
&gt; &gt; cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc=
<br>
&gt; &gt; 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10<=
br>
&gt; &gt; 3aeca3b34 ref-manual: Add documentation for kernel-fitimage<br>
&gt; &gt; 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES suppo=
rt in<br>
&gt; &gt; bootimg-efi<br>
&gt; &gt; 08e25f2b2 ref-system-requirements: update supported hosts lists<b=
r>
&gt; &gt; afc290e85 virtual/libgbm is the provider of gbm.pc<br>
&gt; &gt; e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include=
 mesa<br>
&gt; &gt; for other distros<br>
&gt; &gt; 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to in=
clude<br>
&gt; &gt; mesa-dri-devel<br>
&gt; &gt; 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to matc=
h<br>
&gt; &gt; recent changes<br>
&gt; &gt; c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation<br>
&gt; &gt; a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip =
qa check<br>
&gt; &gt; afec5770a ref-manual: delete long-unused comments in variable glo=
ssary<br>
&gt; &gt; 8e5469aad ref-manual: Remove long-dead PACKAGE_GROUP variable<br>
&gt; &gt; d694ff63f ref-manual: typo &quot;SSTATE_MIRROR&quot; -&gt; &quot;=
SSTATE_MIRRORS&quot;<br>
&gt; &gt; 7706a240d ref-manual: IMAGE_TYPES, add tar.zst, delete elf<br>
&gt; &gt; a95b49eef ref-manual: fix excessive command indentation<br>
&gt; &gt;<br>
&gt; &gt; Which clearly indicates that the list of differences in yocto-doc=
s<br>
&gt; &gt; between 3.1 and 3.2 is down to:<br>
&gt; &gt;<br>
&gt; &gt; cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc=
<br>
&gt; &gt; 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10<=
br>
&gt; &gt; 3aeca3b34 ref-manual: Add documentation for kernel-fitimage<br>
&gt; &gt; 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES suppo=
rt in<br>
&gt; &gt; bootimg-efi<br>
&gt; &gt; 08e25f2b2 ref-system-requirements: update supported hosts lists<b=
r>
&gt; &gt; afc290e85 virtual/libgbm is the provider of gbm.pc<br>
&gt; &gt; e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include=
 mesa<br>
&gt; &gt; for other distros<br>
&gt; &gt; 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to in=
clude<br>
&gt; &gt; mesa-dri-devel<br>
&gt; &gt; 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to matc=
h<br>
&gt; &gt; recent changes<br>
&gt; &gt; c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation<br>
&gt; &gt; a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip =
qa check<br>
&gt; &gt;<br>
&gt; &gt; I believe many (if not all??) of these patches are candidates for=
<br>
&gt; &gt; dunfell. If that was the case that would make the migration to sp=
hinx<br>
&gt; &gt; into dunfell straight-forward..<br>
&gt; &gt;<br>
&gt; &gt; Otherwise, what I can propose is to &#39;import&#39; the sphinx f=
iles from the<br>
&gt; &gt; current master branch and &#39;undo&#39; what&#39;s not needed fo=
r dunfell.<br>
&gt; &gt;<br>
&gt; &gt; Steve, Richard: can you have a quick look at the list of patches<=
br>
&gt; &gt; above, and tell us which one should *not* be merged in dunfell?<b=
r>
&gt; &gt;<br>
&gt; &gt; Note: I have a sphinx/dunfell branch already with an initial &#39=
;import&#39;<br>
&gt; &gt; and a few changes like each history.rst file.<br>
&gt; &gt;<br>
&gt; &gt; thanks<br>
&gt; &gt; nico<br>
</blockquote></div></div></div>

--000000000000fdd3b005b3f1a58a--
