Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.13741.1605226557585755059
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 16:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=T5YeMkbp;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id v4so8626670edi.0
        for <docs@lists.yoctoproject.org>; Thu, 12 Nov 2020 16:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nFg2tKzFCzGltY6EF6OvVTOsnVFdSQdxDwdtO9UW394=;
        b=T5YeMkbpyzfRSANBBkI4/P02BoKsu255WRyX9qhmkpy0/zQ+rkYwLz7ykAjQMDxoNk
         gffRvrNSefiSyW5VkVjW09qAv79JyrTrBI+7TtxSkn/M3krfWYWgYAR97uFHsgsUnwZK
         kxbFTmFZBH1POhY8w0cCXEBGxQlJJn/peMM2dhqD5BgaAcm3gADgqI9oZBAN3N7pKySK
         7vN6NeDHy54m7meptYybxYt5sCI3KaiEkv/nd37ZVdDdG2mkBuCvdqUSwKTFzTilNetJ
         kNN4BqUIFgItzcM+vLEF25kK88UmT2uBKFDz8XbnK9skcB0AQih2Yqbow7h1XSKDwJeF
         L1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nFg2tKzFCzGltY6EF6OvVTOsnVFdSQdxDwdtO9UW394=;
        b=V5wQQnzSK6y759bMjJpAvkqpzTX8hRleOzaOW0atzbn6rPtzX5YBhR9JguUwL8vQ9n
         l/uQ18rvUWQa7K+M8+EpEb1dxf+O3fpsS4+9V3GAGMzNXuna+8axxZHpvAFJ9sO1PDY2
         J1A0AWuffUpbr9fydA5zlOWahHCj1W3fMo3OZ7hLn9Er+R1LSB/ZkWOt5ywL+WUBPDC8
         MFnGHkksgxF+W+gAUzwH2G8txk7xk9nP3Mm3L4E7VzO5GDq0zrjwDgxCCvOWArC9pfNt
         ayz9r50/1wPvZtImitSxquF2QBr3ePxsRRbA6duQqb2OzbuObCSB9vlZyis4mikxwFIg
         2RhQ==
X-Gm-Message-State: AOAM533FvQ48lLlSM9vSYluqZzNzJTPFAj0YSBkNp0RkglILVb+K7vJa
	PwDCDdFUl1SlNimLyQp/pQjxs7fdHdNQHdDxmwcINQ==
X-Google-Smtp-Source: ABdhPJxjVUxApKPkvwoBO69+87XnFrl+1Vj4n50iQKvYfuCTCjiCdfFViJr1DkeZTrrviGCypYCfD15wn4sbHaHdV6c=
X-Received: by 2002:a05:6402:3d9:: with SMTP id t25mr2682059edw.338.1605226555804;
 Thu, 12 Nov 2020 16:15:55 -0800 (PST)
MIME-Version: 1.0
References: <CAP71WjwQv0xcp02tgARbHtbJ4=ucSFKBy3MVdEdBL4f=vonZww@mail.gmail.com>
 <CAP71WjzYV70G_aW9kqkhuqzzZBAMHt4um2ocNL=6hrHCZGBLOQ@mail.gmail.com>
 <CAP71WjwF8V7EJs=QnJzGW3iLBs2h7-zBwuvnn-TM+tiez8Or+A@mail.gmail.com>
 <CAOSpxdZd7YPi=8oZbTqL=ZUg8dOfbjRChBxvdEdrpd5mL_PwUA@mail.gmail.com> <CAP71WjyO8o4aTc8ip2Tda3VueFhS=K82W_OQ7CaG2juk7kNn8w@mail.gmail.com>
In-Reply-To: <CAP71WjyO8o4aTc8ip2Tda3VueFhS=K82W_OQ7CaG2juk7kNn8w@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 12 Nov 2020 14:15:44 -1000
Message-ID: <CAOSpxdYj_1Zz=1M0rxV29=CLhf5toU1iiqPm4D56ZW-yGmN0sw@mail.gmail.com>
Subject: Re: Sphinx for Dunfell
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 2:05 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> On Fri, Nov 13, 2020 at 12:55 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > I'm definitely ok with it!
>
> thanks for the quick response!

That's because I'm looking forward to the switchover :-)

> > I'm getting ready to do a dunfell release sometime in the next two to three weeks, so perhaps we should make the switch immediately afterwards. Unless you'd like to live dangerously and try to get it out now :-)
>
> Well, the yocto-docs backport is a bit more work. since we have
> started to accumulate more patches than bitbake on master, and
> filtering the one we need to backport is more difficult. Also, you
> added some new docbook changes in dunfell (for each release) which
> need to be converted to sphinx.. so the more we wait, the more work
> there is! since it's just a documentation change, perhaps it can go
> into the next release, assuming the changes are ready for review
> soon'ish?

Yes, I think we should wait for the next release (3.1.5), to give us
time to complete the conversion and then review it.

Best not to rush it!

