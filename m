Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web09.13432.1605224747229472986
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 15:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jmgfgc5A;
 spf=pass (domain: linaro.org, ip: 209.85.219.179, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f179.google.com with SMTP id c18so7017786ybj.10
        for <docs@lists.yoctoproject.org>; Thu, 12 Nov 2020 15:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=M6x4tPf3pNbUbNRjuM8QflJ8BLET/0FLX+knYBdVR+s=;
        b=jmgfgc5AhgjWWT+tN2R3Ns6H2IwOw1TaPbRRyvp9T9a0rZRxHUycMz/PYgSGB48LLu
         E8F9IFJS83YbNGZ9JPhuMFDhmUIWfPBF2WZEgM577szDhUx0aPfnfx6JrIIawD84ZF+I
         0+7MUHMuS6vUAGUYV7lDW6qm5tFeaJZo8Jd0syJtxp99RMYwkLVsnPu2iKOzq9Gr69VE
         AgCpv72Dj/AjSnUkN7jwateN3QopksnY/zSmg73l5DV+xVfBwYXSJEv3fc63c3XbmM97
         z8RiegNIDVAt8++9rNG9XPDo6GQ88BVlpOkN+PJE76xI5z4Udrmu7Lm3UEysmJDwaLN+
         ArxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=M6x4tPf3pNbUbNRjuM8QflJ8BLET/0FLX+knYBdVR+s=;
        b=o0cl+nsIwNVoQb48VJUUMtBkbxYqWgMqK0Redoqf80lK3HjhXk6wSgDRHQT8+GDQVy
         HXfPUB4pQh/vg1+T+jLIRBaJHzA1/EmG7h1fMz0yTBEQxxrhoFr2cHA7zYwR0q1hvlBx
         A9TV7UL7yoWbWDlNa4SSMENv03ETDDxUFQjoUShfKyAM470+2gbllrpSXIz9E/XSPFMd
         IXkKIPLzxksrperdovz+BAiPGYJN2DiIWTxYQOnW2Z4sBWu7ptxhK7xhgHg0a2UT6h5g
         U1+P6oybaeL0SHr22z+c+FgOFKbxV9bikuJ3y6OsxmkG6R/16Y7eKoLhjwTkApIT6n0p
         V4rw==
X-Gm-Message-State: AOAM533gPY6nbd3gxi8F3wDMe76gitb7SsHYyduKrIf/uYMBANSjKO+w
	RXuxWNtbDgthgjEqIrSBoaanMVUucy0crs9MVGsD2uW3aAvQ6MQO
X-Google-Smtp-Source: ABdhPJxfUT2OvD0Kb5PkkM080RUTRBSPWp3OPWme3Dp+WXBCZcF2OOqjLETWqxG3aX9J5pJQ9oIHdJxgPDgowjho6eM=
X-Received: by 2002:a25:9b04:: with SMTP id y4mr2189781ybn.397.1605224745880;
 Thu, 12 Nov 2020 15:45:45 -0800 (PST)
MIME-Version: 1.0
References: <CAP71WjwQv0xcp02tgARbHtbJ4=ucSFKBy3MVdEdBL4f=vonZww@mail.gmail.com>
 <CAP71WjzYV70G_aW9kqkhuqzzZBAMHt4um2ocNL=6hrHCZGBLOQ@mail.gmail.com>
In-Reply-To: <CAP71WjzYV70G_aW9kqkhuqzzZBAMHt4um2ocNL=6hrHCZGBLOQ@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 13 Nov 2020 00:45:35 +0100
Message-ID: <CAP71WjwF8V7EJs=QnJzGW3iLBs2h7-zBwuvnn-TM+tiez8Or+A@mail.gmail.com>
Subject: Re: Sphinx for Dunfell
To: YP docs mailing list <docs@lists.yoctoproject.org>, Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"

Steve, Richard, Quentin,

On Tue, Oct 13, 2020 at 9:41 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hey,
>
> Doing the same exercise for the bitbake manual, here are the '/doc/'
> commits in 3.1 vs 3.2
>
> git log --oneline b94dec477a8d48ebceec91952ba290798c56c1f5..origin/1.46 -- doc/
> ====
> 324aaa7f bitbake-user-manual-metadata.xml: fix a minor error
> f92e19a3 doc: More explanation to tasks that recursively depend on themselves
> e4695176 doc: Clarify how task dependencies relate to RDEPENDS
> 25c5c79b user manual: properly tag content as <replaceable>
> be367887 docs: delete reference to obsolete recipe-depends.dot
>
> git log --oneline
> b94dec477a8d48ebceec91952ba290798c56c1f5..origin/master -- doc/
> ====
> a7c47f1e sphinx: rename Makefile.sphinx
> 427721d8 sphinx: remove DocBook files
> d52190ea docs: static: theme_overrides.css: fix responsive design on
> <640px screens
> 9ae5cce7 docs: sphinx: report errors when dependencies are not met
> ec4c481a docs: update README file after migrationg to Sphinx
> c87cc35a docs: sphinx: replace special quotes with double quotes
> ebdeef2c docs: ref-variables: add links to terms in glossary
> 29081375 bitbake-user-manual: fix bad links
> a0f37789 sphinx: theme_override: Use bold for emphasis text
> cbc5ca48 sphinx: theme_override: properly set font for verbatim text
> 08b1ae23 sphinx: remove leading '/'
> 99ba6fe9 sphinx: update style for important, caution and warnings
> d99760cc sphinx: last manual round of fixes/improvements
> 4f94633a sphinx: bitbake-user-manual: insert additional blank line after title
> 63adcaa5 sphinx: add releases page
> 3e940d93 sphinx: conf: enable extlinks extension
> 9921c652 sphinx: index: move the boilerplate at the end of the page
> 4e461224 sphinx: add SPDX headers
> cb19159c sphinx: Enhance the sphinx experience/nagivation with:
> 10a54678 sphinx: tweak html output a bit
> 219b2348 sphinx: Makefile.sphinx: add clean and publish targets
> 35fdc185 sphinx: fixes all remaining warnings
> e11d2dd1 sphinx: fix links inside notes
> 57300955 sphinx: fixup for links
> fa304c01 sphinx: override theme CSS
> 29af1cd2 sphinx: switch to readthedocs theme
> e8359fd8 sphinx: bitbake-user-manual: use builtin sphinx glossary
> 6bf6c8d6 sphinx: initial sphinx support
> 84ccba0f sphinx: add initial build infrastructure
> 44b57216 bitbake-user-manual: update perforce fetcher docs
> 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
> 7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST example
> 06b5cf0a bitbake-user-manual-metadata.xml: fix a minor error
> c92a266c doc: More explanation to tasks that recursively depend on themselves
> caf42243 doc: Clarify how task dependencies relate to RDEPENDS
> 647c13d4 user manual: properly tag content as <replaceable>
> 2effbb6e docs: delete reference to obsolete recipe-depends.dot
>
> which indicates the following commits exist in 3.2 and not in 3.1
> (again, I am filtering out sphinx changes):
>
> 44b57216 bitbake-user-manual: update perforce fetcher docs
> 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
> 7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST example
>
> Out of these three changes, I think only:
> 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
>
> Should be backported to 1.46 branch since it applies to 3.1, the other
> 2 changes are only for 3.2. To bring Sphinx docs into 1.46 branch, I
> could import the Sphinx files from master branch, and 'undo' these 2
> commits.

I finally came back to this dunfell backport.. I've done it, at least
for bitbake, since it was easier. If you are ok with the approach, i
will do it for yocto-docs as well.

I pushed a branch with 3 patches to bring sphinx into bitbake 1.46
branch, it's here:
https://git.openembedded.org/bitbake/log/?h=sphinx

This branch has the following commits:

Nicolas Dechesne (3):
      sphinx: import sphinx docs
      sphinx: undo (bitbake-user-manual: Remove TERM from
BB_HASHBASE_WHITELIST example)
      sphinx: partial undo (bitbake-user-manual: update perforce fetcher docs)

I can't really send this branch as inline patches, since the first
patch is huge (it contains the whole Sphinx files and the removal of
docbook..).
we could potentially squash them all, but I thought it was better to
better keep track of the thought process..

Consider this as RFC. If you are ok with it, i will prepare a similar
branch for yocto-docs, and then we can merge both branches
simultaneously. It will impact the next dunfell release obviously.. so
we should plan accordingly.

>
> cheers
> nico
>
> On Mon, Oct 12, 2020 at 2:35 PM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > hi!
> >
> > The dunfell vs gatesgarth documentation are very similar (at least for
> > yocto-docs, I haven't checked bitbake docs yet). I believe the right
> > thing to do is to backport the whole Sphinx documentation into dunfell
> > for the 3.1 next release. The net benefit is that it will be much
> > easier to backport from gatesgarth and next branches into the current
> > LTS, which we intend to support for quite a while.
> >
> > Here are the "relevant" commits in yocto-docs in each branch so far.
> > Note that I have removed all commits about SPDX headers since we want
> > these patches for sure, all non related commits (such as a few
> > .gitignore changes) and the test manual since it's new in 3.2.
> >
> > So what remains is:
> >
> > Dunfell
> > -------
> > 1a69e2c02 Documenation: Prepared for the 3.1.3 release
> > 17cc71a8f Documenation: Prepared for the 3.1.2 release
> > bd140f0f9 Documentation: Add 3.1.1 version updates missing from previous commit
> > 069c27574 Documenation: Prepared for the 3.1.1 release
> > 98687310b ref-manual: delete long-unused comments in variable glossary
> > 2deac02f2 ref-manual: Remove long-dead PACKAGE_GROUP variable
> > 7c4d45e50 ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
> > 5edeb02f5 ref-manual: IMAGE_TYPES, add tar.zst, delete elf
> > e3a746396 ref-manual: fix excessive command indentation
> >
> > Master
> > -------
> > cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
> > 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
> > 3aeca3b34 ref-manual: Add documentation for kernel-fitimage
> > 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
> > bootimg-efi
> > 08e25f2b2 ref-system-requirements: update supported hosts lists
> > afc290e85 virtual/libgbm is the provider of gbm.pc
> > e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
> > for other distros
> > 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
> > mesa-dri-devel
> > 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
> > recent changes
> > c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
> > a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa check
> > afec5770a ref-manual: delete long-unused comments in variable glossary
> > 8e5469aad ref-manual: Remove long-dead PACKAGE_GROUP variable
> > d694ff63f ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
> > 7706a240d ref-manual: IMAGE_TYPES, add tar.zst, delete elf
> > a95b49eef ref-manual: fix excessive command indentation
> >
> > Which clearly indicates that the list of differences in yocto-docs
> > between 3.1 and 3.2 is down to:
> >
> > cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
> > 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
> > 3aeca3b34 ref-manual: Add documentation for kernel-fitimage
> > 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
> > bootimg-efi
> > 08e25f2b2 ref-system-requirements: update supported hosts lists
> > afc290e85 virtual/libgbm is the provider of gbm.pc
> > e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
> > for other distros
> > 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
> > mesa-dri-devel
> > 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
> > recent changes
> > c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
> > a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa check
> >
> > I believe many (if not all??) of these patches are candidates for
> > dunfell. If that was the case that would make the migration to sphinx
> > into dunfell straight-forward..
> >
> > Otherwise, what I can propose is to 'import' the sphinx files from the
> > current master branch and 'undo' what's not needed for dunfell.
> >
> > Steve, Richard: can you have a quick look at the list of patches
> > above, and tell us which one should *not* be merged in dunfell?
> >
> > Note: I have a sphinx/dunfell branch already with an initial 'import'
> > and a few changes like each history.rst file.
> >
> > thanks
> > nico
