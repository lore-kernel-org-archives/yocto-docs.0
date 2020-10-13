Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.6720.1602574916165270837
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 00:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WHHG03ua;
 spf=pass (domain: linaro.org, ip: 209.85.219.172, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f172.google.com with SMTP id c3so15436118ybl.0
        for <docs@lists.yoctoproject.org>; Tue, 13 Oct 2020 00:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Vdgx4iqEi/QX2bILu+AlYJh+DIykgYdRQW+a8OFWK5g=;
        b=WHHG03ua5q7Y645ZcTZJCO/hU2TTXuN0FmrrHYDKnilabqfauI8HcoTozw82tZ1KHm
         0uaDc7JuRUHpW3y3U5AhYvKUwdyUu4mY3+lnrTSTrvctHqd3q0OJkSfdcEiXxloorYJ2
         ucnyv/Kw44q46BcH1tNFFDa9GTMrH4zFx5NeRDTpGQmlohsSeL67p8zLk7D+prDXbs59
         gsx+mVrSU6Vh0Ak1P0VWsddUvfZ06YH07iOkFebY+xAexQXH3y/U4twlV8jdKGYe43NH
         IVb9wqKUrBtTdJ9vC/NPL4eiYN7DX4r3XehCFnEzuwNwBN6KYgOz6UgQLdWCciY9Jjam
         ALQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Vdgx4iqEi/QX2bILu+AlYJh+DIykgYdRQW+a8OFWK5g=;
        b=TOugC6/Ng0FIIFuxSZLQ8yXFr8jnXuqR2HhHGSVkX1WhFRR5OxgUrF4L/gnBatuMo3
         zG7JlxBvUDiwyhKzCLFmBN6zndrAdI+jA9K+VbtBMG7/lxaK3UeBDZZc75412kJ9k9QR
         jh9TOZmjbnPtcGlO9rhM1Zm/NppQ+pPj6aaaUa4nSxjfaAA1dZP8Asw9na+t0UeEXzI4
         RE57fw4Y30yHSpWPZZL3oxvSinLmclj/HdSRiIT7lps6iVShSbmZeUhy8XrD3A2mnpTY
         kpZz1A9rf2uNPd6+UOKMbjJJ1/8BWGEr1AR0zD9UiUZDyXDB2d18YVAARTcblNBbfe3S
         xwuQ==
X-Gm-Message-State: AOAM532N9CvKB3v/QYqRI7I10wnN15aybpMHJmQWR4QkrDKXtd9SqUhS
	2SOP5BDyMLPrKJj9XlrjjbjAcuw9nhndoqIo1ylVmonmjZHmug5O
X-Google-Smtp-Source: ABdhPJzCD5w2EqF3BsP1C1C202Tjd+cGACmPIOS1DaDETyN8UANWUp0qOj+55PUYwONdlgLQOjckoTydtd5OorBOl5g=
X-Received: by 2002:a05:6902:50e:: with SMTP id x14mr37688702ybs.273.1602574914913;
 Tue, 13 Oct 2020 00:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjwQv0xcp02tgARbHtbJ4=ucSFKBy3MVdEdBL4f=vonZww@mail.gmail.com>
In-Reply-To: <CAP71WjwQv0xcp02tgARbHtbJ4=ucSFKBy3MVdEdBL4f=vonZww@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 13 Oct 2020 09:41:44 +0200
Message-ID: <CAP71WjzYV70G_aW9kqkhuqzzZBAMHt4um2ocNL=6hrHCZGBLOQ@mail.gmail.com>
Subject: Re: Sphinx for Dunfell
To: docs@lists.yoctoproject.org, Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"

hey,

Doing the same exercise for the bitbake manual, here are the '/doc/'
commits in 3.1 vs 3.2

git log --oneline b94dec477a8d48ebceec91952ba290798c56c1f5..origin/1.46 -- doc/
====
324aaa7f bitbake-user-manual-metadata.xml: fix a minor error
f92e19a3 doc: More explanation to tasks that recursively depend on themselves
e4695176 doc: Clarify how task dependencies relate to RDEPENDS
25c5c79b user manual: properly tag content as <replaceable>
be367887 docs: delete reference to obsolete recipe-depends.dot

git log --oneline
b94dec477a8d48ebceec91952ba290798c56c1f5..origin/master -- doc/
====
a7c47f1e sphinx: rename Makefile.sphinx
427721d8 sphinx: remove DocBook files
d52190ea docs: static: theme_overrides.css: fix responsive design on
<640px screens
9ae5cce7 docs: sphinx: report errors when dependencies are not met
ec4c481a docs: update README file after migrationg to Sphinx
c87cc35a docs: sphinx: replace special quotes with double quotes
ebdeef2c docs: ref-variables: add links to terms in glossary
29081375 bitbake-user-manual: fix bad links
a0f37789 sphinx: theme_override: Use bold for emphasis text
cbc5ca48 sphinx: theme_override: properly set font for verbatim text
08b1ae23 sphinx: remove leading '/'
99ba6fe9 sphinx: update style for important, caution and warnings
d99760cc sphinx: last manual round of fixes/improvements
4f94633a sphinx: bitbake-user-manual: insert additional blank line after title
63adcaa5 sphinx: add releases page
3e940d93 sphinx: conf: enable extlinks extension
9921c652 sphinx: index: move the boilerplate at the end of the page
4e461224 sphinx: add SPDX headers
cb19159c sphinx: Enhance the sphinx experience/nagivation with:
10a54678 sphinx: tweak html output a bit
219b2348 sphinx: Makefile.sphinx: add clean and publish targets
35fdc185 sphinx: fixes all remaining warnings
e11d2dd1 sphinx: fix links inside notes
57300955 sphinx: fixup for links
fa304c01 sphinx: override theme CSS
29af1cd2 sphinx: switch to readthedocs theme
e8359fd8 sphinx: bitbake-user-manual: use builtin sphinx glossary
6bf6c8d6 sphinx: initial sphinx support
84ccba0f sphinx: add initial build infrastructure
44b57216 bitbake-user-manual: update perforce fetcher docs
9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST example
06b5cf0a bitbake-user-manual-metadata.xml: fix a minor error
c92a266c doc: More explanation to tasks that recursively depend on themselves
caf42243 doc: Clarify how task dependencies relate to RDEPENDS
647c13d4 user manual: properly tag content as <replaceable>
2effbb6e docs: delete reference to obsolete recipe-depends.dot

which indicates the following commits exist in 3.2 and not in 3.1
(again, I am filtering out sphinx changes):

44b57216 bitbake-user-manual: update perforce fetcher docs
9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST example

Out of these three changes, I think only:
9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC

Should be backported to 1.46 branch since it applies to 3.1, the other
2 changes are only for 3.2. To bring Sphinx docs into 1.46 branch, I
could import the Sphinx files from master branch, and 'undo' these 2
commits.

cheers
nico

On Mon, Oct 12, 2020 at 2:35 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hi!
>
> The dunfell vs gatesgarth documentation are very similar (at least for
> yocto-docs, I haven't checked bitbake docs yet). I believe the right
> thing to do is to backport the whole Sphinx documentation into dunfell
> for the 3.1 next release. The net benefit is that it will be much
> easier to backport from gatesgarth and next branches into the current
> LTS, which we intend to support for quite a while.
>
> Here are the "relevant" commits in yocto-docs in each branch so far.
> Note that I have removed all commits about SPDX headers since we want
> these patches for sure, all non related commits (such as a few
> .gitignore changes) and the test manual since it's new in 3.2.
>
> So what remains is:
>
> Dunfell
> -------
> 1a69e2c02 Documenation: Prepared for the 3.1.3 release
> 17cc71a8f Documenation: Prepared for the 3.1.2 release
> bd140f0f9 Documentation: Add 3.1.1 version updates missing from previous commit
> 069c27574 Documenation: Prepared for the 3.1.1 release
> 98687310b ref-manual: delete long-unused comments in variable glossary
> 2deac02f2 ref-manual: Remove long-dead PACKAGE_GROUP variable
> 7c4d45e50 ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
> 5edeb02f5 ref-manual: IMAGE_TYPES, add tar.zst, delete elf
> e3a746396 ref-manual: fix excessive command indentation
>
> Master
> -------
> cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
> 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
> 3aeca3b34 ref-manual: Add documentation for kernel-fitimage
> 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
> bootimg-efi
> 08e25f2b2 ref-system-requirements: update supported hosts lists
> afc290e85 virtual/libgbm is the provider of gbm.pc
> e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
> for other distros
> 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
> mesa-dri-devel
> 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
> recent changes
> c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
> a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa check
> afec5770a ref-manual: delete long-unused comments in variable glossary
> 8e5469aad ref-manual: Remove long-dead PACKAGE_GROUP variable
> d694ff63f ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
> 7706a240d ref-manual: IMAGE_TYPES, add tar.zst, delete elf
> a95b49eef ref-manual: fix excessive command indentation
>
> Which clearly indicates that the list of differences in yocto-docs
> between 3.1 and 3.2 is down to:
>
> cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
> 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
> 3aeca3b34 ref-manual: Add documentation for kernel-fitimage
> 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
> bootimg-efi
> 08e25f2b2 ref-system-requirements: update supported hosts lists
> afc290e85 virtual/libgbm is the provider of gbm.pc
> e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
> for other distros
> 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
> mesa-dri-devel
> 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
> recent changes
> c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
> a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa check
>
> I believe many (if not all??) of these patches are candidates for
> dunfell. If that was the case that would make the migration to sphinx
> into dunfell straight-forward..
>
> Otherwise, what I can propose is to 'import' the sphinx files from the
> current master branch and 'undo' what's not needed for dunfell.
>
> Steve, Richard: can you have a quick look at the list of patches
> above, and tell us which one should *not* be merged in dunfell?
>
> Note: I have a sphinx/dunfell branch already with an initial 'import'
> and a few changes like each history.rst file.
>
> thanks
> nico