My changes to docbook for this release (3.1.4) are just the standard
history updates, no content changes.

Steve

> >
> > On Thu, Nov 12, 2020, 1:45 PM Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
> >>
> >> Steve, Richard, Quentin,
> >>
> >> On Tue, Oct 13, 2020 at 9:41 AM Nicolas Dechesne
> >> <nicolas.dechesne@linaro.org> wrote:
> >> >
> >> > hey,
> >> >
> >> > Doing the same exercise for the bitbake manual, here are the '/doc/'
> >> > commits in 3.1 vs 3.2
> >> >
> >> > git log --oneline b94dec477a8d48ebceec91952ba290798c56c1f5..origin/1.46 -- doc/
> >> > ====
> >> > 324aaa7f bitbake-user-manual-metadata.xml: fix a minor error
> >> > f92e19a3 doc: More explanation to tasks that recursively depend on themselves
> >> > e4695176 doc: Clarify how task dependencies relate to RDEPENDS
> >> > 25c5c79b user manual: properly tag content as <replaceable>
> >> > be367887 docs: delete reference to obsolete recipe-depends.dot
> >> >
> >> > git log --oneline
> >> > b94dec477a8d48ebceec91952ba290798c56c1f5..origin/master -- doc/
> >> > ====
> >> > a7c47f1e sphinx: rename Makefile.sphinx
> >> > 427721d8 sphinx: remove DocBook files
> >> > d52190ea docs: static: theme_overrides.css: fix responsive design on
> >> > <640px screens
> >> > 9ae5cce7 docs: sphinx: report errors when dependencies are not met
> >> > ec4c481a docs: update README file after migrationg to Sphinx
> >> > c87cc35a docs: sphinx: replace special quotes with double quotes
> >> > ebdeef2c docs: ref-variables: add links to terms in glossary
> >> > 29081375 bitbake-user-manual: fix bad links
> >> > a0f37789 sphinx: theme_override: Use bold for emphasis text
> >> > cbc5ca48 sphinx: theme_override: properly set font for verbatim text
> >> > 08b1ae23 sphinx: remove leading '/'
> >> > 99ba6fe9 sphinx: update style for important, caution and warnings
> >> > d99760cc sphinx: last manual round of fixes/improvements
> >> > 4f94633a sphinx: bitbake-user-manual: insert additional blank line after title
> >> > 63adcaa5 sphinx: add releases page
> >> > 3e940d93 sphinx: conf: enable extlinks extension
> >> > 9921c652 sphinx: index: move the boilerplate at the end of the page
> >> > 4e461224 sphinx: add SPDX headers
> >> > cb19159c sphinx: Enhance the sphinx experience/nagivation with:
> >> > 10a54678 sphinx: tweak html output a bit
> >> > 219b2348 sphinx: Makefile.sphinx: add clean and publish targets
> >> > 35fdc185 sphinx: fixes all remaining warnings
> >> > e11d2dd1 sphinx: fix links inside notes
> >> > 57300955 sphinx: fixup for links
> >> > fa304c01 sphinx: override theme CSS
> >> > 29af1cd2 sphinx: switch to readthedocs theme
> >> > e8359fd8 sphinx: bitbake-user-manual: use builtin sphinx glossary
> >> > 6bf6c8d6 sphinx: initial sphinx support
> >> > 84ccba0f sphinx: add initial build infrastructure
> >> > 44b57216 bitbake-user-manual: update perforce fetcher docs
> >> > 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
> >> > 7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST example
> >> > 06b5cf0a bitbake-user-manual-metadata.xml: fix a minor error
> >> > c92a266c doc: More explanation to tasks that recursively depend on themselves
> >> > caf42243 doc: Clarify how task dependencies relate to RDEPENDS
> >> > 647c13d4 user manual: properly tag content as <replaceable>
> >> > 2effbb6e docs: delete reference to obsolete recipe-depends.dot
> >> >
> >> > which indicates the following commits exist in 3.2 and not in 3.1
> >> > (again, I am filtering out sphinx changes):
> >> >
> >> > 44b57216 bitbake-user-manual: update perforce fetcher docs
> >> > 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
> >> > 7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST example
> >> >
> >> > Out of these three changes, I think only:
> >> > 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
> >> >
> >> > Should be backported to 1.46 branch since it applies to 3.1, the other
> >> > 2 changes are only for 3.2. To bring Sphinx docs into 1.46 branch, I
> >> > could import the Sphinx files from master branch, and 'undo' these 2
> >> > commits.
> >>
> >> I finally came back to this dunfell backport.. I've done it, at least
> >> for bitbake, since it was easier. If you are ok with the approach, i
> >> will do it for yocto-docs as well.
> >>
> >> I pushed a branch with 3 patches to bring sphinx into bitbake 1.46
> >> branch, it's here:
> >> https://git.openembedded.org/bitbake/log/?h=sphinx
> >>
> >> This branch has the following commits:
> >>
> >> Nicolas Dechesne (3):
> >>       sphinx: import sphinx docs
> >>       sphinx: undo (bitbake-user-manual: Remove TERM from
> >> BB_HASHBASE_WHITELIST example)
> >>       sphinx: partial undo (bitbake-user-manual: update perforce fetcher docs)
> >>
> >> I can't really send this branch as inline patches, since the first
> >> patch is huge (it contains the whole Sphinx files and the removal of
> >> docbook..).
> >> we could potentially squash them all, but I thought it was better to
> >> better keep track of the thought process..
> >>
> >> Consider this as RFC. If you are ok with it, i will prepare a similar
> >> branch for yocto-docs, and then we can merge both branches
> >> simultaneously. It will impact the next dunfell release obviously.. so
> >> we should plan accordingly.
> >>
> >> >
> >> > cheers
> >> > nico
> >> >
> >> > On Mon, Oct 12, 2020 at 2:35 PM Nicolas Dechesne
> >> > <nicolas.dechesne@linaro.org> wrote:
> >> > >
> >> > > hi!
> >> > >
> >> > > The dunfell vs gatesgarth documentation are very similar (at least for
> >> > > yocto-docs, I haven't checked bitbake docs yet). I believe the right
> >> > > thing to do is to backport the whole Sphinx documentation into dunfell
> >> > > for the 3.1 next release. The net benefit is that it will be much
> >> > > easier to backport from gatesgarth and next branches into the current
> >> > > LTS, which we intend to support for quite a while.
> >> > >
> >> > > Here are the "relevant" commits in yocto-docs in each branch so far.
> >> > > Note that I have removed all commits about SPDX headers since we want
> >> > > these patches for sure, all non related commits (such as a few
> >> > > .gitignore changes) and the test manual since it's new in 3.2.
> >> > >
> >> > > So what remains is:
> >> > >
> >> > > Dunfell
> >> > > -------
> >> > > 1a69e2c02 Documenation: Prepared for the 3.1.3 release
> >> > > 17cc71a8f Documenation: Prepared for the 3.1.2 release
> >> > > bd140f0f9 Documentation: Add 3.1.1 version updates missing from previous commit
> >> > > 069c27574 Documenation: Prepared for the 3.1.1 release
> >> > > 98687310b ref-manual: delete long-unused comments in variable glossary
> >> > > 2deac02f2 ref-manual: Remove long-dead PACKAGE_GROUP variable
> >> > > 7c4d45e50 ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
> >> > > 5edeb02f5 ref-manual: IMAGE_TYPES, add tar.zst, delete elf
> >> > > e3a746396 ref-manual: fix excessive command indentation
> >> > >
> >> > > Master
> >> > > -------
> >> > > cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
> >> > > 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
> >> > > 3aeca3b34 ref-manual: Add documentation for kernel-fitimage
> >> > > 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
> >> > > bootimg-efi
> >> > > 08e25f2b2 ref-system-requirements: update supported hosts lists
> >> > > afc290e85 virtual/libgbm is the provider of gbm.pc
> >> > > e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
> >> > > for other distros
> >> > > 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
> >> > > mesa-dri-devel
> >> > > 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
> >> > > recent changes
> >> > > c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
> >> > > a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa check
> >> > > afec5770a ref-manual: delete long-unused comments in variable glossary
> >> > > 8e5469aad ref-manual: Remove long-dead PACKAGE_GROUP variable
> >> > > d694ff63f ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
> >> > > 7706a240d ref-manual: IMAGE_TYPES, add tar.zst, delete elf
> >> > > a95b49eef ref-manual: fix excessive command indentation
> >> > >
> >> > > Which clearly indicates that the list of differences in yocto-docs
> >> > > between 3.1 and 3.2 is down to:
> >> > >
> >> > > cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
> >> > > 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
> >> > > 3aeca3b34 ref-manual: Add documentation for kernel-fitimage
> >> > > 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
> >> > > bootimg-efi
> >> > > 08e25f2b2 ref-system-requirements: update supported hosts lists
> >> > > afc290e85 virtual/libgbm is the provider of gbm.pc
> >> > > e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
> >> > > for other distros
> >> > > 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
> >> > > mesa-dri-devel
> >> > > 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
> >> > > recent changes
> >> > > c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
> >> > > a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa check
> >> > >
> >> > > I believe many (if not all??) of these patches are candidates for
> >> > > dunfell. If that was the case that would make the migration to sphinx
> >> > > into dunfell straight-forward..
> >> > >
> >> > > Otherwise, what I can propose is to 'import' the sphinx files from the
> >> > > current master branch and 'undo' what's not needed for dunfell.
> >> > >
> >> > > Steve, Richard: can you have a quick look at the list of patches
> >> > > above, and tell us which one should *not* be merged in dunfell?
> >> > >
> >> > > Note: I have a sphinx/dunfell branch already with an initial 'import'
> >> > > and a few changes like each history.rst file.
> >> > >
> >> > > thanks
> >> > > nico
